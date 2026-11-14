module tff(input CLK,T,RESET,output reg Q);
    always @(negedge CLK or posedge RESET) begin //Negative edge triggered because positive edge triggering is complex for counters imo
        if (RESET)
            Q<=0;
        else if (T)
            Q<=~Q;
        end

endmodule

module sync3bit(input CLK,T,RESET,output Q1,Q2,Q3); //Giving Q1,Q2,Q3 as inputs because we are printing them in testbench and its just easier to print them if they are provided as output
    wire T2,T3; //Only T of first flip flop is given as external input. T2 and T3 are determined in the circuit
    assign T2=Q1;
    assign T3=Q1 & Q2;        //To make it 4 bit do T4=Q1&Q2&Q3 and do one more instantiation. Rule is T= And(&) of all previous flip flops Q. For 2nd flip flop its just T=Q1 since there is only one flip flop preceding it
    tff ff1(.CLK(CLK),.T(T),.RESET(RESET),.Q(Q1));    
    tff ff2(.CLK(CLK),.T(T2),.RESET(RESET),.Q(Q2));
    tff ff3(.CLK(CLK),.T(T3),.RESET(RESET),.Q(Q3));
endmodule
