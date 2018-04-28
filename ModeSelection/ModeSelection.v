module ModeSelection(clk, ac_button, dc_button, vga_ports);
input clk, ac_button, dc_button;
output vga_ports; //Undefined
integer ac_button_counter, dc_button_counter;

initial
begin
ac_button_counter = 0;
dc_button_counter = 0;
end

always @(posedge clk) begin
	if (ac_button == 0 && ac_button_counter < 'd100) 
	begin
		ac_button_counter <= ac_button_counter + 'd1;
	end 
	else if (ac_button == 1) 
	begin
		ac_button_counter <= 0;
	end
	else
	begin
	//PUT YOUR AC MODE CODE HERE
	end
		
	if (dc_button == 0 && dc_button_counter < 'd100 )
	begin
		dc_button_counter <= dc_button_counter + 'd1;
	end 
	else if (dc_button == 1) 
	begin
		dc_button_counter <= 'd0;
	end
	else 
	begin
	//PUT YOUR DC MODE CODE HERE
	end
end
endmodule