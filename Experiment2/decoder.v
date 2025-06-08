module decoder(cntr,Seven_Seg);
input [3:0] cntr;
output [7:0] Seven_Seg;
reg [6:0] val;
assign Seven_Seg = {1'b1,~val}; // Think of the reason for this assignment ...
always@(cntr) // Think of the reason for having cntr in the sensitivity list
begin
case(cntr)
4'd0: val =7'b0111111;
4'd1: val =7'b0000110;
4'd2: val =7'b1011011;
4'd3: val =7'b1001111;
4'd4: val =7'b1100110;
4'd5: val =7'b1101101;
4'd6: val =7'b1111101;
4'd7: val =7'b0000111;
4'd8: val =7'b1111111;
4'd9: val =7'b1001111;
default: val = 7'b0000000;
endcase
end
endmodule