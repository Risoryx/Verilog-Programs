module jkff(input J,K,CLK,RESET,output reg Q,Qbar);
    always @(negedge CLK or posedge RESET) begin
        if (RESET) begin        //Either add a PRESET that makes Q=1 and Qbar=0 initially so that down counter starts off at 1111 immediately or just make RESET so that Q=1 and Qbar=0. 
            Q<=0;               //Because the way we set up this code, the counter initially shows 0000 and only then goes to 1111 and starts down counting
            Qbar<=1;
        end
        else if (J==1 & K==1) begin
            Q<=~Q;
            Qbar<=~Qbar;
    end
    end
endmodule

module async4bitDownCounter(input J,K,CLK,RESET,output Q1,Q2,Q3,Q4,Qbar1,Qbar2,Qbar3,Qbar4);
    


    jkff ff1(.J(J),.K(K),.CLK(CLK),.RESET(RESET),.Q(Q1),.Qbar(Qbar1));      //Doing Proper implementation this time where we make Clock of next flip flop Qbar of previous flip flop and we take Q as output
    jkff ff2(.J(J),.K(K),.CLK(Qbar1),.RESET(RESET),.Q(Q2),.Qbar(Qbar2));
    jkff ff3(.J(J),.K(K),.CLK(Qbar2),.RESET(RESET),.Q(Q3),.Qbar(Qbar3));
    jkff ff4(.J(J),.K(K),.CLK(Qbar3),.RESET(RESET),.Q(Q4),.Qbar(Qbar4));

endmodule