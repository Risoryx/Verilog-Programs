module tff(input CLK,T,RESET,output reg Q);
    always @(negedge CLK or posedge RESET) begin   //Notice we give negedge here. If we had given positive edge then clock for Flip FLop 2 would have Q complement and not Q. Its a bit complicated but just remember for counters, Clock is negative edge triggered
        if (RESET)
            Q<=0;
        else if (T)
            Q<=~Q;
    end
endmodule

module async_bh(input CLK,T,RESET,output Q1,Q2); // If we wanted to make it 3 bit we would just add output Q3 as well
    
    tff ff1(.CLK(CLK),.T(T),.RESET(RESET),.Q(Q1));
    tff ff2(.CLK(Q1),.T(T),.RESET(RESET),.Q(Q2)); // We would instantiate one more flip flop if we were tasked to design a 3 bit counter
endmodule