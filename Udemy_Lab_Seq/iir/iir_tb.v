`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 08:22:37 AM
// Design Name: 
// Module Name: iir_tb
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


module iir_tb();

reg clk, rst_n;
reg [31:0] x;
wire [31:0] y_hw;

iir I0 (.clk(clk), .rst_n(rst_n), .x(x), .y(y_hw));

always #10 clk = ~clk;
    
initial begin
    
    clk = 0;
    x = 32'd0;
    $display("=== Initialize Success ===");
    
    rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    $display("=== Reseting ===");
    
    #30 x = 32'd1;
    $display("Put in x = %1d", x);
    $display("y_hw = %d", y_hw);
    $display("===================");
    
    #20 x = 32'd2;
    $display("Put in x = %1d", x);
    $display("y_hw = %d", y_hw);
    $display("===================");
    
    #20 x = 32'd3;
    $display("Put in x = %1d", x);
    $display("y_hw = %d", y_hw);
    $display("===================");
    
    #20 x = 32'd4;
    $display("Put in x = %1d", x);
    $display("y_hw = %d", y_hw);
    $display("===================");
    
    #20 x = 32'd5;
    $display("Put in x = %1d", x);
    $display("y_hw = %d", y_hw);
    $display("===================");
    
    #20 x = 32'd6;
    $display("Put in x = %1d", x);
    $display("y_hw = %d", y_hw);
    $display("===================");
    
    #20 x = 32'd7;
    $display("Put in x = %1d", x);
    $display("y_hw = %d", y_hw);
    $display("===================");
    
    #20 x = 32'd8;
    $display("Put in x = %1d", x);
    $display("y_hw = %d", y_hw);
    $display("===================");
    
    #20 $display("=== Test Finished ===");
    $finish;
    
end
    
endmodule
