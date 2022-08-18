#!../../bin/linux-x86_64/MCTCFGIOC01

#- You may have to change MCTCFGIOC01 to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("IOCNAME", "MCTCFGIOC01")
epicsEnvSet("PREFIX", "MCTCFG01:")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/MCTCFGIOC01.dbd"
MCTCFGIOC01_registerRecordDeviceDriver pdbbase

## Autosave set-up
#
< ${AUTOSAVESETUP}/crapi/save_restore.cmd

## Restore auto save like this ....
set_pass0_restoreFile("info_settings.sav")
set_pass1_restoreFile("info_settings.sav")
set_pass0_restoreFile("info_positions.sav")

## Load record instances
dbLoadRecords("db/MCT_config_user_inputs.db", "P=$(PREFIX)")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Autosave monitor set-up.
#
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "")
create_monitor_set("info_settings.req", 15, "")
