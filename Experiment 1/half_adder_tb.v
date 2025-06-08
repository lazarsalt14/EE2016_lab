module addertester;
    reg a, b;
    wire sum, carry;

    half_adder temp(a ,b ,sum ,carry);

    initial 
    begin
        #0
        a=1'b1;
        b=1'b0;
        #10
        a = 1'b0;
        b = 1'b0;
        #10
        a = 1'b1;
        b = 1'b1;
        #10
        a=1'b0;
        b=1'b1;
        #10
        $finish;
    end

    initial 
    begin
    $monitor($time, " a=%b, b=%b, s=%b, c=%b",a ,b ,sum ,carry);
    end

endmodule
