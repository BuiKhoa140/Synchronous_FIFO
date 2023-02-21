module fifo (clk, data_in, readsignal, writesignal, data_out, full, empty);
input clk, readsignal, writesignal;
input [7:0]data_in;
output full, empty;
output [7:0]data_out;
				
reg [7:0] FIFO [15:0];
wire full, empty;
reg [3:0] ffstatus = 0;
reg [7:0] data_out;
reg [3:0] writep = 0;
reg [3:0] readp = 0;

assign full = (ffstatus == 15);
assign empty = (ffstatus == 0);

always @ (posedge clk)
begin
	if (writesignal == 1 && full != 1 && readsignal == 0) // write not read
	begin
		FIFO[writep] <= data_in;
		writep <= writep + 1;
		ffstatus <= ffstatus + 1;
	end

	if (readsignal == 1 && empty != 1 && writesignal == 0) // read not write
	begin
		data_out <= FIFO[readp];
		readp <= readp + 1;
		ffstatus <= ffstatus - 1;
	end
	
	if (writesignal == 1 && readsignal == 1) // read and write
	begin 
		FIFO[writep] <= data_in;
		data_out <= FIFO[readp];
		writep <= writep + 1;
		readp <= readp + 1;
	end
end

endmodule
