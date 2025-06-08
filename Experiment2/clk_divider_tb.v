module testbench;
    reg inClk;
    reg reset;
    wire outClk;

    clk_divider Dut(.inClk(inClk),.reset(reset),.outClk(outClk));
    always #5 inClk=~inClk;

    initial begin
        inClk=1'b0;
        #0
        reset=1'b0;
        #5
        reset=1'b1;

        // #10 reset=0;
        // #20 reset=1;

        #100
        $finish;

    end

    initial begin
    $monitor("Time=%0d, inClk=%b, reset=%b, outClk=%b", $time, inClk, reset, outClk);
    end


    
endmodule