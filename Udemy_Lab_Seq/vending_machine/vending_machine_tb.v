`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 12:10:34 PM
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb();

reg clk, rst_n, nickel_in, dime_in, quarter_in, thanks_in;
wire candy_out, nickel_out;
wire [1:0] dime_out;

vending_machine V0 (.clk(clk), .rst_n(rst_n), .nickel_in(nickel_in), .dime_in(dime_in), .quarter_in(quarter_in),
                    .thanks_in(thanks_in), .candy_out(candy_out), .nickel_out(nickel_out), .dime_out(dime_out));

task put_coin;
    input nickel_in_num, dime_in_num, quarter_in_num;
    
    begin
        #20 
        nickel_in = nickel_in_num;
        dime_in = dime_in_num;
        quarter_in = quarter_in_num;
    
        if(nickel_in)
            $display("Put 1 nickel inside: +5 $");
        else if(dime_in)
            $display("Put 1 dime inside: +10 $");
        else if(quarter_in)
            $display("Put 1 quarter inside: +25 $");
        else
            $display("Don't put any coins");
            
        $display("candy_out = %b, nickel_out = %b, dime_out = %b", candy_out, nickel_out, dime_out);
        $display("===================");
        
        #20 
        nickel_in = 0;
        dime_in = 0;
        quarter_in = 0;
        
        for(integer i = 0; i < 3; i = i + 1)
        begin
            #20 
            $display("Waiting..."); 
            $display("candy_out = %b, nickel_out = %b, dime_out = %b", candy_out, nickel_out, dime_out);
            $display("===================");
        end
    
    end
endtask

always #10 clk = ~clk;

initial begin

    clk = 0;
    nickel_in = 0;
    dime_in = 0;
    quarter_in = 0;
    thanks_in = 0;
    $display("=== Initialize Success ===");
    
    rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    $display("=== Reseting ===");
    
    #30 $display("=== Test Result ===");
    put_coin(0, 0, 0); // no coin
    put_coin(0, 1, 0); // dime
    put_coin(0, 1, 0); // dime
    put_coin(0, 0, 1); // quarter
    
    $display("=== Test Finished ===");
    $finish;

end

endmodule
