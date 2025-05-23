
/*-- ----------------------------------------------
-- File Name: hdlverifier_jtag_vendor_ip0.v
-- Created:   26-Aug-2023 17:50:39
-- Copyright 2025 MathWorks, Inc.
-- ----------------------------------------------*/

module hdlverifier_jtag_vendor_ip0
#(parameter JTAG_ID=2)
(
	output tdi,
	input tdo,
	output tck,
	output jtag_reset,
	output capture_dr,
    output shift_dr,
    output update_dr
);

wire sel;
wire cdr;
wire sdr;
wire udr;

assign capture_dr   = sel && cdr;
assign shift_dr     = sel && sdr;
assign update_dr    = sel && udr;

BSCANE2 #(.JTAG_CHAIN(JTAG_ID)) u_BSCANE2(
        .TDI(tdi),
        .SEL(sel),
        .RESET(jtag_reset),
        .TCK(tck),
        .CAPTURE(cdr),
        .TMS(),
        .TDO(tdo),
        .RUNTEST(),
        .SHIFT(sdr),
        .UPDATE(udr),
        .DRCK()
);

endmodule