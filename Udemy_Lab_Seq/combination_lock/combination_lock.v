`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 03:34:12 AM
// Design Name: 
// Module Name: combination_lock
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
    input [2:0] number,
    output reg [7:0] code
);

// Declaration Part
parameter [2:0] s0 = 3'd0;
parameter [2:0] s2 = 3'd1;
parameter [2:0] s23 = 3'd2;
parameter [2:0] s234 = 3'd3;
parameter [2:0] s2346 = 3'd4;

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
    
    s0:      code = seven_segment_code_0;
    s2:      code = seven_segment_code_1;
    s23:     code = seven_segment_code_2;
    s234:    code = seven_segment_code_3;
    s2346:   code = seven_segment_code_4;
    default: code = seven_segment_code_0;
    
    endcase 
end

endmodule

module combination_lock(
    input clk,
    input rst_n,
    input [3:0] x,
    input enter,
    input lock,
    output reg door_open,
    output [7:0] seven_segment_data,
    output [3:0] seven_segment_enable
    );
    
// Declaration Part
parameter [2:0] s0 = 3'd0;
parameter [2:0] s2 = 3'd1;
parameter [2:0] s23 = 3'd2;
parameter [2:0] s234 = 3'd3;
parameter [2:0] s2346 = 3'd4;
    
reg [2:0] state = s0, next_state;
reg door_open_local;
reg door_open = 0;

// Combinational Part
always @*
begin
    
    case(state)
    
    s0: 
    begin
        if(enter == 1)
        begin
            if(x == 4'd2)
                next_state = s2;
            else
                next_state = s0;
        end
        else
            next_state = s0;
            
        door_open_local = 0;
    end
    
    s2: 
    begin
        if(enter == 1)
        begin
            if(x == 4'd3)
                next_state = s23;
            else
                next_state = s0;
        end
        else
            next_state = s2;
            
        door_open_local = 0;
    end
    
    s23: 
    begin
        if(enter == 1)
        begin
            if(x == 4'd4)
                next_state = s234;
            else
                next_state = s0;
        end
        else
            next_state = s23;
            
        door_open_local = 0;
    end
    
    s234: 
    begin
        if(enter == 1)
        begin
            if(x == 4'd6)
            begin
                next_state = s2346;
                door_open_local = 1;
            end
            else
            begin
                next_state = s0;
                door_open_local = 0;
            end
        end
        else
        begin
            next_state = s234;
            door_open_local = 0;
        end
    end
    
    s2346: 
    begin
        if(lock == 1)
        begin
            next_state = s0;
            door_open_local = 0;
        end
        else
        begin
            next_state = s2346;
            door_open_local = 1;
        end
    end
    
    default:
    begin
        next_state = s0;
        door_open_local = 0;
    end
    
    endcase 
end
    
// Sequential Part
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        state <= s0;
        door_open <= 0;
    end
    else
    begin
        state <= next_state;
        door_open <= door_open_local;
    end
end

// SSD Part
get_seven_segment_code G0 (.number(state), .code(seven_segment_data));
assign seven_segment_enable = 4'b1110;

endmodule
