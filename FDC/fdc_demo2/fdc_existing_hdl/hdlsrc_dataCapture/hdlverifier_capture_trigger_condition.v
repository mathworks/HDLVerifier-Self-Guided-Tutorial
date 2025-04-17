
/*-- ----------------------------------------------
-- File Name: hdlverifier_capture_trigger_condition.v
-- Created:   26-Aug-2023 17:50:39
-- Copyright 2025 MathWorks, Inc.
-- ----------------------------------------------*/

module hdlverifier_capture_trigger_condition (
      clk,
      clk_enable,
      trigger_setting,
      o_detected,
      o_valid,
      i_valid,
      trigger
);


      input     clk;
      input     clk_enable;
      input    [18 : 0] trigger_setting;
      input     o_detected;
      input     o_valid;
      input     i_valid;
      output    trigger;

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
hdlverifier_capture_comparator_1bit u_hdlverifier_capture_comparator_1bit (
        .clk                  (clk),
        .clk_enable           (clk_enable),
        .data                 (i_valid),
        .trigger              (trigger_out1),
        .trigger_mode         (trigger_setting1),
        .trigger_comparison_operator (trigger_comparison_operator1)
);

hdlverifier_capture_comparator_1bit u_hdlverifier_capture_comparator_1bit_inst1 (
        .clk                  (clk),
        .clk_enable           (clk_enable),
        .data                 (o_valid),
        .trigger              (trigger_out2),
        .trigger_mode         (trigger_setting2),
        .trigger_comparison_operator (trigger_comparison_operator2)
);

hdlverifier_capture_comparator_1bit u_hdlverifier_capture_comparator_1bit_inst2 (
        .clk                  (clk),
        .clk_enable           (clk_enable),
        .data                 (o_detected),
        .trigger              (trigger_out3),
        .trigger_mode         (trigger_setting3),
        .trigger_comparison_operator (trigger_comparison_operator3)
);

hdlverifier_capture_trigger_combine #(.WIDTH(3)) u_hdlverifier_capture_trigger_combine (
        .clk                  (clk),
        .clk_enable           (clk_enable),
        .trigger_in           (trigger_stage1),
        .trigger_enable       (trigger_enable),
        .trigger_out          (trigger),
        .trigger_combination_rule (trigger_combine_rule)
);

assign trigger_stage1 = {trigger_out1,trigger_out2,trigger_out3};
assign trigger_enable = trigger_setting[17 : 15];
assign trigger_setting1 = trigger_setting[2 : 0];
assign trigger_comparison_operator1 = trigger_setting[3];
assign trigger_setting2 = trigger_setting[7 : 5];
assign trigger_comparison_operator2 = trigger_setting[8];
assign trigger_setting3 = trigger_setting[12 : 10];
assign trigger_comparison_operator3 = trigger_setting[13];
assign trigger_combine_rule = trigger_setting[18];

endmodule
