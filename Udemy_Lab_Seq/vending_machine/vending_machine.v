`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 11:43:50 AM
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    input clk,
    input rst_n,
    input nickel_in,
    input dime_in,
    input quarter_in,
    input thanks_in,
    output reg candy_out,
    output reg nickel_out,
    output reg [1:0] dime_out
    );
    
// Declaration Part
parameter [3:0] st0 = 4'd0;
parameter [3:0] st5 = 4'd1;
parameter [3:0] st10 = 4'd2;
parameter [3:0] st15 = 4'd3;
parameter [3:0] st20 = 4'd4;
parameter [3:0] st25 = 4'd5;
parameter [3:0] st30 = 4'd6;
parameter [3:0] st35 = 4'd7;
parameter [3:0] st40 = 4'd8;
parameter [3:0] st45 = 4'd9;
parameter [3:0] swait = 4'd10;

reg [3:0] s = st0, s_next;
reg candy_out_local, nickel_out_local;
reg [1:0] dime_out_local;

// Combinational Part
always @*
begin
    
    case(s)
    
    st0:
    begin
        candy_out_local = 0;
        nickel_out_local = 0;
        dime_out_local = 2'b00;
        
        if(nickel_in)
            s_next = st5;
        else if(dime_in)
            s_next = st10;
        else if(quarter_in)
            s_next = st25;
        else
            s_next = st0;
    end
    
    st5:
    begin
        candy_out_local = 0;
        nickel_out_local = 0;
        dime_out_local = 2'b00;
        
        if(nickel_in)
            s_next = st10;
        else if(dime_in)
            s_next = st15;
        else if(quarter_in)
            s_next = st30;
        else
            s_next = st5;
    end
    
    st10:
    begin
        candy_out_local = 0;
        nickel_out_local = 0;
        dime_out_local = 2'b00;
        
        if(nickel_in)
            s_next = st15;
        else if(dime_in)
            s_next = st20;
        else if(quarter_in)
            s_next = st35;
        else
            s_next = st10;
    end
    
    st15:
    begin
        candy_out_local = 0;
        nickel_out_local = 0;
        dime_out_local = 2'b00;
        
        if(nickel_in)
            s_next = st20;
        else if(dime_in)
            s_next = st25;
        else if(quarter_in)
            s_next = st40;
        else
            s_next = st15;
    end
    
    st20:
    begin
        candy_out_local = 0;
        nickel_out_local = 0;
        dime_out_local = 2'b00;
        
        if(nickel_in)
            s_next = st25;
        else if(dime_in)
            s_next = st30;
        else if(quarter_in)
            s_next = st45;
        else
            s_next = st20;
    end
    
    st25:
    begin
        candy_out_local = 1;
        nickel_out_local = 0;
        dime_out_local = 2'b00;
        s_next = swait;
    end
    
    st30:
    begin
        candy_out_local = 1;
        nickel_out_local = 1;
        dime_out_local = 2'b00;
        s_next = swait;
    end
    
    st35:
    begin
        candy_out_local = 1;
        nickel_out_local = 0;
        dime_out_local = 2'b01;
        s_next = swait;
    end
    
    st40:
    begin
        candy_out_local = 1;
        nickel_out_local = 1;
        dime_out_local = 2'b01;
        s_next = swait;
    end
    
    st45:
    begin
        candy_out_local = 1;
        nickel_out_local = 0;
        dime_out_local = 2'b11;
        s_next = swait;
    end
    
    swait:
    begin   
        candy_out_local = 0;
        nickel_out_local = 0;
        dime_out_local = 2'b00;
           
        if(thanks_in == 1)
            s_next = st0;
        else
            s_next = swait;
    end

    default:
    begin
        candy_out_local = 0;
        nickel_out_local = 0;
        dime_out_local = 2'b00;
        s_next = st0;
    end
    
    endcase
end    
    
// Sequential Part
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        s <= st0;
        candy_out <= 0;
        nickel_out <= 0;
        dime_out <= 2'b00;
    end
    else
    begin
        s <= s_next;
        candy_out <= candy_out_local;
        nickel_out <= nickel_out_local;
        dime_out <= dime_out_local;
    end
end

endmodule
