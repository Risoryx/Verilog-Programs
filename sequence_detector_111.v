// Sequence we are trying to detect is 111. Overlapping is allowed
//We are using a Moore machine so we use n+1 states for n bits.
// Here sequence to be detected is 111 which is 3 bits so we use 4 states.

module sequence_detector(input CLK,RESET,SERIAL_IN,output reg D_out);   
        reg [1:0] state,next_state;                     

        always @(posedge CLK or posedge RESET) begin
            if (RESET)
                state<=2'b00;
            else 
                state<=next_state;
        end

        always @(*) begin


            case(state)
                2'b00:
                    next_state=(SERIAL_IN) ? 2'b01 : 2'b00;
                2'b01:
                    next_state=(SERIAL_IN) ? 2'b10: 2'b00;
                2'b10:
                    next_state=(SERIAL_IN) ? 2'b11: 2'b00;
                2'b11:
                    next_state=(SERIAL_IN) ? 2'b01 : 2'b00;
            endcase
        end

        always @(*) begin
            if (state==2'b11)
                D_out=1;
            else
                D_out=0;
        end
endmodule
