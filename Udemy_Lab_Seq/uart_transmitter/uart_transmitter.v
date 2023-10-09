`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 03:53:26 AM
// Design Name: 
// Module Name: uart_transmitter
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


module uart_transmitter(
    input clk,
    input rst_n,
    input [7:0] data,
    input baud_rate_signal,
    input start,
    output reg uart_tx
    );
    
// Declaration Part
parameter idle = 0;
parameter transmit = 1;

wire [9:0] d;
assign d[9:0] = {1'b1, data[7:0], 1'b0};

reg state = idle, next_state;
reg [3:0] bit_counter = 4'd0, next_bit_counter;
reg uart_tx_local;

// Combinational Part
always @*
begin
   
    case(state)
    
        idle:
        begin
            if(start == 1)
            begin
                next_state = transmit;
                uart_tx_local = 1;
                next_bit_counter = 4'd0;
            end
            else
            begin
                next_state = idle;
                uart_tx_local = 1;
                next_bit_counter = 4'd0;
            end
        end
        
        transmit:
        begin
            if(baud_rate_signal == 1)    
            begin
                if(bit_counter == 4'd10)
                begin
                    next_state = idle;
                    uart_tx_local = 1;
                    next_bit_counter = 4'd0;
                end
                else
                begin
                    next_state = transmit;
                    uart_tx_local = d[bit_counter];
                    next_bit_counter = bit_counter + 4'd1;
                end
            end
            else
            begin 
                if(bit_counter == 4'd0)
                    uart_tx_local = 1;
                else
                    uart_tx_local = d[bit_counter - 4'd1];
                    
                next_state = transmit;
                next_bit_counter = bit_counter;
            end
        end
    
    endcase
end  
  
// Sequential Part
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        state <= idle;
        bit_counter <= 4'd0;
        uart_tx <= 1;
    end
    else
    begin
        state <= next_state;
        bit_counter <= next_bit_counter;
        uart_tx <= uart_tx_local;
    end
end

endmodule
