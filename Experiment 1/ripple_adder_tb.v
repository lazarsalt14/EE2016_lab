module test_bench;
    reg [3:0]a,b;
    reg c;
    wire s1,s2,s3,s4,carry;
    ripple_adder DuT(a,b,c,s1,s2,s3,s4,carry);
    initial 
    begin
        #0
        a=4'b0000;
        b=4'b1111;
        c=1'b1;
    end

    initial $monitor("sum= %b%b%b%b, carry=%b",s4,s3,s2,s1,carry);


endmodule


