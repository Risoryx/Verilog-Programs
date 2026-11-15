module detector_tb;
    reg CLK_tb,RESET_tb,SERIAL_IN_tb;
    wire D_out_tb;

    sequence_detector test1(.CLK(CLK_tb),.RESET(RESET_tb),.SERIAL_IN(SERIAL_IN_tb),.D_out(D_out_tb));

    initial CLK_tb=0;
    always #1 CLK_tb=~CLK_tb;

    initial begin
        RESET_tb=1;
        #2 RESET_tb=0;
        SERIAL_IN_tb=1; 
        #2 SERIAL_IN_tb=1;
        #2 SERIAL_IN_tb=1;
        #2 SERIAL_IN_tb=0;
        #2 SERIAL_IN_tb=1;
        #2
        $finish;
    end

    initial begin
        $monitor("%t | CLK=%b | SERIAL_IN=%b | RESET=%b | Output=%b",$time,CLK_tb,SERIAL_IN_tb,RESET_tb,D_out_tb);
        $dumpfile("detector111.vcd");
        $dumpvars();
    end
endmodule

        