module tff(input CLK,T,RESET,output reg Q,Qbar); //Designing it similar to up counter but just taking Qbar as output because taking Q will give us up counter and taking its complement which is Qbar will give us down counter.
    always @(negedge CLK or posedge RESET) begin   //Notice we give negedge here. If we had given positive edge then clock for Flip FLop 2 would have Q complement and not Q. Its a bit complicated but just remember that for counters, Clock is negative edge triggered
        if (RESET) begin
            Q<=0;
            Qbar<=1;
        end
        else if (T) begin
            Q<=~Q;
            Qbar<=~Qbar;
        end
    end
endmodule

module async_bh(input CLK,T,RESET,output Q1,Q2,Q1bar,Q2bar);  //For making it 3 bit or higher, just add Q3 and Q3bar and so on and just instantiate flip flops as per your need
    
    tff ff1(.CLK(CLK),.T(T),.RESET(RESET),.Q(Q1),.Qbar(Q1bar));
    tff ff2(.CLK(Q1),.T(T),.RESET(RESET),.Q(Q2),.Qbar(Q2bar)); //For asynchronous, clock of all successive flip flops is Q of previous flip flop. Only the first flip flop receives actual Clock input.
endmodule