module dff_testbench;

    reg d,rst,clk;
    wire q,qbar;
    dflipflop_withreset Dut(.q(q),.qbar(qbar),.d(d),.rst(rst),.clk(clk));
    always #5 clk=~clk;
    initial begin
        #0
        d=1'b0;
        rst=1'b0;
        clk=0;
        #10
        d=1'b1;

        #20
        rst=1'b1;
        #10
        $finish;

    end

    initial begin
        $monitor("Time=%0d, q=%b,qbar=%b",$time,q,qbar);
    end


endmodule