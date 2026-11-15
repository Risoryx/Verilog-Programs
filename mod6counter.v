module tff(input T,CLK,RESET,output reg Q);
    always @(negedge CLK or posedge RESET) begin
            if (RESET)
                Q<=0;
            else if (T)
                Q<=~Q;
            end
endmodule

module mod6counter(input T,CLK,Manual_Reset,output Q0,Q1,Q2);

        wire RESET;     // We input manual resets
        wire MOD_Reset;
        assign MOD_Reset=Q2 & Q1 & ~Q0;
        assign RESET=(Manual_Reset | MOD_Reset); //So if we wanted to manually reset we can, otherwise it only resets when 110 is reached ie it resets at 6. So it successfully acts as a mod 6 counter.



        tff ff1(.T(T),.CLK(CLK),.RESET(RESET),.Q(Q0));
        tff ff2(.T(T),.CLK(Q0),.RESET(RESET),.Q(Q1));
        tff ff3(.T(T),.CLK(Q1),.RESET(RESET),.Q(Q2));

endmodule