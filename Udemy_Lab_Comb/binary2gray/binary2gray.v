`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 06:38:14 AM
// Design Name: 
// Module Name: binary2gray
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


module binary2gray(
    input [3:0] a,
    output [3:0] g
    );
    
reg [3:0] g;
always @(*) begin
    case(a)
        4'd0: g <= 4'b0000;
        4'd1: g <= 4'b0001;
        4'd2: g <= 4'b0011;
        4'd3: g <= 4'b0010;
        4'd4: g <= 4'b0110;
        4'd5: g <= 4'b0111;
        4'd6: g <= 4'b0101;
        4'd7: g <= 4'b0100;
        4'd8: g <= 4'b1100;
        4'd9: g <= 4'b1101;
        4'd10: g <= 4'b1111;
        4'd11: g <= 4'b1110;
        4'd12: g <= 4'b1010;
        4'd13: g <= 4'b1011;
        4'd14: g <= 4'b1001;
        4'd15: g <= 4'b1000;
        default: g <= 4'b1111;
    endcase 
end
    
endmodule
