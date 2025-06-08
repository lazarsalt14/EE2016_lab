module tester;
    reg a,b,c;
    wire sum,carry;

    fulladder hi(a,b,c,sum,carry);
    initial begin
        #0
        a=1'b0;
        b=1'b0;
        c=1'b0;
        #10
        a=1'b0;
        b=1'b0;
        c=1'b1;
        #20
        a=1'b0;
        b=1'b1;
        c=1'b0;
        #30
        a=1'b0;
        b=1'b1;
        c=1'b1;
        #40
        a=1'b1;
        b=1'b0;
        c=1'b0;
        #50
        a=1'b1;
        b=1'b0;
        c=1'b1;
        #60
        a=1'b1;
        b=1'b1;
        c=1'b0;
        #70
        a=1'b1;
        b=1'b1;
        c=1'b1;

    end
    initial $monitor(" a=%b, b=%b, c=%b, sum=%b, carry=%b",a,b,c,sum,carry);

endmodule