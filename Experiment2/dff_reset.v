module dflipflop_withreset(q, qbar, d, rst, clk);
output q,qbar;
input d, rst, clk;
reg q,qbar;
always @ (posedge clk)
begin
    if (~rst)
    begin
        q=d; 
        qbar=~d;
    end

    else
    begin
        q=1'b0;
        qbar=1'b1;
    end
end
endmodule

