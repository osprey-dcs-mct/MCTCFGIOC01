TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += MCT_config_user_inputs.db
DB += MCT_opt_scan.db
DB += MCT_energy_calibrations.db
DB += MCT_DMM_stripe_selection.db
DB += MCT_DMM_bandwidth_selection.db
DB += MCT_VBM_stripe_selection.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

