`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 06:58:27 AM
// Design Name: 
// Module Name: binary2bcd_div_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module binary2bcd_div_tb();

reg [13:0] in_binary;
wire [15:0] packed_bcd_hw;

binary2bcd_div B0 (.in_binary(in_binary), .packed_bcd(packed_bcd_hw));

initial begin
    for(in_binary = 0; in_binary < 9999; in_binary = in_binary + 1)
        #1;
end

endmodule
