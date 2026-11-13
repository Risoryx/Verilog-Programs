module dff(input D,CLK,RESET,output reg Q);
    always @(posedge CLK or posedge RESET) begin
            if (RESET)
                Q<=0;
            else
                Q<=D;
    end
endmodule

module siso_register(input SERIAL_IN,CLK,RESET,output SERIAL_OUT,Q1,Q2,Q3);
        wire Q4;

        dff ff1(.D(SERIAL_IN),.CLK(CLK),.RESET(RESET),.Q(Q1));
        dff ff2(.D(Q1),.CLK(CLK),.RESET(RESET),.Q(Q2));
        dff ff3(.D(Q2),.CLK(CLK),.RESET(RESET),.Q(Q3));
        dff ff4(.D(Q3),.CLK(CLK),.RESET(RESET),.Q(Q4));
        assign SERIAL_OUT=Q4;
endmodule
