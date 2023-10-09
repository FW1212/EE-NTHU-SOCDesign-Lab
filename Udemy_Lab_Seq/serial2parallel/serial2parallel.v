`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 07:27:20 AM
// Design Name: 
// Module Name: serial2parallel
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


module serial2parallel(
    input clk,
    input rst_n,
    input serial_start,
    input d,
    output reg end_conversion,
    output reg [7:0] a
    );
    
reg [3:0] counter = 4'd8, next_counter;
reg load;
reg [7:0] a_reg_out;

// Combinational Part
always @*
begin 
    if(serial_start == 1)
    begin
        a_reg_out[0] = d;
        next_counter = 4'd0;
        end_conversion = 0;
        load = 0;
    end
    else if(counter < 4'd6)
    begin
        a_reg_out[counter + 4'd1] = d;
        next_counter = counter + 4'd1;
        end_conversion = 0;
        load = 0;
    end
    else if(counter == 4'd6)
    begin
        a_reg_out[counter + 4'd1] = d;
        next_counter = counter + 4'd1;
        end_conversion = 0;
        load = 1;
    end
    else if(counter == 4'd7)
    begin
        next_counter = counter + 4'd1;
        end_conversion = 1;
        load = 0;
    end
    else
    begin
        end_conversion = 0;
        load = 0;
    end

end

// Sequential Part
always @(posedge clk or negedge rst_n)
begin 
    if(!rst_n)
    begin
        counter <= 4'd8;
        a <= 8'd0;
    end
    else if(load)
    begin
        counter <= next_counter;
        a <= a_reg_out;
    end
    else
    begin
        counter <= next_counter;
    end
end
    
endmodule
