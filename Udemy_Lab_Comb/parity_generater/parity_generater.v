`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 04:43:28 AM
// Design Name: 
// Module Name: parity_generater
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


module parity_generater(
    input [15:0] a,
    output parity
    );

assign parity = a[0] ^ a[1] ^ a[2] ^ a[3] ^ a[4] ^ a[5] ^ a[6] ^ a[7] ^ a[8] ^ a[9] ^ a[10] ^ a[11] ^ a[12] ^ a[13] ^ a[14] ^ a[15]; 
    
endmodule
