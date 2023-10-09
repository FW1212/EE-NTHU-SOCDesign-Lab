`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 05:42:52 AM
// Design Name: 
// Module Name: integer_division_modulus_tb
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


module integer_division_modulus_tb();

reg [31:0] x;
wire [31:0] result;

integer_division_modulus I0 (.a(x), .r(result));

initial begin 
    x = 1;
    #10 x = 2;
    #10 x = 1234102;
end

endmodule
