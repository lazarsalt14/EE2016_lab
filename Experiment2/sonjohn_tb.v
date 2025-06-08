// module jontest;
//     reg rst,in_clk;
//     wire [2:0]cntr;
//     johnson3bit Dut(.in_clk(in_clk),.rst(rst),.cntr(cntr));
//     initial in_clk=1'b0;
//     always #1 in_clk=~in_clk;
//     initial begin
//         #0
//         rst=0;
//         #10
//         rst=1;
//         #200
//         $finish;
//     end
//     initial $monitor("time=%0d,counter=%d",$time,cntr);

// endmodule

module johnson3bit_tb;
    reg inClk;
    reg rst;
    wire [2:0] cntr;
    wire [7:0] Seven_Seg;

    johnson3bit Dut (.Seven_Seg(Seven_Seg),.inClk(inClk),.rst(rst),.cntr(cntr));

    initial inClk = 1'b0;
    always #1 inClk = ~inClk;

    initial begin
        $monitor("Time = %0d ns, rst = %b, cntr = %b, Seven_Seg = %b", $time, rst, cntr, Seven_Seg);

        rst = 1'b0;
        #10;  

        rst = 1'b1;
        #200; 
        $finish;
    end

endmodule
