`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 04:32:05 AM
// Design Name: 
// Module Name: uart_receiver
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


module uart_receiver(
    input clk,
    input rst_n,
    input uart_rx,
    input baud_rate_signal,
    output reg [7:0] data,
    output reg valid_data
    );
    
// Declaration Part
parameter idle = 0;
parameter receive = 1;

reg [7:0] d;
reg [4:0] bit_counter = 4'd0, next_bit_counter;
reg state = idle, next_state;
reg stop_bit, valid_data_local = 0;

// Combinational Part
always @*
begin

    case(state)
        
        idle:
        begin
            if(baud_rate_signal == 1)
            begin
                if(uart_rx == 0)
                    next_state = receive;
                else
                    next_state = idle;
            end
            else
                next_state = idle;
                
            valid_data_local = 0;
            next_bit_counter = 4'd0;
        end
        
        receive:
        begin
            if(baud_rate_signal == 1)
            begin
                if(bit_counter == 4'd8)
                begin
                    stop_bit = uart_rx;
                    
                    if(uart_rx == 1)
                        valid_data_local = 1;
                    else
                        valid_data_local = 0;
                        
                    next_bit_counter = 4'd0;
                    next_state = idle;
                end
                else
                begin
                    d[bit_counter] = uart_rx;
                    next_bit_counter = bit_counter + 4'd1;
                    next_state = state;
                    valid_data_local = 0;
                end
            end
            else
            begin
                valid_data_local = 0;
                next_state = receive;
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
        data <= 8'd0;
        valid_data <= 0;
    end
    else
    begin
        state <= next_state;
        bit_counter <= next_bit_counter;
        data <= d;
        valid_data <= valid_data_local;
    end

end
    
endmodule
