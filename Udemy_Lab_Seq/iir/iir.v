`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 08:12:01 AM
// Design Name: 
// Module Name: iir
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


module iir(
    input clk,
    input rst_n,
    input [31:0] x,
    output reg [31:0] y
    );
    
// Declaration Part
parameter [31:0] a1 = 32'd4;
parameter [31:0] a2 = 32'd3;

parameter [31:0] b0 = 32'd6;
parameter [31:0] b1 = 32'd1;
parameter [31:0] b2 = 32'd2;

reg [31:0] xn1 = 32'd0, xn2 = 32'd0, yn1 = 32'd0, yn2 = 32'd0;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        xn1 <= 32'd0;
        xn2 <= 32'd0;
        yn1 <= 32'd0;
        yn2 <= 32'd0;
        y <= 32'd0;
    end
    else
    begin
        xn2 <= xn1;
        xn1 <= x;
        yn2 <= yn1;
        y <= b0 * x + b1 * xn1 + b2 * xn2 - a1 * yn1 - a2 * yn2;
        yn1 <= b0 * x + b1 * xn1 + b2 * xn2 - a1 * yn1 - a2 * yn2;
    end
end

endmodule
