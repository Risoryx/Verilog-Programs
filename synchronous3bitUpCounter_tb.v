module sync3bit_tb;
    reg CLK_tb,RESET_tb,T_tb;
    wire Q1_tb,Q2_tb,Q3_tb;
    sync3bit test1(.CLK(CLK_tb),.RESET(RESET_tb),.T(T_tb),.Q1(Q1_tb),.Q2(Q2_tb),.Q3(Q3_tb));


    initial CLK_tb=0;
    always #1 CLK_tb=~CLK_tb;


    initial begin
        RESET_tb=1;
        T_tb=1;
        #1 RESET_tb=0; //Reset is asynchronous so we can change it whenever without risking race condition
        #2 
        #2 
        #2 
        #2 
        #30 //You could just do a single cumulative delay as well! Whatever makes you happy : )
        $finish;
    end

    initial begin
        $monitor("%t | CLK=%b | T=%b | RESET=%b | COUNT=%b%b%b",$time,CLK_tb,T_tb,RESET_tb,Q3_tb,Q2_tb,Q1_tb); //MSB is output of rightmost flip flop and LSB is output of leftmost flip flop!
        $dumpfile("sync3bit.vcd");
        $dumpvars();
    end
endmodule
