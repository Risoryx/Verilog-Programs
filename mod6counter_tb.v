module mod6counter_tb;
    reg CLK_tb,RESET_tb,T_tb;
    wire Q0_tb,Q1_tb,Q2_tb;

    mod6counter test1(.T(T_tb),.CLK(CLK_tb),.Manual_Reset(RESET_tb),.Q0(Q0_tb),.Q1(Q1_tb),.Q2(Q2_tb));

    initial CLK_tb=0;
    always #1 CLK_tb=~CLK_tb; //Negative edges occur at 2,4,6,8,10 and so on

    initial begin
        RESET_tb=1;  //Manually resetting so that flip flops can be initialised with value 0
        T_tb=1;
        #1 RESET_tb=0;
        #60
        
        $finish;
    end

    initial begin
        $monitor("%t | CLK=%b | RESET=%b | T=%b | Count=%b%b%b",$time,CLK_tb,RESET_tb,T_tb,Q2_tb,Q1_tb,Q0_tb);
        $dumpfile("mod6counter.vcd");
        $dumpvars();
    end

endmodule