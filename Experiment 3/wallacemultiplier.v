module fulladder(
    input a,b,c,
    output sum,carry

);
    assign sum=(a^b)^(c);
    assign carry=(a&b)| c&(a^b);

endmodule

module half_adder(
    input a,
    input b,
    output sum,
    output carry
);

    assign sum = a ^ b;
    assign carry = a & b;

endmodule


module unsigned_mult( M, a, b );
input [3:0]a,b;
output [7:0]M;
reg p[3:0][3:0];
wire s5,s4,s3,s2,s1,s0;
wire c5,c4,c3,c2,c1,c0;
integer i,j;


always @(a or b)
    begin
        for(i=0;i<=3;i++)
        begin
            for(j=0;j<=3;j++)
            begin
                p[i][j]=a[j]&b[i];
            end
        end
    end

    assign M[0]=p[0][0];

    half_adder h1(.a(p[0][1]),.b(p[1][0]),.sum(s0),.carry(c0));

    assign M[1]=s0;

    fulladder f1(.a(p[0][2]),.b(p[1][1]),.c(p[2][0]),.sum(s1),.carry(c1));
    fulladder f2(.a(p[0][3]),.b(p[1][2]),.c(p[2][1]),.sum(s2),.carry(c2));
    half_adder h2(.a(p[1][3]),.b(p[2][2]),.sum(s3),.carry(c3));

    half_adder h3(.a(s1),.b(c0),.sum(s4),.carry(c4));
    fulladder f3(.a(s2),.b(c1),.c(p[3][0]),.sum(s5),.carry(c5));
    fulladder f4(.a(s3),.b(c2),.c(p[3][1]),.sum(s6),.carry(c6));
    fulladder f5(.a(p[2][3]),.b(c3),.c(p[3][2]),.sum(s7),.carry(c7)); 
    
    assign M[2]=s4;

    half_adder h4(.a(s5),.b(c4),.sum(s8),.carry(c8));
    fulladder f6(.a(s6),.b(c5),.c(c8),.sum(s9),.carry(c9));
    fulladder f7(.a(s7),.b(c6),.c(c9),.sum(s10),.carry(c10));
    fulladder f8(.a(p[3][3]),.b(c7),.c(c10),.sum(s11),.carry(c11));

    assign M[3]=s8;
    assign M[4]=s9;
    assign M[5]=s10;
    assign M[6]=s11;
    assign M[7]=c11;



endmodule