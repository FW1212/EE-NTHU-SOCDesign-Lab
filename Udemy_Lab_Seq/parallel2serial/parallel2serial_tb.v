`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 11:14:25 PM
// Design Name: 
// Module Name: parallel2serial_tb
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


module parallel2serial_tb();

reg clk, rst_n, bgn;
reg [7:0] in_parallel, out_serial;
wire serial_start, serial_end, d;

parallel2serial P0 (.clk(clk), .rst_n(rst_n), .a(in_parallel), .bgn(bgn), 
                    .d(d), .serial_start(serial_start), .serial_end(serial_end));

always #10 clk = ~clk;

initial begin
    
    clk = 0;
    bgn = 0;
    in_parallel = 8'b11010011;
    $display("=== Initialize Success ===");
    
    rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    $display("=== Reseting ===");
    
    $display("=== Test Result ===");
    #30 bgn = 1;
    for(integer i = 0; i < 8; i = i + 1)
    begin
        #20 bgn = 0;
        out_serial[i] = d;
        in_parallel = 8'd0;
        $display("When i = %1d:", i);
        $display("d = %b, serial_start = %b, serial_end = %b", d, serial_start, serial_end);
    end
    #20$display("out_serial = %b", out_serial);
    
    if(in_parallel == out_serial)
        $display("=== Test Passed ===");
    else
        $display("=== Test Failed ===");
     
end

endmodule
