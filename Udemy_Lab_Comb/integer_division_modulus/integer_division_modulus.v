`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 05:38:16 AM
// Design Name: 
// Module Name: integer_division_modulus
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

module divbyconstant(
    input [31:0] a,
    output [31:0] b
    );
    
assign b = a / 1234101;
    
endmodule

module integer_division_modulus(
    input [31:0] a,
    output [31:0] r
    );
    
wire [31:0] b;
divbyconstant D0 (.a(a), .b(b));

assign r = a - 1234101 * b;
    
endmodule
