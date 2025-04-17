
/*-- ----------------------------------------------
-- File Name: datacapture.v
-- Created:   26-Aug-2023 17:50:40
-- Copyright 2025 MathWorks, Inc.
-- ----------------------------------------------*/

module datacapture (
      clk,
      clk_enable,
      i_data,
      o_data,
      o_detected,
      o_valid,
      i_valid,
      ready_to_capture
);


      input     clk;
      input     clk_enable;
      input    [31 : 0] i_data;
      input    [31 : 0] o_data;
      input     o_detected;
      input     o_valid;
      input     i_valid;
      output    ready_to_capture;

  wire[71 : 0] all_data; // std72
  wire[4 : 0] pad_zero; // std5
  wire[39 : 0] trigger_setting; // std40
  wire trigger_1; // boolean
  wire start_flag; // boolean
  wire[18 : 0] trigger_setting_cond1; // std19
  wire[2 : 0] trigger_stage1; // std3
  wire[2 : 0] trigger_enable; // std3
  wire trigger_out1; // boolean
  wire[2 : 0] trigger_setting1; // std3
  wire trigger_comparison_operator1; // std1
  wire trigger_out2; // boolean
  wire[2 : 0] trigger_setting2; // std3
  wire trigger_comparison_operator2; // std1
  wire trigger_out3; // boolean
  wire[2 : 0] trigger_setting3; // std3
  wire trigger_comparison_operator3; // std1
  wire trigger_combine_rule; // boolean
hdlverifier_capture_core #(.DATA_WIDTH(72),.ADDR_WIDTH(12),.TRIG_WIDTH(40),.JTAG_ID(2)) u_hdlverifier_capture_core (
        .clk                  (clk),
        .clk_enable           (clk_enable),
        .start                (start_flag),
        .ready_to_capture     (ready_to_capture),
        .data                 (all_data),
        .trigger              (trigger_1),
        .trigger_setting      (trigger_setting)
);

hdlverifier_capture_trigger_condition u_hdlverifier_capture_trigger_condition (
        .clk                  (clk),
        .clk_enable           (clk_enable),
        .trigger              (trigger_1),
        .trigger_setting      (trigger_setting_cond1),
        .o_detected           (o_detected),
        .o_valid              (o_valid),
        .i_valid              (i_valid)
);

assign all_data = {pad_zero,o_detected,o_valid,o_data,i_valid,i_data};
assign pad_zero = 0;assign trigger_setting_cond1 = trigger_setting[18 : 0];

endmodule
