program mct_config_control

// Needed for sleep function
%%#include <unistd.h>

// MCT configuration PVs
short dmm_status_request;
assign dmm_status_request to "{P}MONO01_STATUS_CMD";

short mirror_status_request;
assign mirror_status_request to "{P}VBM01_STATUS_CMD";

float energy_request;
assign energy_request to "{P}ENERGY_SP";

short dmm_ruc_stripe_cmd;
assign dmm_ruc_stripe_cmd to "{P}MONO01_STRIPE_RUC_CMD";

short dmm_vb4c_stripe_cmd;
assign dmm_vb4c_stripe_cmd to "{P}MONO01_STRIPE_VB4C_CMD";

short dmm_wb4c_stripe_cmd;
assign dmm_wb4c_stripe_cmd to "{P}MONO01_STRIPE_WB4C_CMD";

float critical_energy;
assign critical_energy to "{P}VBM01_CRIT_ENERGY_SP";

string dmm_stripe_user_request;
assign dmm_stripe_user_request to "{P}MONO01_STRIPE_CMD";

string mirror_stripe_user_request;
assign mirror_stripe_user_request to "{P}VBM01_STRIPE_CMD";

float config_dmm_offset;
assign config_dmm_offset to "{P}DMM_OFFSET_SP";

// MCT status PVs
short dmm_in_service_status;
assign dmm_in_service_status to "MCTMONO01:IN_SERVICE_CALC";

short mirror_in_service_status;
assign mirror_in_service_status to "MCTVBM01:IN_SERVICE_CALC";

// Sequence control and status PVs
short sequence_heartbeat;
assign sequence_heartbeat to "{P}SEQUENCE_HEARTBEAT";

short config_start;
assign config_start to "{P}CONFIG_START";
monitor config_start;

short config_abort;
assign config_abort to "{P}CONFIG_ABORT";
monitor config_abort;

short config_seq_mode;
assign config_seq_mode to "{P}CONFIG_SEQ_MODE";
monitor config_seq_mode;
// 0 = Continuous
// 1 = Single step

short config_continue;
assign config_continue to "{P}CONFIG_CONTINUE";
monitor config_continue;
evflag config_continue_ef;
sync config_continue to config_continue_ef;

short config_continue_led;
assign config_continue_led to "{P}CONFIG_CONTINUE_LED";

short config_status;
assign config_status to "{P}CONFIG_STATUS";
// 0 = Idle
// 1 = Running
// 2 = Aborted
// 3 = Error

short config_state;
assign config_state to "{P}CONFIG_STATE";

string config_message;
assign config_message to "{P}CONFIG_MESSAGE";

short config_message_prev_proc;
assign config_message_prev_proc to "{P}CONFIG_MESSAGE_PREV.PROC";

string error_message;
assign error_message to "{P}ERROR_MESSAGE";

// Device PVs
// MCTMONO01
short dmm_stripe_request;
assign dmm_stripe_request to "MCTMONO01:STRIPE_REQUEST_CMD";

string dmm_stripe_request_str;
assign dmm_stripe_request_str to "MCTMONO01:STRIPE_REQUEST_CMD";

float dmm_energy_request;
assign dmm_energy_request to "MCTMONO01:ENERGY_REQUEST_SP";

float dmm_offset_request;
assign dmm_offset_request to "MCTMONO01:OFFSET_REQUEST_SP";

short dmm_energy_request_cmd;
assign dmm_energy_request_cmd to "MCTMONO01:REQUEST_ENERGY_CMD";

short dmm_done_moving;
assign dmm_done_moving to "MCTMONO01:MOVING_MONITOR";
monitor dmm_done_moving;

float dmm_p1_sp;
assign dmm_p1_sp to "MCTMONO01MOT06.VAL";
monitor dmm_p1_sp;
evflag dmm_p1_sp_event;
sync dmm_p1_sp dmm_p1_sp_event;

short dmm_p1_spmg;
assign dmm_p1_spmg to "MCTMONO01MOT06.SPMG";

short dmm_p2_spmg;
assign dmm_p2_spmg to "MCTMONO01MOT07.SPMG";

short dmm_y2_spmg;
assign dmm_y2_spmg to "MCTMONO01MOT03.SPMG";

short dmm_z2_spmg;
assign dmm_z2_spmg to "MCTMONO01MOT01.SPMG";

short dmm_park_proc;
assign dmm_park_proc to "MCTMONO01:PARK.PROC";

float dmm_y1;
assign dmm_y1 to "MCTMONO01MOT02";

float dmm_y1_in_sp;
assign dmm_y1_in_sp to "MCTMONO01:Y1_IN_POS";

short dmm_stop;
assign dmm_stop to "MCTMONO01:STOP_ALL_MOTION_CMD";

short dmm_control_mode;
assign dmm_control_mode to "MCTMONO01:ENERGY_USER_MODE_CMD";

// VBM01
string mirror_stripe_current;
assign mirror_stripe_current to "MCTVBM01:STRIPE_SELECTION_STATUS";

short mirror_park_proc;
assign mirror_park_proc to "MCTVBM01:PARK";

short mirror_height_move_proc;
assign mirror_height_move_proc to "{P}VBM01_HEIGHT_MOVE.PROC";

float mirror_pitch_move_proc;
assign mirror_pitch_move_proc to "{P}VBM01_PITCH_MOVE.PROC";

short mirror_pitch_spmg;
assign mirror_pitch_spmg to "MCTVBM01:PITCH.SPMG";

short mirror_pitch_dmov;
assign mirror_pitch_dmov to "MCTVBM01:PITCH.DMOV";
monitor mirror_pitch_dmov;

float mirror_pitch_current;
assign mirror_pitch_current to "MCTVBM01:PITCH";

float mirror_pitch_request;
assign mirror_pitch_request to "{P}VBM01_PITCH_CALC";

short mirror_stop;
assign mirror_stop to "MCTVBM01:CS_Y:stop";

// MCTSLT01
short slt01_vsize_sp;
assign slt01_vsize_sp to "MCTSLT01:VSIZE";

short slt01_all_move_proc;
assign slt01_all_move_proc to "MCTSLT01:ALL_MOVE.PROC";

short slt01_vsize_dmov;
assign slt01_vsize_dmov to "MCTSLT01:VSIZE.DMOV";
monitor slt01_vsize_dmov;

short slt01_stop_proc;
assign slt01_stop_proc to "MCTSLT01:ALL_STOP.PROC";

short slt01_op_mode;
assign slt01_op_mode to "MCTSLT01:OP_MODE";

// MCTSLT02
short slt02_all_move_proc;
assign slt02_all_move_proc to "MCTSLT02:ALL_MOVE.PROC";

short slt02_stop_proc;
assign slt02_stop_proc to "MCTSLT02:ALL_STOP.PROC";

short slt02_op_mode;
assign slt02_op_mode to "MCTSLT02:OP_MODE";

// MCTSLT03
short slt03_all_move_proc;
assign slt03_all_move_proc to "MCTSLT03:ALL_MOVE.PROC";

short slt03_stop_proc;
assign slt03_stop_proc to "MCTSLT03:ALL_STOP.PROC";

short slt03_op_mode;
assign slt03_op_mode to "MCTSLT03:OP_MODE";

// Tables
short tbl01_pitch_stop;
assign tbl01_pitch_stop to "MCTTBL01:CS1:PITCH.STOP";

short tbl01_height_stop;
assign tbl01_height_stop to "MCTTBL01:CS1:HEIGHT.STOP";

short tbl02_pitch_stop;
//assign tbl02_pitch_stop to "MCTTBL02:CS2:PITCH.STOP";

short tbl02_height_stop;
//assign tbl02_height_stop to "MCTTBL02:CS2:HEIGHT.STOP";

short tbl03_pitch_stop;
//assign tbl03_pitch_stop to "MCTTBL03:CS1:PITCH.STOP";

short tbl03_height_stop;
//assign tbl03_height_stop to "MCTTBL03:CS1:HEIGHT.STOP";

short tbl04_pitch_stop;
//assign tbl04_pitch_stop to "MCTTBL04:CS2:PITCH.STOP";

short tbl04_height_stop;
//assign tbl04_height_stop to "MCTTBL04:CS2:HEIGHT.STOP";

// Shutters
// Front end
short front_end_shutter_request;
assign front_end_shutter_request to "MCTFE02SHT01:OPEN_CLOSE_CMD";
// 0 = No Action
// 1 = Close
// 2 = Open

short front_end_shutter_status;
assign front_end_shutter_status to "MCTFE02SHT01:OPEN_CLOSE_STATUS";
monitor front_end_shutter_status;
// 2 = Close
// 3 = Open

// A Hutch
// Placeholder

// Variables
float heartbeat_period;
float continue_blink_period;
short PAUSE;
short GO;
short white_beam_first;
short shutter_close_required;
short slt01_op_mode_previous;
short slt02_op_mode_previous;
short slt03_op_mode_previous;
short dmm_control_mode_previous;
evflag state_finished_ef;

ss mct_config {
    state init {
        when(delay(1.0)) {
            // Define constants
            PAUSE = 1;
            GO = 3;
            config_status = 0;
            pvPut(config_status);
        } state idle
    }

    state idle {
        entry {
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Waiting for user");
            pvPut(config_message);
            efClear(state_finished_ef);
        }

        when((config_start == 1) &&
                (pvAssignCount() != pvConnectCount())) {
            strcpy(error_message, "Not all PVs connected");
            pvPut(error_message);
            config_status = 3;
            pvPut(config_status);
        } state idle

        when(config_start == 1) {
            config_status = 1; // RUNNING
            pvPut(config_status);

            strcpy(error_message, "No error");
            pvPut(error_message);

            // Store the slit control modes so that we can restore
            // them at the end of the program
            pvGet(slt01_op_mode);
            pvGet(slt02_op_mode);
            pvGet(slt03_op_mode);
            slt01_op_mode_previous = slt01_op_mode;
            slt02_op_mode_previous = slt02_op_mode;
            slt03_op_mode_previous = slt03_op_mode;

            // Store the DMM application mode
            pvGet(dmm_control_mode);
            dmm_control_mode_previous = dmm_control_mode;

            // Set all slit movement control to Manual so that the
            // program can determine the movement order
            slt01_op_mode = 0;
            slt02_op_mode = 0;
            slt03_op_mode = 0;
            pvPut(slt01_op_mode);
            pvPut(slt02_op_mode);
            pvPut(slt03_op_mode);
        } state determine_shutter

        // Allow sequence stop button to act as an 'All Stop'
        when (config_abort == 1) {
        } state abort
    }

    state determine_shutter {
        entry {
            efClear(state_finished_ef);
            // Work out whether to move white beam slits or mono/mirror first.
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Shutter close req'd?");
            pvPut(config_message);

            pvGet(dmm_status_request);
            pvGet(dmm_in_service_status);
            pvGet(mirror_status_request);
            pvGet(mirror_in_service_status);

            pvGet(dmm_stripe_user_request);
            pvGet(dmm_stripe_request_str);
            pvGet(mirror_stripe_user_request);
            pvGet(mirror_stripe_current);

            //printf("determine_shutter: dmm_status_request = %d\n", dmm_status_request);
            //printf("determine_shutter: dmm_in_service_status = %d\n", dmm_in_service_status);
            //printf("determine_shutter: dmm_stripe_user_request = %s\n", dmm_stripe_user_request);
            //printf("determine_shutter: dmm_stripe_request_str = %s\n", dmm_stripe_request_str);
            //printf("determine_shutter: mirror_status_request = %d\n", mirror_status_request);
            //printf("determine_shutter: mirror_in_service_status = %d\n", mirror_in_service_status);
            //printf("determine_shutter: mirror_stripe_user_request = %s\n", mirror_stripe_user_request);
            //printf("determine_shutter: mirror_stripe_current = %s\n", mirror_stripe_current);

            if(
                    // Change in DMM status
                    (dmm_status_request != dmm_in_service_status) ||
                    // Change in DMM stripe
                    (strcmp(dmm_stripe_user_request, dmm_stripe_request_str) != 0) ||
                    // Change in VBM status with mono out of service
                    (dmm_status_request == 0 && 
                     mirror_status_request != mirror_in_service_status )) {
                // Change in VBM stripe with mono out of service
                //(dmm_status_request == 0 &&
                //strcmp(mirror_stripe_user_request, mirror_stripe_current) != 0)) 
                shutter_close_required = 1;
            }
            else {
                shutter_close_required = 0;
            }

            efSet(state_finished_ef);
        }

        when (delay(1.0) && 
                shutter_close_required == 0 &&
                (config_seq_mode == 0 ||
                 (config_seq_mode == 1 && efTestAndClear(config_continue_ef) && config_continue == 1))) {
        } state determine_order

        when (delay(1.0) && 
                shutter_close_required == 1 &&
                (config_seq_mode == 0 ||
                 (config_seq_mode == 1 && efTestAndClear(config_continue_ef) && config_continue == 1))) {
        } state close_shutter

        when (config_abort == 1) {
        } state abort
    }

    state close_shutter {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Closing shutter");
            pvPut(config_message);

            pvGet(front_end_shutter_status);
            if (front_end_shutter_status == 3) {
                front_end_shutter_request = 1;
                //pvPut(front_end_shutter_request);
            }
            efSet(state_finished_ef);
        }

        when(front_end_shutter_status == 2) {
        } state move_mono_y1

        when (delay(5.0)) {
            strcpy(error_message, "Shutter close timeout");
            pvPut(error_message);
            config_status = 3;
            pvPut(config_status);
        } state abort

        // TODO: Delete this after shutter control enabled
        when (delay(2.0)) {
            // TODO: Add shutter closed readback here
        } state move_mono_y1

        when (config_abort == 1) {
        } state abort

        exit {
            front_end_shutter_request = 0;
            //pvPut(front_end_shutter_request);
        }
    }

    state determine_order {
        entry {
            efClear(state_finished_ef);
            // Add logic here to work out whether to move
            // white beam slits or mono/mirror first.

            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Eval. move order");
            pvPut(config_message);

            pvGet(dmm_status_request);
            pvGet(mirror_status_request);
            pvGet(energy_request);
            pvGet(dmm_energy_request);

            printf("determine_order: energy_request = %f\n", energy_request);
            printf("determine_order: dmm_energy_request = %f\n", dmm_energy_request);

            if (dmm_status_request == 1) {
                if (energy_request > dmm_energy_request) {
                    white_beam_first = 1;
                }
                else {
                    white_beam_first = 0;
                }
            }
            else if (dmm_status_request == 0 && mirror_status_request == 1) {
                if (mirror_pitch_request < mirror_pitch_current) {
                    white_beam_first = 1;
                }
                else {
                    white_beam_first = 0;
                }
            }
            printf("determine_order: white_beam_first = %d\n", white_beam_first);
            efSet(state_finished_ef);
        }


        // Monochromatic beam mode
        when (dmm_status_request == 1 && white_beam_first == 1 &&
                (config_seq_mode == 0 ||
                 (config_seq_mode == 1 && efTestAndClear(config_continue_ef) && config_continue == 1))) {
        } state set_up_mono_config

        when (dmm_status_request == 1 && white_beam_first == 0 &&
                (config_seq_mode == 0 ||
                 (config_seq_mode == 1 && efTestAndClear(config_continue_ef) && config_continue == 1))) {
        } state move_mono_before_slits

        // Pink beam mode
        when (dmm_status_request == 0 &&
                mirror_status_request == 1 &&
                white_beam_first == 1 &&
                (config_seq_mode == 0 ||
                 (config_seq_mode == 1 && efTestAndClear(config_continue_ef) && config_continue == 1))) {
        } state move_white_beam_slits_then_mirror

        when (dmm_status_request == 0 &&
                mirror_status_request == 1 &&
                white_beam_first == 0 &&
                (config_seq_mode == 0 ||
                 (config_seq_mode == 1 && efTestAndClear(config_continue_ef) && config_continue == 1))) {
        } state move_mirror

        // If we get to here, then we can go straight to moving the slits
        // as the mirror and mono positions are not changing
        when (dmm_status_request == 0 && 
                mirror_status_request == 0 &&
                (config_seq_mode == 0 ||
                 (config_seq_mode == 1 && efTestAndClear(config_continue_ef) && config_continue == 1))) {
        } state move_slt01

        when (config_abort == 1) {
        } state abort
    }

    state set_up_mono_config {
        entry {
            efClear(state_finished_ef);
            printf("set_up_mono_config: entering\n");

            config_state = 3; // Moving white beam slits
            pvPut(config_state);

            // Assume that the DMM Y1 motor is in the
            // correct position

            // Pause mono motors so that we can get the setpoints written
            // without movement
            dmm_p1_spmg = PAUSE;
            dmm_p2_spmg = PAUSE;
            dmm_y2_spmg = PAUSE;
            dmm_z2_spmg = PAUSE;

            pvPut(dmm_p1_spmg);
            pvPut(dmm_p2_spmg);
            pvPut(dmm_y2_spmg);
            pvPut(dmm_z2_spmg);

            pvGet(energy_request);
            pvGet(dmm_ruc_stripe_cmd);
            pvGet(dmm_vb4c_stripe_cmd);
            pvGet(dmm_wb4c_stripe_cmd);

            if (dmm_ruc_stripe_cmd == 1)
                dmm_stripe_request = 0;
            else if (dmm_vb4c_stripe_cmd == 1)
                dmm_stripe_request = 1;
            else if (dmm_wb4c_stripe_cmd == 1)
                dmm_stripe_request = 2;
            pvPut(dmm_stripe_request);

            // Push the energy selection to the application
            dmm_energy_request = energy_request;
            pvPut(dmm_energy_request);

            // Put the DMM energy control application into Advanced mode
            // to allow offset setting
            dmm_control_mode = 1;
            pvPut(dmm_control_mode);

            // Set the offset
            pvGet(config_dmm_offset);
            dmm_offset_request = config_dmm_offset;
            pvPut(dmm_offset_request);

            // Clear the event flag that will be used to test 
            // the result of the next command
            efClear(dmm_p1_sp_event);

            // Trigger the energy movement to update
            // the calculations
            dmm_energy_request_cmd = 1;
            pvPut(dmm_energy_request_cmd);
        }

        when (delay(0.5) && 
                efTestAndClear(dmm_p1_sp_event)) {
            printf("set_up_mono_config: got event\n");
        } state move_white_beam_slits

        when (delay(1.0)) {
            printf("set_up_mono_config: timed out\n");
        } state move_white_beam_slits
    }

    state move_white_beam_slits {
        entry {
            efClear(state_finished_ef);
            //pvGet(dmm_p1_sp);
            //printf("move_white_beam_slits: dmm_p1_sp = %f\n", dmm_p1_sp);

            // setpoint for the P1 motor has updated
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Move Slits A before mono");
            pvPut(config_message);

            printf("move_white_beam_slits: command A slits to move\n");

            slt01_all_move_proc = 1;
            pvPut(slt01_all_move_proc, ASYNC);
        }

        when (delay(1.0) && 
                pvPutComplete(slt01_all_move_proc)) {
            printf("set_up_mono_config: A slit move complete\n");
        } state reenable_mono

        when (config_abort == 1) {
        } state abort
    }

    state reenable_mono {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Moving DMM");
            pvPut(config_message);
            printf("reenable_mono: entering\n");
            dmm_p1_spmg = GO;
            dmm_p2_spmg = GO;
            dmm_y2_spmg = GO;
            dmm_z2_spmg = GO;
            pvPut(dmm_p1_spmg);
            pvPut(dmm_p2_spmg);
            pvPut(dmm_y2_spmg);
            pvPut(dmm_z2_spmg);
        }

        when(delay(1.0)) {
        } state move_mono

        when (config_abort == 1) {
        } state abort
    }

    state move_mono {
        entry {
            efClear(state_finished_ef);
            // Retrigger the mono positioning application
            // to ensure the motors move.
            dmm_energy_request_cmd = 1;
            pvPut(dmm_energy_request_cmd);
        }

        when (delay(1.0) && 
                dmm_done_moving == 1) {
        } state move_mirror

        when (config_abort == 1) {
        } state abort
    }

    state move_mono_y1 {
        entry {
            efClear(state_finished_ef);
            printf("move_mono_y1: entering\n");

            if (dmm_status_request == 1) {
                // Make sure the Y1 motor is in the correct position
                config_message_prev_proc = 1;
                pvPut(config_message_prev_proc);
                strcpy(config_message, "Moving DMM Y1");
                pvPut(config_message);

                pvGet(dmm_y1_in_sp);
                dmm_y1 = dmm_y1_in_sp;
                pvPut(dmm_y1, ASYNC);
            }
        }
        when(delay(1.0) &&
                pvPutComplete(dmm_y1)) {
            //sleep(1);
        } state move_mono_before_slits
    }

    state move_mono_before_slits {
        entry {
            efClear(state_finished_ef);
            printf("move_mono_before_slits: entering\n");
            config_state = 1; // Moving mono
            pvPut(config_state);

            pvGet(dmm_status_request);

            if (dmm_status_request == 1) {
                // Get the configuration values entered by the user
                pvGet(energy_request);
                pvGet(dmm_ruc_stripe_cmd);
                pvGet(dmm_vb4c_stripe_cmd);
                pvGet(dmm_wb4c_stripe_cmd);

                // Push the stripe selection to the application
                if (dmm_ruc_stripe_cmd == 1)
                    dmm_stripe_request = 0;
                else if (dmm_vb4c_stripe_cmd == 1)
                    dmm_stripe_request = 1;
                else if (dmm_wb4c_stripe_cmd == 1)
                    dmm_stripe_request = 2;
                pvPut(dmm_stripe_request);

                // Push the energy selection to the application
                dmm_energy_request = energy_request;
                pvPut(dmm_energy_request);

                config_message_prev_proc = 1;
                pvPut(config_message_prev_proc);
                strcpy(config_message, "Moving DMM");
                pvPut(config_message);

                // Put the DMM energy control application into Advanced mode
                // to allow offset setting
                dmm_control_mode = 1;
                pvPut(dmm_control_mode);

                // Set the offset
                pvGet(config_dmm_offset);
                dmm_offset_request = config_dmm_offset;
                pvPut(dmm_offset_request);

                // Start the DMM energy application
                dmm_energy_request_cmd = 1;
                pvPut(dmm_energy_request_cmd, ASYNC);
            }

            if (dmm_status_request == 0) {
                config_message_prev_proc = 1;
                pvPut(config_message_prev_proc);
                strcpy(config_message, "Moving DMM out");
                pvPut(config_message);

                dmm_park_proc = 1;
                pvPut(dmm_park_proc, ASYNC);
            }
        }

        when (delay(1.0) && dmm_status_request == 1 && dmm_done_moving == 1) {
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "DMM move done");
            pvPut(config_message);
        } state move_mirror

        when (dmm_status_request == 0 && 
                pvPutComplete(dmm_park_proc)) {
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Moved DMM out");
            pvPut(config_message);
        }  state move_mirror

        when (config_abort == 1) {
        } state abort
    }

    state move_white_beam_slits_then_mirror {
        entry {
            efClear(state_finished_ef);
            config_state = 3; // Moving white beam slits
            pvPut(config_state);

            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Closing Slits A");
            pvPut(config_message);

            mirror_pitch_spmg = PAUSE;
            pvPut(mirror_pitch_spmg);

            mirror_pitch_move_proc = 1;
            pvPut(mirror_pitch_move_proc, ASYNC);

            mirror_height_move_proc = 1;
            pvPut(mirror_height_move_proc, ASYNC);

            // Command the white beam slits to move now that the
            // setpoint for the P1 motor has updated
            slt01_all_move_proc = 1;
            pvPut(slt01_all_move_proc, ASYNC);
        }

        when (delay(1.0) && 
                pvPutComplete(slt01_all_move_proc) && 
                pvPutComplete(mirror_height_move_proc)) {
        } state move_mirror_pitch 

        when (config_abort == 1) {
        } state abort
    }

    state move_mirror_pitch {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Move mirror pitch");
            pvPut(config_message);

            mirror_pitch_spmg = GO;
            pvPut(mirror_pitch_spmg);
        }

        when (delay (1.0) &&
                mirror_pitch_dmov == 1) {
        } state move_slt01 // Go to SLT01 to confirm position 

        when (config_abort == 1) {
        } state abort
    }

    state move_mirror {
        entry {
            efClear(state_finished_ef);
            if (mirror_status_request == 1) {
                mirror_height_move_proc = 1;
                pvPut(mirror_height_move_proc, SYNC);

                mirror_pitch_move_proc = 1;
                pvPut(mirror_pitch_move_proc, SYNC);
            }

            if (mirror_status_request == 0 && 
                    mirror_in_service_status == 1) {
                mirror_park_proc = 1;
                pvPut(mirror_park_proc, ASYNC);

            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
                strcpy(config_message, "Parking mirror");
                pvPut(config_message);
            }
        }


        when (delay(1.0) && 
                mirror_status_request == 0 &&
                pvPutComplete(mirror_park_proc)) {
        } state move_slt01

        when (config_abort == 1) {
        } state abort
    }

    state move_slt01 {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Moving Slits A");
            pvPut(config_message);

            slt01_all_move_proc = 1;
            pvPut(slt01_all_move_proc, ASYNC);
        }

        when (delay(1.0) && 
                pvPutComplete(slt01_all_move_proc)) {
        } state move_slt02

        when (config_abort == 1) {
        } state abort
    }

    state move_slt02 {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Moving Slits B");
            pvPut(config_message);

            slt02_all_move_proc = 1;
            pvPut(slt02_all_move_proc, ASYNC);
        }

        when (delay(1.0) && 
                pvPutComplete(slt02_all_move_proc)) {
        } state move_slt03

        when (config_abort == 1) {
        } state abort
    }

    state move_slt03 {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Moving Slits C");
            pvPut(config_message);

            slt03_all_move_proc = 1;
            pvPut(slt03_all_move_proc, ASYNC);
        }

        when (delay(1.0) && 
                pvPutComplete(slt03_all_move_proc)) {
        } state move_table

        when (config_abort == 1) {
        } state abort
    }

    state move_table {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Moving table");
            pvPut(config_message);

            // TODO: Add table movement code here
        }

        when (delay(1.0)) {
        } state open_shutter

        when (config_abort == 1) {
        } state abort
    }

    state open_shutter {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Opening shutter");
            pvPut(config_message);

            pvGet(front_end_shutter_status);
            if (front_end_shutter_status == 2) {
                front_end_shutter_request = 1;
                //pvPut(front_end_shutter_request);
            }
        }

        when((front_end_shutter_status == 3) &&
                dmm_status_request == 1) { 
        } state optimize_intensity

        when((front_end_shutter_status == 3) &&
                dmm_status_request != 1) { 
        } state restore_state

        when (delay(5.0)) {
            strcpy(error_message, "Shutter close timeout");
            pvPut(error_message);
            config_status = 3;
            pvPut(config_status);
        } state abort

        // TODO: Remove these two states when shutter control added
        when (delay(1.0) && 
                dmm_status_request == 1) {
        } state optimize_intensity

        when (delay(1.0) &&
                dmm_status_request != 1) {
        } state restore_state

        when (config_abort == 1) {
        } state abort

        exit {
            front_end_shutter_request = 0;
            //pvPut(front_end_shutter_request);
        }
    }

    state optimize_intensity {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Optimizing intensity");
            pvPut(config_message);

            // TODO: Add scan trigger code here
        }

        when (delay(1.0)) {
        } state restore_state

        when (config_abort == 1) {
        } state abort
    }

    state abort {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Aborting movements");
            pvPut(config_message);

            strcpy(error_message, "Abort requested");
            pvPut(error_message);

            config_status = 2;
            pvPut(config_status);

            dmm_stop = 1;
            mirror_stop = 1;
            slt01_stop_proc = 1;
            slt02_stop_proc = 1;
            slt03_stop_proc = 1;
            tbl01_pitch_stop = 1;
            tbl01_height_stop = 1;
            tbl02_pitch_stop = 1;
            tbl02_height_stop = 1;
            tbl03_pitch_stop = 1;
            tbl03_height_stop = 1;
            tbl04_pitch_stop = 1;
            tbl04_height_stop = 1;

            pvPut(dmm_stop);
            pvPut(mirror_stop);
            pvPut(slt01_stop_proc);
            pvPut(slt02_stop_proc);
            pvPut(slt03_stop_proc);
            pvPut(tbl01_pitch_stop);
            pvPut(tbl01_height_stop);
            //pvPut(tbl02_pitch_stop);
            //pvPut(tbl02_height_stop);
            //pvPut(tbl03_pitch_stop);
            //pvPut(tbl03_height_stop);
            //pvPut(tbl04_pitch_stop);
            //pvPut(tbl04_height_stop);

            config_abort = 0;
            pvPut(config_abort);
        }

        when (delay(1.0)) {
        } state restore_state
    }

    state restore_state {
        entry {
            efClear(state_finished_ef);
            config_message_prev_proc = 1;
            pvPut(config_message_prev_proc);
            strcpy(config_message, "Restoring config.");
            pvPut(config_message);
            // Restore the slit operation modes to their
            // values before the sequence ran
            slt01_op_mode = slt01_op_mode_previous;
            slt02_op_mode = slt02_op_mode_previous;
            slt03_op_mode = slt03_op_mode_previous;
            pvPut(slt01_op_mode);
            pvPut(slt02_op_mode);
            pvPut(slt03_op_mode);

            dmm_control_mode = dmm_control_mode_previous;
            pvPut(dmm_control_mode);
        }
        when(delay(1.0)) {
            pvGet(config_status);
            if (config_status == 1) {
                config_status = 0;
                pvPut(config_status);
            }
        } state idle
    }

}

ss mct_config_heartbeat {
    state init {
        when() {
            heartbeat_period = 2.0;
        } state heartbeat_on
    }

    state heartbeat_on {
        when (delay(heartbeat_period / 2)) {
            sequence_heartbeat = 1;
            pvPut(sequence_heartbeat);
        } state heartbeat_off
    }

    state heartbeat_off {
        when (delay(heartbeat_period / 2)) {
            sequence_heartbeat = 0;
            pvPut(sequence_heartbeat);
        } state heartbeat_on
    }
}

ss mct_seq_continue {
    state continue_led_off {
        entry {
            continue_blink_period = 2.0;
            config_continue_led = 0;
            pvPut(config_continue_led);
        }
       
        when (config_seq_mode == 1 && efTest(state_finished_ef)) {
        } state continue_blink_on
    } 

    state continue_blink_on {
        when (delay(continue_blink_period / 2) &&
                efTest(state_finished_ef)) {
            config_continue_led = 1;
            pvPut(config_continue_led);
        } state continue_blink_off

        when (config_seq_mode == 0) {
        } state continue_led_off
         
        when (!efTest(state_finished_ef)) {
        } state continue_led_off
    }

    state continue_blink_off {
        when (delay(continue_blink_period / 2) &&
                efTest(state_finished_ef)) {
            config_continue_led = 0;
            pvPut(config_continue_led);
        } state continue_blink_on

        when (config_seq_mode == 0) {
        } state continue_led_off
         
        when (!efTest(state_finished_ef)) {
        } state continue_led_off
    }
}



