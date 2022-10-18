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
DB += MCTMONO01_stripe_selection.db
DB += MCTMONO01_bandwidth_selection.db
DB += MCTMONO01_offset_selection.db
DB += MCTVBM01_stripe_selection.db
DB += MCT_config_control_seq.db
DB += MCTVBM01_target.db
DB += MCTMONO01_park.db
DB += MCTVBM01_park.db
DB += MCT_compare_trigger.template
DB += MCT_compare_single.template
DB += MCT_compare_component.template
DB += MCT_compare.substitutions


#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

