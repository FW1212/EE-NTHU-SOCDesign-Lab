`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 06:47:05 AM
// Design Name: 
// Module Name: binary2bcd_div
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


module get_digit(
    input [13:0] in,
    output [3:0] digit
    );

assign digit = in - 10 * (in / 10);
    
endmodule 


module binary2bcd_div(
    input [13:0] in_binary,
    output [15:0] packed_bcd
    );

wire [13:0] a, b, c, d;
assign a = in_binary;
assign b = a/10;
assign c = b/10;
assign d = c/10;

wire [3:0] digit_1, digit_2, digit_3, digit_4;
get_digit G0(.in(a), .digit(digit_1));
get_digit G1(.in(b), .digit(digit_2));
get_digit G2(.in(c), .digit(digit_3));
get_digit G3(.in(d), .digit(digit_4));

assign packed_bcd = {digit_4, digit_3, digit_2, digit_1};

endmodule


