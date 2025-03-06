// Divide clock by 488(16mhz -> 32.768khz), used to generate 32.768 kHz clock for AON block
module clkdivider
(
  input wire clk,
  input wire resetn,
  output reg clk_out
);

  reg [8:0] counter;

  always @(posedge clk)
  begin
    if (~resetn)
    begin
      counter <= 9'd0;
      clk_out <= 1'b0;
    end

    //else if (counter == 8'hff)
    else if (counter == 9'd243) 
    begin
      counter <= 9'd0;
      clk_out <= ~clk_out;
    end
    else
    begin
      counter <= counter+1;
    end
  end
endmodule
