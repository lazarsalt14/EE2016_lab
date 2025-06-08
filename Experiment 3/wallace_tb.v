module test_bench;
    reg [3:0]a,b;
    wire [7:0]M;

    unsigned_mult Dut(.a(a),.b(b),.M(M));
    initial begin
        #0
        a=4'b1000;
        b=4'b0100;

    end
    initial $monitor("%b%b%b%b%b%b%b",M[7],M[6],M[5],M[4],M[3],M[2],M[1],M[0]);


endmodule