`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 04:58:47 AM
// Design Name: 
// Module Name: parity_generater_tb
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


module parity_generater_tb();

// wire status = 0;
wire parity_hw;
reg [15:0] x;
//wire [31:0] i;

parity_generater P0 (.a(x), .parity(parity_hw));

/*
initial begin
    x = 1;
    #10 x = 2;
    #10 x = 3;
    #10 x = 4;
end
*/

initial begin
    for(x = 0; x < 65536; x = x + 1)
    begin
        #10;
    end
end

    
endmodule
