`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 05:49:14 AM
// Design Name: 
// Module Name: leading_one
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


module leading_one(
    input [8:0] a,
    output [4:0] index
    );
    
reg [4:0] index;
    
always @(*) 
begin
    if(a[8] == 1)
        index = 5'd8;
    else if(a[7] == 1) 
        index = 5'd7;
    else if(a[6] == 1)
        index = 5'd6;
    else if(a[5] == 1)
        index = 5'd5;
    else if(a[4] == 1) 
        index = 5'd4;
    else if(a[3] == 1) 
        index = 5'd3;
    else if(a[2] == 1) 
        index = 5'd2;
    else if(a[1] == 1) 
        index = 5'd1;
    else if(a[0] == 1)
        index = 5'd0;
    else
        index = 5'b11111;
end
    
endmodule
