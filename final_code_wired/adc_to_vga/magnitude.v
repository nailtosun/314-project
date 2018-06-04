module magnitude(voltage,clk,amp,dc_offset);
input [11:0] voltage;// dimension are changign wrt adc
input clk;
output reg [11:0] amp;
integer counter;
output reg [11:0] dc_offset;

reg [11:0] max;
reg [11:0] min;

initial
begin
amp <= 12'b0;
max <= 12'b0;
min <= 12'b111111111111;
end

always @(posedge clk)
begin
	if(max<voltage) max<=voltage;
	else max<=max;

	if(min>voltage) min<=voltage;
	else min<=min;

	amp<=(max-min);

	dc_offset<=(max+min)/2;

	counter<=counter+1;

	if(counter==49999999)
	begin
		amp <= 12'b0;
		max <= 12'b0;
		min <= 12'b111111111111;
		counter <= 'd0;
	end



end

endmodule
