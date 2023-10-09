`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 11:04:02 PM
// Design Name: 
// Module Name: parallel2serial
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


module parallel2serial(
    input clk,
    input rst_n,
    input [7:0] a,
    input bgn,
    output reg d,
    output reg serial_start,
    output reg serial_end
    );
    
reg [3:0] count = 4'd8;
reg [7:0] a_remember;
reg [3:0] next_count;

// Combinational Part
always @*
begin
   
    if(bgn == 1)
    begin
        a_remember = a;
        serial_start = 1;
        serial_end = 0;
        next_count = 4'd0;
        d = a_remember[0];
    end
    else if(count < 4'd7)
    begin
        serial_start = 0;
        serial_end = 0;
        d = a_remember[count];
        next_count = count + 4'd1;
    end
    else if(count == 4'd7)
    begin
        serial_start = 0;
        serial_end = 1;
        next_count = count + 4'd1;
    end
    else
    begin
        serial_start = 0;
        serial_end = 0;
        next_count = 4'd8;
    end
end
    
// Sequential
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        count <= 4'd8;
    else
        count <= next_count;
end    

endmodule
