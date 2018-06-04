module oc_bb(clock, reset, ADC_CS_N, ADC_DIN, ADC_SCLK, ADC_DOUT, output_led);
	input clock, reset;
	output wire  [11:0] output_led;
	output wire ADC_CS_N;         // ADC chip selection
	output wire  ADC_DIN;          // ADC serial data in (to ADC)
	output wire ADC_SCLK;         // ADC serial clock
	input ADC_DOUT;              // ADC serial data out (from ADC)
	wire [11:0] serial_parallel_data;


ADC oro(.clock(clock), .reset(reset), .ADC_CS_N(ADC_CS_N), .ADC_DIN(ADC_DIN), .ADC_SCLK(ADC_SCLK), .ADC_DOUT(ADC_DOUT), .serial_parallel_data(serial_parallel_data));

magnitude bb(.voltage(serial_parallel_data), .clk(clock), .dc_offset(output_led));

endmodule 