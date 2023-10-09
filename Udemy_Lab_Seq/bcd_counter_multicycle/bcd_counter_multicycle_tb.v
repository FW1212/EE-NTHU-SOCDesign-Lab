`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 07:16:42 AM
// Design Name: 
// Module Name: bcd_counter_multicycle_tb
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


module bcd_counter_multicycle_tb();

reg clk, rst_n, pulse;
wire [7:0] seven_segment_data_hw;
wire [3:0] seven_segment_enable_hw;

bcd_counter_multicycle B0 (.clk(clk), .rst_n(rst_n), .pulse(pulse), 
                           .seven_segment_data(seven_segment_data_hw), 
                           .seven_segment_enable(seven_segment_enable_hw));

always #10 clk = ~clk;

initial begin

    clk = 0;
    pulse = 0;
    $display("=== Initialize Success ===");
    
    rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    $display("=== Reseting ===");
    
    #10 $display("=== Test Result ===");
    
    for(integer i = 0; i < 12; i = i + 1)
    begin
        #20 pulse = 1;
        #20 pulse = 0;
    end
    
    #20 $display("=== Test Finished ===");
    $finish;
end

endmodule
