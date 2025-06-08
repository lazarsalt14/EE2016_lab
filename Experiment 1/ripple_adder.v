module fulladder(
    input a,b,c,
    output sum,carry

);
    assign sum=(a^b)^(c);
    assign carry=(a&b)|c&(a^b);

endmodule

module ripple_adder(
    input [3:0]a,
    input [3:0]b,
    input initial_carry,
    output s1,s2,s3,s4,
    output carry



);
    //what i have learnt - a reg cant drive a continuos assignment
    wire first_carry,second_carry,third_carry,fourth_carry;
    wire first_sum,second_sum,third_sum,fourth_sum;
    
    fulladder one(.a(a[0]),.b(b[0]),.c(initial_carry),.sum(first_sum),.carry(first_carry));
    fulladder two(.a(a[1]),.b(b[1]),.c(first_carry),.sum(second_sum),.carry(second_carry));
    fulladder three(.a(a[2]),.b(b[2]),.c(second_carry),.sum(third_sum),.carry(third_carry));
    fulladder four(.a(a[3]),.b(b[3]),.c(third_carry),.sum(fourth_sum),.carry(fourth_carry));
    assign s1=first_sum;
    assign s2=second_sum;
    assign s3=third_sum;
    assign s4=fourth_sum;
    assign carry=fourth_carry;


endmodule
