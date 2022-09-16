# MCTCFGOC01

## Summary

IOC for managing beamline configuration.

## Details

### User inputs

The user provides a set of inputs that the application uses to configure the
beamline. Some items are pre-calculated to default values (e.g., DMM stripe,
VBM critical energy), but these can be overridden by the user.

### Component movements

A sequence program handles the movement of all components. When the user
initiates the sequence, it determines what order to move components in to avoid
white beam exposure on any unprotected surfaces. A message PV provides updates
about the stage of the configuration. In most cases, the sequence program
relies on external applications to calculate the detailed movement requirements
for each component.

The user can request that the process be stopped at any stage. This will stop
any movement currently in progress, and will stop any future movements.

## UI

//ASP/opa/mct/opis/ui/PDS/MCT_config_control.ui
//ASP/opa/mct/opis/ui/PDS/MCT_overview.ui



