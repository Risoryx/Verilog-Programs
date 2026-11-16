module dff(input D,CLK,RESET,output reg Q);
    always @(posedge CLK or posedge RESET) begin
            if (RESET)
                Q<=0;
            else
                Q<=D;
    end
endmodule

module siso_register(input SERIAL_IN,CLK,RESET,MODE,output SERIAL_OUT,Q1,Q2,Q3);  //Right shift Mode=0 , Left shift Mode=1;
        wire Q4;
        wire D1,D2,D3,D4;
        assign D1 =(MODE==0) ? SERIAL_IN : Q2;
        assign D2 =(MODE==0) ? Q1 : Q3;
        assign D3=(MODE==0) ? Q2: Q4;
        assign D4=(MODE==0) ? Q3: SERIAL_IN;

        dff ff1(.D(D1),.CLK(CLK),.RESET(RESET),.Q(Q1));
        dff ff2(.D(D2),.CLK(CLK),.RESET(RESET),.Q(Q2));
        dff ff3(.D(D3),.CLK(CLK),.RESET(RESET),.Q(Q3));
        dff ff4(.D(D4),.CLK(CLK),.RESET(RESET),.Q(Q4));
        assign SERIAL_OUT=(MODE==0) ? Q4 : Q1;
endmodule
