
/*-- ----------------------------------------------
-- File Name: hdlverifier_capture_comparator_1bit.v
-- Created:   26-Aug-2023 17:50:39
-- Copyright 2025 MathWorks, Inc.
-- ----------------------------------------------*/


module hdlverifier_capture_comparator_1bit (
    input clk,
    input clk_enable,
    input data,
    input [2:0] trigger_mode,
    input trigger_comparison_operator,
    output reg trigger);
    
    reg trigger_condition;
    reg data_d1;
    always@(posedge clk) begin
      if(clk_enable) begin
	  case ({trigger_comparison_operator, trigger_mode})
	  // equal to operation
        4'b0000: trigger <=  !data;
        4'b0001: trigger <=  data;
        4'b0010: trigger <=  !data_d1 && data;
        4'b0011: trigger <=  data_d1 && !data;
        4'b0100: trigger <=  (data_d1 ^ data);
	  // not equal to operation
        4'b1000: trigger <=  data;
        4'b1001: trigger <=  !data;
        4'b1010: trigger <=  !(!data_d1 && data);
        4'b1011: trigger <=  !(data_d1 && !data);
        4'b1100: trigger <=  !(data_d1 ^ data);
	    default: trigger <=  1'd0;
      endcase
	end
    end
    always@(posedge clk) begin
        if(clk_enable) begin
            data_d1 <= data;
        end
    end
    
endmodule