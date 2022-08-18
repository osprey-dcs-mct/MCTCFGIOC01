TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = MCTCFGIOC01
# MCTCFGIOC01.dbd will be created and installed
DBD += MCTCFGIOC01.dbd

# MCTCFGIOC01.dbd will be made up from these files:
MCTCFGIOC01_DBD += base.dbd

# Include dbd files from all support applications:
MCTCFGIOC01_DBD += asSupport.dbd sscanSupport.dbd sscanProgressSupport.dbd

# Add all the support libraries needed by this IOC
MCTCFGIOC01_LIBS += autosave sscan scanProgress

# MCTCFGIOC01_registerRecordDeviceDriver.cpp derives from MCTCFGIOC01.dbd
MCTCFGIOC01_SRCS += MCTCFGIOC01_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
MCTCFGIOC01_SRCS_DEFAULT += MCTCFGIOC01Main.cpp
MCTCFGIOC01_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#MCTCFGIOC01_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
MCTCFGIOC01_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

