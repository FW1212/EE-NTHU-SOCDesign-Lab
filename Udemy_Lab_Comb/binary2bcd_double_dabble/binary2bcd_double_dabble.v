`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 07:15:24 AM
// Design Name: 
// Module Name: binary2bcd_double_dabble
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


module binary2bcd_double_dabble(
    input [7:0] in_binary,
    output [15:0] unpacked_bcd,
    output [7:0] packed_bcd
    );
    
reg [15:0] scratch_pad;
reg [31:0] i;


always @(*) begin
    scratch_pad = {8'd0, in_binary};
   
    for(i = 0; i < 7; i = i + 1)
    begin
        scratch_pad = scratch_pad << 1;
        if(scratch_pad[11:8] > 4'd4)
            scratch_pad[11:8] = scratch_pad[11:8] + 4'd3;
    end
    
    scratch_pad = scratch_pad << 1;
end


assign packed_bcd = scratch_pad[15:8];
assign unpacked_bcd = {4'd0, scratch_pad[15:12], 4'd0, scratch_pad[11:8]};
    
endmodule
