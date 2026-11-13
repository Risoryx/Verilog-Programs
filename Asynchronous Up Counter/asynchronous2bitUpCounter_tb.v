module async2bitup_tb;
    reg CLK_tb,T_tb,RESET_tb;
    wire Q1_tb,Q2_tb;

    async_bh test1(.CLK(CLK_tb),.T(T_tb),.RESET(RESET_tb),.Q1(Q1_tb),.Q2(Q2_tb));
    initial CLK_tb=0;    // Here we're setting initial Clock value as 1 
    always #1 CLK_tb=~CLK_tb;

    initial begin
        RESET_tb=1;    //Initialsing Q values of all flip flops to 0
        T_tb=1;
        #1 RESET_tb=0; //Just doing a delay of 1 just to make it so that it doesn't coincide with negative edge of Clock
        #20 //You can put a different interval if you wish to count for longer
        $finish;

    end

    initial begin
    $monitor("%t | CLK=%b | T=%b | RESET=%b | Count=%b%b",$time,CLK_tb,T_tb,RESET_tb,Q2_tb,Q1_tb);   //Remember leftmost Flip Flop gives LSB and rightmost Flip Flop gives MSB
        $dumpfile("2bitup.vcd");
        $dumpvars();
    end

endmodule