/*******************************************************************************
  UART Bootloader Source File

  File Name:
    bootloader.c

  Summary:
    This file contains source code necessary to execute UART bootloader.

  Description:
    This file contains source code necessary to execute UART bootloader.
    It implements bootloader protocol which uses UART peripheral to download
    application firmware into internal flash from HOST-PC.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *******************************************************************************/
// DOM-IGNORE-END

#include "definitions.h"
#include <device.h>
#include "bootloader.h"


// #define APP_START_ADDRESS       (PA_TO_KVA0(0x1d000000UL)) // Translate physical address to virtual address
#define APP_START_ADDRESS       (PA_TO_KVA0(0x1d000200UL)) // app_mz.ld says _RESET_ADDR = 0xBD000200; hh 12/29/23
#define XON  0x11
#define XOFF 0x13

void InterpretIntelHex(uint8_t c);  // Pass in character, interpret, and send to program flash
void LedCounter(uint8_t n);  // Light up front panel LEDs in binary as a bootload status indicator
void UartWriteString(char *pString);  // Send string to uart

void UartWriteString(char *pString){
  while(*pString){
    UART1_WriteByte((int)*pString++);
  }
}

void run_Application(void){
  uint32_t msp  = *(uint32_t *)(APP_START_ADDRESS); // Put contents of app start address in msp
  void (*fptr)(void);
  fptr = (void (*)(void))APP_START_ADDRESS; //  Set default to APP_RESET_ADDRESS 
  if (msp == 0xffffffff){
    return;                               // Get out if application start word is erased and not programmed
  }
  fptr();
}



void bootloader_Task(void)
{
  LedCounter(0xff);           // Light all LEDs on entering bootloader
  while(0==MARK_HI_TOGGLEn_Get()){  // Loop here until button released
     WDT_Clear(); 
  }   
  UartWriteString("\r\nBootloader ready. Send hex file.\r\n");
  while (1){
    if(UART1_ReceiverIsReady()){  // Character waiting in uart
      InterpretIntelHex((uint8_t) UART1_ReadByte());  // Go interpret character and send to program flash
    }else{
      WDT_Clear(); 
    }
  }
}


// Pass in a character at a time. Returns a count of errors.

// Interpreting Intel Hex.
// This is tricky since Intel Hex was designed for 8 bit data and we have 32 bit data.

// Record Structure:
// StartCode (colon) - 1 character
// DataCount - 2 characters. How many bytes of data in record. Typically 0x10.
// AddressLow - 4 characters. This assumes byte addressing, but we have word addressing. Big Endian (msb first)
// RecordType - 2 characters
// Data - Typically 16 characters or 8 words of 32 bit data. It is sent little endian. On the PIC24, the MSB is 0x00 
// Checksum - 2 characters. Two's complement of everything except StartCode and CheckSum.

// RecordType:
// 00 - Data record
// 01 - End of file
// 04 - Extended Linear Address Record. LowAddress field is 0x0000. ByteCount is 0x02. Data is AddressHigh in big endian.
// After ELA record, address is ((AddressHigh<<16)+AddressLow)>>1.

// Sample hex records (spaces added for clarity):

//: 02 0000 04 00 00 fa
// 2 data bytes, AddressLow=0x0000, ELA record, AddressHigh=0x0000, checksum=0xfa (2+4=6. -6=0xfa)

//: 08 0000 00 42020400 00000000 b0
// 8 data bytes (2 32 bit instructions or 4 16 bit addresses). AddressLow=0x0000. First 32 bit word is 0x00402042.
// Second 32 bit word is 0x00000000. Checksum is 0xb0

//: 10 0400 00 91018800 9080ba00 1000ba00 00000600 38
// 16 data bytes (4 32 bit words after decode). AddressLow=0x400. Data is 0x00880191 to address 0x200 (400>>1), 
// 00ba8090 to address 0x202, 00ba0010 to address 0x204, and 00060000 to address 0x206. Checksum is 0x38

//: 02 0000 04 0001 F9
// 2 data bytes, ELA=0x0001. Checksum=0xf9

//:10 0000 00 4D4B5600 BA365100 BC81D300 8FD5E700 66
// First byte has AddressLow of 0x0000. From ELA above, save at ((AddrH<<16)+AddrL)>>1. This is (0x10000 + 0x8000. So,
// we should put 0x00564b4d in address 0x8000.

// Function Prototypes
uint8_t HexCharToBin(uint8_t c);  // Convert ascii character c to 4 bit binary result
uint8_t TwoHexCharToBin(uint8_t *pstring);  // convert the character pointed to by pstring and the next character to binary. The first character holds the msb.
uint16_t FourHexCharToBinBigEndian(uint8_t *pstring); // convert the four hex ascii characters to binary. Assume MSB first
uint32_t EightHexCharToBinLittleEndian(uint8_t *pstring);// convert the eight hex characters pointed to by pstring to binary. First two characters are LSB. Left character is high half of LSB byte.
void InterpretIntelHex(uint8_t c);// Receive characater c and return error count. We'll buffer the whole line, then do the checksum and interpret it.
unsigned int NVMUnlock(unsigned int nvmop); // adapted from https://ww1.microchip.com/downloads/en/DeviceDoc/60001121g.pdf . Common nvmops are 0x4005 to erase program flash, 
                                            // 0x4003 to program a row and 0x4001 to program a word.



void InterpretIntelHex(uint8_t c){
// Receive characater c and return error count. We'll buffer the whole line, then do the checksum, interpret it, and send to program flash
static uint16_t ELA=0;          // Extended Linear Address set by record type 4
static uint8_t index=0;
static uint8_t count=0xff;      // set to ff on start to insure we don't accidentally think we're at the end of the record
static int AppFlashErased=0;   // Only erase once
uint8_t n;                      // Count bytes as we send them to program flash
static uint8_t LineBuf[200];
uint16_t RecordAddr;          // set by current record, so does not need to be static
uint32_t DestAddr;            // calculated from ELA and RecordAddr
static uint8_t LineCount=0;   // Something to drive front panel LEDs
static int ErrorCount=0;      // How many checksum errors we got
uint8_t CheckSum;               // Checksum of this hex record
uint8_t *pString;             // Pointer into hex record string
  WDT_Clear();                // Clear the WDT
  if(c==':') index=0;         // start of record
  if(LineBuf[0]!=':') index=0;  // reset input to wait for start of record
  LineBuf[index]=c;           // save incoming character
  if(index==8){               // we just saved second character of the record byte in [8]
    count=10+(2*TwoHexCharToBin(&LineBuf[1])); // When index==count, we've read in the second checksum character
  }
  if(index==count){           // We just got the second checksum byte
    count=5+TwoHexCharToBin(&LineBuf[1]);   // Number of bytes in record plus 5 (count, addrh, addrl, type, cs)
    pString=&LineBuf[1];      // point to the character after the colon
    CheckSum=0;
    while(count--){
      CheckSum+=TwoHexCharToBin(pString); // add the binary equivalent of each hex character pair
      pString+=2;             // move to the next pair
    } 
    if(CheckSum==0){          // we're good! Decide what to do based on record type
      UART1_WriteByte((int)XOFF);   // Stop host from sending
      pString=&LineBuf[9];    // point to start of data
      switch(TwoHexCharToBin(&LineBuf[7])){   // Do stuff based on record type
        case 0x00:            // this is a normal data record
          count=TwoHexCharToBin(&LineBuf[1]); // How many data bytes are in record.
          RecordAddr=FourHexCharToBinBigEndian(&LineBuf[3]); // get address field from record
          DestAddr=((((uint32_t)ELA)<<16)+((uint32_t)RecordAddr)); // Figure out pic or dsp BYTE address this record starts at.
          if((DestAddr>=0x1d000000)&& ((DestAddr+count)<=0x1d07ffff)){   // DestAddr is in application area of physical memory map (not VMA). Since DestAddr is first address of record, chedk to make sure DestAddr+Count is in range
            if(0==AppFlashErased){                      // Have not erased it yet
              AppFlashErased=1;
              NVMUnlock(0x4005);                        // Erase application flash
              UartWriteString("\r\nProgram flash erased\r\n");
            }
            n=0;                                        // Get ready to count bytes out of hex string
            while(n<count){
              NVMDATA0=EightHexCharToBinLittleEndian(pString); // Get the data
              NVMADDR=DestAddr;                         // And the address
              NVMUnlock(0x4001);                        // Program the word
              n+=4;                                     // n and count are counts of bytes in the record, generally 16. Each 32 bit word uses 4 of these bytes
              DestAddr+=4;                              // and 4 bytes of address space (32 bit word)
              pString+=8;                               // Point to next 8 characters
            }
            LedCounter(LineCount++);                    // Show progress on front panel LEDs
          }// endif address in range
          break;
        case 0x01:            // end of file, run the application
          UartWriteString("\r\nBootload complete.\r\n");
          if(0==ErrorCount){
            UartWriteString("\r\nNo hex file checksum errors\r\nRunning Application\r\n");
            run_Application();
            UartWriteString("\r\nFirst word of application not programmed. Quitting.\r\n");
            while(1){
              WDT_Clear();  // Wait here until system reset
            }
          }else{
            UartWriteString("\r\nThere were hex file checksum errors. Quitting.\r\n");
            while(1){
              WDT_Clear();  // Wait here until system reset
            }
          }
          break;
        case 0x04:            // Extended Linear Address
          ELA=FourHexCharToBinBigEndian(&LineBuf[9]); // Pull the ELA out of the data portion of the record big endian
          if(0==AppFlashErased){                      // Have not erased it yet
            AppFlashErased=1;
            NVMUnlock(0x4005);                        // Erase application flash
            UartWriteString("\r\nProgram flash erased\r\n");
          }
          break;
        default:
          
          break;
      }// end switch
    }else{
      ErrorCount++;   // Increment error counter on bad checksum
    }
    index=0;    // start over
    count=0xff; // start with a high count until the count bytes come in
    UART1_WriteByte((int)XON);  // Let host start sending again  
  }else{                       // we did not just get the second checksum byte, so bump the index
    index++;
  }  
  if(index>=sizeof(LineBuf)){ // too much data
    index=0;                  // start over
  }
  if(U1STAbits.OERR){
    UartWriteString("\r\nOverrun Error\r\n");
    while(1){
      WDT_Clear();  // Wait here until system reset
    }
  }
}



uint8_t HexCharToBin(uint8_t c){
// Convert ascii character c to 4 bit binary result
uint8_t result;
  result=c;
  if(result<='9')  // it's a number
    result+=7;      // add 7. 0x30 becomes 0x37
  result+=9;      // add 9. 0x30 became 0x37 and now becomes 0x40. 'A' was 0x41 now becomes 0x4a
  result=result & 0x0f; // mask leaving 4 lsb
  return(result);
}

uint8_t TwoHexCharToBin(uint8_t *pstring){
// convert the character pointed to by pstring and the next character to binary. The first character holds the msb.
// pstring passed by reference, so even though it changes here, it does not change in calling code. 
uint8_t result;
  result=HexCharToBin(*pstring); // convert the first character
  result=result<<4;             // shift to high nybble
  pstring++;                     // point to the next character
  result=result+HexCharToBin(*pstring); // add in the low half
  pstring++;                    // Exit with pstring pointing to next character
  return(result);
}

uint16_t FourHexCharToBinBigEndian(uint8_t *pstring){
// convert the four hex ascii characters to binary. Assume MSB first.
// pstring passed by reference, so even though it changes here, it does not change in calling code. 
uint16_t result;
  result=(uint16_t) TwoHexCharToBin(pstring);
  result=result<<8;
  pstring+=2;           // move down two characters
  result+=(uint16_t) TwoHexCharToBin(pstring);
  pstring+=2;           // Exit ready to point to next character
  return(result);
}

uint32_t EightHexCharToBinLittleEndian(uint8_t *pstring){
// convert the eight hex characters pointed to by pstring to binary. First two characters are LSB. Left character is high half of LSB byte.
// pstring passed by reference, so even though it changes here, it does not change in calling code. 
union{
  uint32_t u32;
  uint8_t u8[4];
}result;
uint8_t n;
  for(n=0;n<4;n++){
    result.u8[n]=TwoHexCharToBin(pstring);    // convert two chars at a time putting earlier chars in lsb
    pstring+=2;                               // point to the next two characters
  }
  return(result.u32);
}

unsigned int NVMUnlock(unsigned int nvmop){
// adapted from https://ww1.microchip.com/downloads/en/DeviceDoc/60001121g.pdf . Common nvmops are 0x4005 to erase program flash, 
// 0x4003 to program a row and 0x4001 to program a word.
  unsigned int status;
  asm volatile ("di %0" : "=r" (status));   // Suspend or Disable all Interrupts
  // Enable Flash Write/Erase Operations and Select
  // Flash operation to perform
  NVMCON=nvmop;   // set up operation
  NVMKEY=0xaa996655;
  NVMKEY=0x556699aa;  // send keys
  NVMCONSET=0x8000;   // start operation
  while(NVMCON & 0x8000); // wait until done
  // Restore Interrupts
  if (status & 0x00000001){
    asm volatile ("ei");
  }else{
    asm volatile ("di");
  }  
  NVMCONCLR=0x4000;   // Disable write
  return(NVMCON & 0x3000); // return nvmerr and lvderr status bits
}

void LedCounter(uint8_t n){
  // Light up front panel LEDs in binary as a bootload status indicator
  if(0 == (1&n)){   // lsb clear
    TX_LED_Clear();
  }else{
    TX_LED_Set();
  }
  if(0 == (2&n)){
    KOS_LED_Clear();
  }else{
    KOS_LED_Set();
  }
  if(0 == (4&n)){
    MOTOR_LED_Clear();
  }else{
    MOTOR_LED_Set();
  }
  if(0 == (8&n)){
    AUTOSTART_LED_Clear();
  }else{
    AUTOSTART_LED_Set();
  }
  if(0 == (0x10&n)){
    SHIFT_850_LED_Clear();
  }else{
    SHIFT_850_LED_Set();
  }
  if(0 == (0x20&n)){
    MARK_HI_LED_Clear();
  }else{
    MARK_HI_LED_Set();
  }
}
