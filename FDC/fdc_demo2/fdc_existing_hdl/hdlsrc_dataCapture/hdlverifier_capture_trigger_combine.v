
/*-- ----------------------------------------------
-- File Name: hdlverifier_capture_trigger_combine.v
-- Created:   26-Aug-2023 17:50:39
-- Copyright 2025 MathWorks, Inc.
-- ----------------------------------------------*/


module hdlverifier_capture_trigger_combine #(parameter WIDTH = 8) (
    input clk,
    input clk_enable,
    input [WIDTH-1:0] trigger_in,
    input [WIDTH-1:0] trigger_enable,
    input trigger_combination_rule,
    output reg trigger_out);
    
    
    always@(posedge clk) begin
        if(clk_enable) begin
            if(trigger_combination_rule) // OR
                trigger_out <= |(trigger_in & trigger_enable) | &(~trigger_enable);
            else //AND 
                trigger_out <= &(trigger_in | (~trigger_enable));
        end
    end
    
endmodule