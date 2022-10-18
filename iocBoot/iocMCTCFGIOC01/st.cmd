#!../../bin/linux-x86_64/MCTCFGIOC01

#- You may have to change MCTCFGIOC01 to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("IOCNAME", "MCTCFGIOC01")
epicsEnvSet("PREFIX", "MCTCFG01:")
epicsEnvSet("AS_PATH", "/asp/autosave/$(IOCNAME)")

# Stop the messages about multiple hosts
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.244.115.255")

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
dbLoadRecords("db/MCT_opt_scan.db", "P=$(PREFIX)")
dbLoadRecords("db/MCT_energy_calibrations.db", "P=$(PREFIX)")
dbLoadRecords("db/MCTMONO01_stripe_selection.db", "P=$(PREFIX)")
dbLoadRecords("db/MCTMONO01_bandwidth_selection.db", "P=$(PREFIX)")
dbLoadRecords("db/MCTMONO01_offset_selection.db", "P=$(PREFIX)")
dbLoadRecords("db/MCTVBM01_stripe_selection.db", "P=$(PREFIX)")
dbLoadRecords("db/MCT_config_control_seq.db", "P=$(PREFIX)")
dbLoadRecords("db/MCTVBM01_target.db", "P=$(PREFIX)")
dbLoadRecords("db/MCTVBM01_park.db", "P=MCTVBM01:")
dbLoadRecords("db/MCTMONO01_park.db", "P=MCTMONO01:")
#End of scan save / compare positions
dbLoadTemplate("db/MCT_compare.substitutions","P=$(PREFIX)")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Autosave monitor set-up.
#
cd "$(AS_PATH)"
makeAutosaveFiles()

set_requestfile_path("${AS_PATH}")
create_monitor_set("info_positions.req", 5, "")
create_monitor_set("info_settings.req", 15, "")

# Start the sequence program
seq mct_config_control "P=$(PREFIX)"

#Wait for PVs to connect before loading settings
epicsThreadSleep 2
dbpf $(PREFIX)MONO01_OPT_SCAN_PARMS.LOAD 1

