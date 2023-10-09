`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 04:21:36 AM
// Design Name: 
// Module Name: combination_lock_tb
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


module combination_lock_tb();

reg clk, rst_n, enter, lock;
reg [3:0] x;
wire [7:0] seven_segment_data;
wire [3:0] seven_segment_enable;
wire door_open;

combination_lock C0 (.clk(clk), .rst_n(rst_n), .x(x), .enter(enter), .lock(lock), .door_open(door_open), 
                     .seven_segment_data(seven_segment_data), .seven_segment_enable(seven_segment_enable));

always #10 clk = ~clk;

initial begin
    
    clk = 0;
    x = 4'd0;
    enter = 0;
    lock = 0;
    $display("=== Initialize Success ===");
    
    rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    $display("=== Reseting ===");
    
    $display("=== Test Result ===");
    
    #30 x = 4'd1; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd2; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd3; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd1; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd2; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd3; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd4; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd6; enter = 0; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd6; enter = 0; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd6; enter = 0; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd6; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd1; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd2; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd2; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd2; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd2; enter = 1; lock = 1;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    $display("===================");
    
    #20 x = 4'd2; enter = 1; lock = 0;
    $display("When x = %1d, enter = %b, lock = %b:", x, enter, lock);
    $display("door_open = %b, seven_degment_data = %b", door_open, seven_segment_data);
    
    $display("=== Test Finished ===");
    $finish;
end

endmodule
