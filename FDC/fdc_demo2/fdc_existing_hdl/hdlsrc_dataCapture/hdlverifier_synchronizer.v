
/*-- ----------------------------------------------
-- File Name: hdlverifier_synchronizer.v
-- Created:   26-Aug-2023 17:50:39
-- Copyright 2025 MathWorks, Inc.
-- ----------------------------------------------*/


module hdlverifier_synchronizer #(parameter WIDTH = 10)(
    input clk,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
);

reg [WIDTH-1:0] data_reg;

always@(posedge clk) begin
    begin
        data_reg <= data_in;
        data_out <= data_reg;
    end
end
    
endmodule