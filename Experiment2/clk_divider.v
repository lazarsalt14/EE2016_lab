module clk_divider (inClk,reset,outClk);
input inClk;
input reset;
output outClk;
reg outClk;
reg [3:0]clockCount;
reg [3:0]v;
// declare a vector (of type reg) called clockCount of appropriate size
always @(negedge reset or posedge inClk)

    begin
    if (reset == 1'b0)
    begin
        // initialize clockCount, outClk suitably
        clockCount<=4'b0000;
        outClk<=1'b0;
        v<=4'b0100;
    end

    else
    begin
        clockCount<=clockCount+1;
        if (clockCount[3:0]==v[3:0])
        begin
            clockCount<=4'b0000;
            outClk <= ~outClk;
        end
        
    end


// increment clockCount
// determine an appropriate value v (by hand) and
// check if clockCount has reached v
// to reset and negate outClk
end
endmodule