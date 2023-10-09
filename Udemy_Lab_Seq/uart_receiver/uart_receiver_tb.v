`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 04:49:15 AM
// Design Name: 
// Module Name: uart_receiver_tb
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


module uart_receiver_tb();

reg clk, rst_n, uart_rx, baud_rate_signal;
wire valid_data;
wire [7:0] data;

uart_receiver U0 (.clk(clk), .rst_n(rst_n), .uart_rx(uart_rx),
                  .baud_rate_signal(baud_rate_signal), .data(data), .valid_data(valid_data));
                  
always #10 clk = ~clk;

initial begin
    
    clk = 0;
    uart_rx = 1;
    baud_rate_signal = 0;
    $display("=== Initialize Success ===");
    
    rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    $display("=== Reseting ===");
    
    $display("=== Test Result ===");

    #30 uart_rx = 1; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 1; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    // Signal Start
    #40 uart_rx = 0; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 1; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 0; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 0; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 0; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 0; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 0; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 1; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 0; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 1; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 1; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
    #40 uart_rx = 1; baud_rate_signal = 1;
    #20 baud_rate_signal = 0;
    
end

endmodule
