`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 04:11:23 AM
// Design Name: 
// Module Name: uart_transmitter_tb
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


module uart_transmitter_tb();

reg clk, rst_n, start, baud_rate_signal;
reg [7:0] data;
wire uart_tx;

uart_transmitter U0 (.clk(clk), .rst_n(rst_n), .data(data), .baud_rate_signal(baud_rate_signal),
                     .start(start), .uart_tx(uart_tx));
           
always #10 clk = ~clk;
                     
initial begin
    clk = 0;
    data = 8'b01000001;
    start = 0;
    baud_rate_signal = 0;
    $display("=== Initialize Success ===");
    
    rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    $display("=== Reseting ===");
    
    $display("=== Test Result ===");
    #30 start = 1;
    #20 start = 0;
    
    for(integer i = 0; i < 20; i = i + 1)
    begin
        #20 baud_rate_signal = 0;
        #60 baud_rate_signal = 1;
    end
    
end

endmodule
