module async2bitup_tb;
    reg CLK_tb,T_tb,RESET_tb;
    wire Q1_tb,Q2_tb,Q1bar_tb,Q2bar_tb;

    async_bh test1(.CLK(CLK_tb),.T(T_tb),.RESET(RESET_tb),.Q1(Q1_tb),.Q2(Q2_tb),.Q1bar(Q1bar_tb),.Q2bar(Q2bar_tb));
    initial CLK_tb=0;    // Here we're setting initial Clock value as 1 
    always #1 CLK_tb=~CLK_tb;

    initial begin
        RESET_tb=1;    //Initialsing Q values of all flip flops to 0
        T_tb=1;        // Setting T=1;
        #1 RESET_tb=0; //Just changing Reset at 1 so it doesn't coincide with first Negative Clock edge which occurs at time 2.
        #20            //Count for however long you need
        $finish;

    end

    initial begin
    $monitor("%t | CLK=%b | T=%b | RESET=%b | UpCount=%b%b | Downcount=%b%b",$time,CLK_tb,T_tb,RESET_tb,Q2_tb,Q1_tb,Q2bar_tb,Q1bar_tb);   //Remember leftmost Flip Flop gives LSB and rightmost Flip Flop gives MSB
        $dumpfile("2bitup.vcd");
        $dumpvars();
    end

endmodule