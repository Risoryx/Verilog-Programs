module siso_tb;
    wire SERIAL_OUT_tb,Q1_tb,Q2_tb,Q3_tb;
    reg CLK_tb,RESET_tb,SERIAL_IN_tb;

    siso_register test1(.CLK(CLK_tb),.RESET(RESET_tb),.SERIAL_IN(SERIAL_IN_tb),.SERIAL_OUT(SERIAL_OUT_tb),.Q1(Q1_tb),.Q2(Q2_tb),.Q3(Q3_tb));


    initial CLK_tb=0;
    always #1 CLK_tb=~CLK_tb;


    initial begin
        RESET_tb=1;
        #2 RESET_tb=0;
        SERIAL_IN_tb=1;
        #2 SERIAL_IN_tb=0;
        #2 SERIAL_IN_tb=1;
        #2 SERIAL_IN_tb=1;
        #2 SERIAL_IN_tb=0;
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
