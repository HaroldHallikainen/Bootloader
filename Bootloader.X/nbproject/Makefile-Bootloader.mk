#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-Bootloader.mk)" "nbproject/Makefile-local-Bootloader.mk"
include nbproject/Makefile-local-Bootloader.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Bootloader
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/Bootloader/bootloader/bootloader.c ../src/config/Bootloader/peripheral/clk/plib_clk.c ../src/config/Bootloader/peripheral/coretimer/plib_coretimer.c ../src/config/Bootloader/peripheral/evic/plib_evic.c ../src/config/Bootloader/peripheral/gpio/plib_gpio.c ../src/config/Bootloader/peripheral/nvm/plib_nvm.c ../src/config/Bootloader/peripheral/tmr/plib_tmr2.c ../src/config/Bootloader/peripheral/uart/plib_uart1.c ../src/config/Bootloader/peripheral/wdt/plib_wdt.c ../src/config/Bootloader/initialization.c ../src/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1204855844/bootloader.o ${OBJECTDIR}/_ext/297513190/plib_clk.o ${OBJECTDIR}/_ext/974286902/plib_coretimer.o ${OBJECTDIR}/_ext/633043527/plib_evic.o ${OBJECTDIR}/_ext/633097355/plib_gpio.o ${OBJECTDIR}/_ext/297524073/plib_nvm.o ${OBJECTDIR}/_ext/297529565/plib_tmr2.o ${OBJECTDIR}/_ext/633500298/plib_uart1.o ${OBJECTDIR}/_ext/297532171/plib_wdt.o ${OBJECTDIR}/_ext/1591581672/initialization.o ${OBJECTDIR}/_ext/1360937237/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1204855844/bootloader.o.d ${OBJECTDIR}/_ext/297513190/plib_clk.o.d ${OBJECTDIR}/_ext/974286902/plib_coretimer.o.d ${OBJECTDIR}/_ext/633043527/plib_evic.o.d ${OBJECTDIR}/_ext/633097355/plib_gpio.o.d ${OBJECTDIR}/_ext/297524073/plib_nvm.o.d ${OBJECTDIR}/_ext/297529565/plib_tmr2.o.d ${OBJECTDIR}/_ext/633500298/plib_uart1.o.d ${OBJECTDIR}/_ext/297532171/plib_wdt.o.d ${OBJECTDIR}/_ext/1591581672/initialization.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1204855844/bootloader.o ${OBJECTDIR}/_ext/297513190/plib_clk.o ${OBJECTDIR}/_ext/974286902/plib_coretimer.o ${OBJECTDIR}/_ext/633043527/plib_evic.o ${OBJECTDIR}/_ext/633097355/plib_gpio.o ${OBJECTDIR}/_ext/297524073/plib_nvm.o ${OBJECTDIR}/_ext/297529565/plib_tmr2.o ${OBJECTDIR}/_ext/633500298/plib_uart1.o ${OBJECTDIR}/_ext/297532171/plib_wdt.o ${OBJECTDIR}/_ext/1591581672/initialization.o ${OBJECTDIR}/_ext/1360937237/main.o

# Source Files
SOURCEFILES=../src/config/Bootloader/bootloader/bootloader.c ../src/config/Bootloader/peripheral/clk/plib_clk.c ../src/config/Bootloader/peripheral/coretimer/plib_coretimer.c ../src/config/Bootloader/peripheral/evic/plib_evic.c ../src/config/Bootloader/peripheral/gpio/plib_gpio.c ../src/config/Bootloader/peripheral/nvm/plib_nvm.c ../src/config/Bootloader/peripheral/tmr/plib_tmr2.c ../src/config/Bootloader/peripheral/uart/plib_uart1.c ../src/config/Bootloader/peripheral/wdt/plib_wdt.c ../src/config/Bootloader/initialization.c ../src/main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-Bootloader.mk ${DISTDIR}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ0512EFE064
MP_LINKER_FILE_OPTION=,--script="..\src\config\Bootloader\btl.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1204855844/bootloader.o: ../src/config/Bootloader/bootloader/bootloader.c  .generated_files/flags/Bootloader/29688c037f8d19aff7b3d32957183e054a16cbef .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/1204855844" 
	@${RM} ${OBJECTDIR}/_ext/1204855844/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/1204855844/bootloader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1204855844/bootloader.o.d" -o ${OBJECTDIR}/_ext/1204855844/bootloader.o ../src/config/Bootloader/bootloader/bootloader.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/297513190/plib_clk.o: ../src/config/Bootloader/peripheral/clk/plib_clk.c  .generated_files/flags/Bootloader/d83ccf51463514e351098982896fa260e5337c11 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/297513190" 
	@${RM} ${OBJECTDIR}/_ext/297513190/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/297513190/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/297513190/plib_clk.o.d" -o ${OBJECTDIR}/_ext/297513190/plib_clk.o ../src/config/Bootloader/peripheral/clk/plib_clk.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/974286902/plib_coretimer.o: ../src/config/Bootloader/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/Bootloader/c7e7145c2bec8232e6235eadebb1b901b2ba3463 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/974286902" 
	@${RM} ${OBJECTDIR}/_ext/974286902/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/974286902/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/974286902/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/974286902/plib_coretimer.o ../src/config/Bootloader/peripheral/coretimer/plib_coretimer.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/633043527/plib_evic.o: ../src/config/Bootloader/peripheral/evic/plib_evic.c  .generated_files/flags/Bootloader/e58edb45595c2102dec2d626e2033c3359a40e7f .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/633043527" 
	@${RM} ${OBJECTDIR}/_ext/633043527/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/633043527/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/633043527/plib_evic.o.d" -o ${OBJECTDIR}/_ext/633043527/plib_evic.o ../src/config/Bootloader/peripheral/evic/plib_evic.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/633097355/plib_gpio.o: ../src/config/Bootloader/peripheral/gpio/plib_gpio.c  .generated_files/flags/Bootloader/ec2baf2eefe3917e8cf537ef648951612df3c5f1 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/633097355" 
	@${RM} ${OBJECTDIR}/_ext/633097355/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/633097355/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/633097355/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/633097355/plib_gpio.o ../src/config/Bootloader/peripheral/gpio/plib_gpio.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/297524073/plib_nvm.o: ../src/config/Bootloader/peripheral/nvm/plib_nvm.c  .generated_files/flags/Bootloader/fccaeb8dc4db4585d7b50890644f7e82a63d2b31 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/297524073" 
	@${RM} ${OBJECTDIR}/_ext/297524073/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/297524073/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/297524073/plib_nvm.o.d" -o ${OBJECTDIR}/_ext/297524073/plib_nvm.o ../src/config/Bootloader/peripheral/nvm/plib_nvm.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/297529565/plib_tmr2.o: ../src/config/Bootloader/peripheral/tmr/plib_tmr2.c  .generated_files/flags/Bootloader/8764b73c5e86e992cc82c5560730e2bc6a4259de .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/297529565" 
	@${RM} ${OBJECTDIR}/_ext/297529565/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/297529565/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/297529565/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/297529565/plib_tmr2.o ../src/config/Bootloader/peripheral/tmr/plib_tmr2.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/633500298/plib_uart1.o: ../src/config/Bootloader/peripheral/uart/plib_uart1.c  .generated_files/flags/Bootloader/f3cad552f417214f7ca39bed914be86e288183a2 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/633500298" 
	@${RM} ${OBJECTDIR}/_ext/633500298/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/633500298/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/633500298/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/633500298/plib_uart1.o ../src/config/Bootloader/peripheral/uart/plib_uart1.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/297532171/plib_wdt.o: ../src/config/Bootloader/peripheral/wdt/plib_wdt.c  .generated_files/flags/Bootloader/440c11031faa39e0e3108e62aea8a5c547d65a56 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/297532171" 
	@${RM} ${OBJECTDIR}/_ext/297532171/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/297532171/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/297532171/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/297532171/plib_wdt.o ../src/config/Bootloader/peripheral/wdt/plib_wdt.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1591581672/initialization.o: ../src/config/Bootloader/initialization.c  .generated_files/flags/Bootloader/4fa963207e7651185b1fc513a087af8224144066 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/1591581672" 
	@${RM} ${OBJECTDIR}/_ext/1591581672/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1591581672/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1591581672/initialization.o.d" -o ${OBJECTDIR}/_ext/1591581672/initialization.o ../src/config/Bootloader/initialization.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/Bootloader/d5c3dfbba0495e81215e3c6e343c282005d50f19 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1204855844/bootloader.o: ../src/config/Bootloader/bootloader/bootloader.c  .generated_files/flags/Bootloader/c681b959968c50cd753f504768b222a230b9518c .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/1204855844" 
	@${RM} ${OBJECTDIR}/_ext/1204855844/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/1204855844/bootloader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1204855844/bootloader.o.d" -o ${OBJECTDIR}/_ext/1204855844/bootloader.o ../src/config/Bootloader/bootloader/bootloader.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/297513190/plib_clk.o: ../src/config/Bootloader/peripheral/clk/plib_clk.c  .generated_files/flags/Bootloader/46e253246ad3f5e76395b25f7736f5c841eddea9 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/297513190" 
	@${RM} ${OBJECTDIR}/_ext/297513190/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/297513190/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/297513190/plib_clk.o.d" -o ${OBJECTDIR}/_ext/297513190/plib_clk.o ../src/config/Bootloader/peripheral/clk/plib_clk.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/974286902/plib_coretimer.o: ../src/config/Bootloader/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/Bootloader/7e8a04590798b0635382734db58aaa9bf98d3e97 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/974286902" 
	@${RM} ${OBJECTDIR}/_ext/974286902/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/974286902/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/974286902/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/974286902/plib_coretimer.o ../src/config/Bootloader/peripheral/coretimer/plib_coretimer.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/633043527/plib_evic.o: ../src/config/Bootloader/peripheral/evic/plib_evic.c  .generated_files/flags/Bootloader/f13fea31a5ee033c960bddd36067662d2878e799 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/633043527" 
	@${RM} ${OBJECTDIR}/_ext/633043527/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/633043527/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/633043527/plib_evic.o.d" -o ${OBJECTDIR}/_ext/633043527/plib_evic.o ../src/config/Bootloader/peripheral/evic/plib_evic.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/633097355/plib_gpio.o: ../src/config/Bootloader/peripheral/gpio/plib_gpio.c  .generated_files/flags/Bootloader/1b3eda0795ee41327f3af7e40a9fe1f3abb0f0d2 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/633097355" 
	@${RM} ${OBJECTDIR}/_ext/633097355/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/633097355/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/633097355/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/633097355/plib_gpio.o ../src/config/Bootloader/peripheral/gpio/plib_gpio.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/297524073/plib_nvm.o: ../src/config/Bootloader/peripheral/nvm/plib_nvm.c  .generated_files/flags/Bootloader/8c1c1a1fec100f3350c76e1eb8bb8d7d59b6fec0 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/297524073" 
	@${RM} ${OBJECTDIR}/_ext/297524073/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/297524073/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/297524073/plib_nvm.o.d" -o ${OBJECTDIR}/_ext/297524073/plib_nvm.o ../src/config/Bootloader/peripheral/nvm/plib_nvm.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/297529565/plib_tmr2.o: ../src/config/Bootloader/peripheral/tmr/plib_tmr2.c  .generated_files/flags/Bootloader/c187573dd819cbf178f9b87191fa769933b38070 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/297529565" 
	@${RM} ${OBJECTDIR}/_ext/297529565/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/297529565/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/297529565/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/297529565/plib_tmr2.o ../src/config/Bootloader/peripheral/tmr/plib_tmr2.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/633500298/plib_uart1.o: ../src/config/Bootloader/peripheral/uart/plib_uart1.c  .generated_files/flags/Bootloader/3af88d7e966610f4546d4a879017ad3c8832ff09 .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/633500298" 
	@${RM} ${OBJECTDIR}/_ext/633500298/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/633500298/plib_uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/633500298/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/633500298/plib_uart1.o ../src/config/Bootloader/peripheral/uart/plib_uart1.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/297532171/plib_wdt.o: ../src/config/Bootloader/peripheral/wdt/plib_wdt.c  .generated_files/flags/Bootloader/a557f982a86219b4633ca1115fc79e2f9799bf5d .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/297532171" 
	@${RM} ${OBJECTDIR}/_ext/297532171/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/297532171/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/297532171/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/297532171/plib_wdt.o ../src/config/Bootloader/peripheral/wdt/plib_wdt.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1591581672/initialization.o: ../src/config/Bootloader/initialization.c  .generated_files/flags/Bootloader/3b30aad9a125d310e2fc0bf42f1c6a3da530f1f .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/1591581672" 
	@${RM} ${OBJECTDIR}/_ext/1591581672/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1591581672/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1591581672/initialization.o.d" -o ${OBJECTDIR}/_ext/1591581672/initialization.o ../src/config/Bootloader/initialization.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/Bootloader/20aeb3b7e966cd29d591d5716986bac113c2ac2c .generated_files/flags/Bootloader/81bc5fc5a660e0b86762e654f4f91d7af1decfb7
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/Bootloader" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/Bootloader/btl.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/Bootloader/btl.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Bootloader.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_Bootloader=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/Bootloader.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
