`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 07:06:19 AM
// Design Name: 
// Module Name: bcd_counter_multicycle
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

module get_seven_segment_code(
    input [3:0] number,
    output reg [7:0] code
);

// Declaration Part
parameter [7:0] seven_segment_code_0 = 8'b11000000;
parameter [7:0] seven_segment_code_1 = 8'b11111001;
parameter [7:0] seven_segment_code_2 = 8'b10100100;
parameter [7:0] seven_segment_code_3 = 8'b10110000;
parameter [7:0] seven_segment_code_4 = 8'b10011001;
parameter [7:0] seven_segment_code_5 = 8'b10010010;
parameter [7:0] seven_segment_code_6 = 8'b10000010;
parameter [7:0] seven_segment_code_7 = 8'b11111000;
parameter [7:0] seven_segment_code_8 = 8'b10000000;
parameter [7:0] seven_segment_code_9 = 8'b10010000;

always @(*)
begin
    case(number)
    
    4'd0:    code = seven_segment_code_0;
    4'd1:    code = seven_segment_code_1;
    4'd2:    code = seven_segment_code_2;
    4'd3:    code = seven_segment_code_3;
    4'd4:    code = seven_segment_code_4;
    4'd5:    code = seven_segment_code_5;
    4'd6:    code = seven_segment_code_6;
    4'd7:    code = seven_segment_code_7;
    4'd8:    code = seven_segment_code_8;
    4'd9:    code = seven_segment_code_9;
    default: code = seven_segment_code_0;
    
    endcase 
end

endmodule

module bcd_counter_multicycle(
    input clk,
    input rst_n,
    input pulse,
    output [7:0] seven_segment_data,
    output [3:0] seven_segment_enable
    );   

reg [3:0] counter_state = 4'd0;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        counter_state <= 4'd0;
    else 
    begin 
        if(pulse == 1)
        begin
            if(counter_state == 4'd9)
                counter_state <= 4'd0;
            else
                counter_state <= counter_state + 4'd1;
        end
    end
end 

// SSD Part
get_seven_segment_code G0 (.number(counter_state), .code(seven_segment_data));
assign seven_segment_enable = 4'b1110;
    
endmodule
