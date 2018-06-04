module frequency(clk,data,mean,freq_out);

	input clk;
	input [11:0] mean;
	input [11:0] data;
	output reg [31:0] freq_out;
	reg [1:0] mode;

	integer counter;

	integer freq_int;
	integer freq_const;

	integer counter_clk;
	reg clk_en;

	initial begin
		counter <= 'd0;
		counter_clk <= 'd0;
		mode <= 2'b00;
		freq_out <= 32'b0000000000;
		freq_const <= 'd100000;  // edited t0 50Mhz before 1000000
		freq_int <= 'd0;
	end

/*	always @(posedge clk) begin

		if(counter_clk == 'd499) begin
			counter_clk <= 'd0;
			clk_en = 1;
		end else begin
			counter_clk <= counter_clk + 1;
			clk_en <= 0;
		end

end*/

	always @(posedge clk) begin

		if(data < mean && mode == 2'b00) begin
			counter <= counter + 'd1;
		end else if(data > mean && mode == 2'b00) begin

			freq_int <= freq_const / counter;
			freq_out <= freq_int[31:0]; //
			counter <= 'd1;
			mode <= 2'b11;
		end else if(data > mean && mode == 2'b11) begin
			counter <= counter + 'd1;
			mode <= 2'b01;
		end else if(data > mean && mode == 2'b01) begin
			counter <= counter + 'd1;
		end else if(data < mean && mode == 2'b01) begin
			counter <= counter + 'd1;
			mode <= 2'b00;
		end

	end

endmodule
