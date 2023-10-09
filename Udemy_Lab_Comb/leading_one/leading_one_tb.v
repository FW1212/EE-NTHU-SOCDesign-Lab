`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 05:53:09 AM
// Design Name: 
// Module Name: leading_one_tb
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


module leading_one_tb();

reg status = 0;
wire [4:0] index_gold;
wire [4:0] index;
reg [8:0] i;

find_leading_one_golden F0 (.a(i), .index(index_gold));
leading_one L0 (.a(i), .index(index));

always @(*) begin 
    if(index != index_gold)
        status = 1;
    else
        status = 0;
end

initial begin 
    for(i = 0; i < 512; i = i + 1)
    begin
        #2;
    end
end

endmodule


module find_leading_one_golden(
    input [8:0] a,
    output [4:0] index
    );

reg [4:0] index;

always @(*)
begin
    if(a == 9'd0)
        index = 5'b11111;
    else if(a > 9'd0 && a < 9'd2)
        index = 5'd0;
    else if(a > 9'd1 && a < 9'd4)
        index = 5'd1;
    else if(a > 9'd3 && a < 9'd8)
        index = 5'd2;
    else if(a > 9'd7 && a < 9'd16)
        index = 5'd3;
    else if(a > 9'd15 && a < 9'd32)
        index = 5'd4;
    else if(a > 9'd31 && a < 9'd64)
        index = 5'd5;
    else if(a > 9'd63 && a < 9'd128)
        index = 5'd6;
    else if(a > 9'd127 && a < 9'd256)
        index = 5'd7;
    else
        index = 5'd8;
end
    
endmodule 
