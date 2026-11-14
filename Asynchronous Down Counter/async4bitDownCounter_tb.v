module async4bitDownCounter_tb;
    reg J_tb,K_tb,CLK_tb,RESET_tb;
    wire Q1_tb,Q2_tb,Q3_tb,Q4_tb,Qbar1_tb,Qbar2_tb,Qbar3_tb,Qbar4_tb;
    

    async4bitDownCounter test1(.J(J_tb),.K(K_tb),.CLK(CLK_tb),.RESET(RESET_tb),.Q1(Q1_tb),.Q2(Q2_tb),.Q3(Q3_tb),.Q4(Q4_tb),.Qbar1(Qbar1_tb),.Qbar2(Qbar2_tb),.Qbar3(Qbar3_tb),.Qbar4(Qbar4_tb));

    initial CLK_tb=0;
    always #1 CLK_tb=~CLK_tb;

    initial begin
        RESET_tb=1;
        J_tb=1; K_tb=1;
        #1 RESET_tb=0;
        #40
        $finish;
    end

    initial begin
        $monitor("%t | CLK=%b | JK=%b%b | RESET=%b | COUNT=%b%b%b%b",$time,CLK_tb,J_tb,K_tb,RESET_tb,Q4_tb,Q3_tb,Q2_tb,Q1_tb);
        $dumpfile("4bitDownCounter.vcd");
        $dumpvars();
    end
endmodule