module siso_tb;
    wire SERIAL_OUT_tb,Q1_tb,Q2_tb,Q3_tb;
    reg CLK_tb,RESET_tb,SERIAL_IN_tb;

    siso_register test1(.CLK(CLK_tb),.RESET(RESET_tb),.SERIAL_IN(SERIAL_IN_tb),.SERIAL_OUT(SERIAL_OUT_tb),.Q1(Q1_tb),.Q2(Q2_tb),.Q3(Q3_tb));


    initial CLK_tb=0;
    always #1 CLK_tb=~CLK_tb; //Clock's positive edges are at 1,3,5,7,9,11....


    initial begin
        RESET_tb=1;   //Setting Reset=1 so that all flip flops are storing 0
        #2 RESET_tb=0;
        SERIAL_IN_tb=1;
        #2 SERIAL_IN_tb=0;
        #2 SERIAL_IN_tb=1;
        #2 SERIAL_IN_tb=1; //Takes 7 positive clock edges to get data out
        #2 SERIAL_IN_tb=0; //So that flip flops once again all store 0 since the serial input is 1101 with 1 leaving first and then 0 and so on
        #2 
        #2 
        #2 
        #2
        $finish;
    end

    initial begin
        $monitor("%t | CLK=%b | RESET=%b | SERIAL_IN=%b | Q1=%b | Q2=%b | Q3=%b | SERIAL_OUT=%b",$time,CLK_tb,RESET_tb,SERIAL_IN_tb,Q1_tb,Q2_tb,Q3_tb,SERIAL_OUT_tb);
        $dumpfile("siso.vcd");
        $dumpvars();
    end
endmodule
