module sigdelay #(
  parameter WIDTH = 8
)(
  // interface signals
  input  logic             clk,      // clock
  input  logic             rst,      // reset
  input  logic             wr,
  input  logic             rd,
  input  logic [WIDTH-1:0]            offset,
  input  logic [WIDTH-1:0] mic_signal, // input
  output logic [WIDTH-1:0] delayed_signal //output
);

logic [WIDTH-1:0] address = offset;

counter myCounter (
  .clk (clk),
  .rst (rst),
  .en (1'b1),
  .count (address)
);

ram lol (
  .clk (clk),
  .wr_en (wr),
  .rd_en (rd),
  .wr_addr (address+offset),
  .rd_addr (address),
  .din (mic_signal),
  .dout (delayed_signal)
);

endmodule
