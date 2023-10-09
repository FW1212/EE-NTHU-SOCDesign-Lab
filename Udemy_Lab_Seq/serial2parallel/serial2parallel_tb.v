`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 07:50:25 AM
// Design Name: 
// Module Name: serial2parallel_tb
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


module serial2parallel_tb();

reg clk, rst_n, d, start_serial_data;
reg [7:0] data = 8'b01001101;
wire end_conversion;
wire [7:0] a;

serial2parallel S0 (.clk(clk), .rst_n(rst_n), 
                    .serial_start(start_serial_data), .d(d), 
                    .end_conversion(end_conversion), .a(a));

always #10 clk = ~clk;

initial begin
    
    clk = 0;
    start_serial_data = 0;
    $display("=== Initialize Success ===");
    
    rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    $display("=== Reseting ===");
    
    #30 start_serial_data = 1;
    for(integer i = 0; i < 8; i = i + 1)
    begin
        d = data[i];
        #20 start_serial_data = 0;
    end
    $display("=== Test Result ===");
    #20 $display("a = %b", a);
    
    if(a == data)
        $display("=== Test Passed ===");
    else
        $display("=== Test Failed ===");
     
end

endmodule
