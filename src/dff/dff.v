// Author: Anthony Yalong
// Description: Positive-edge triggered D Flip-Flop with active-low asynchronous reset.

module dff (D, clk, reset, Q, Qbar);
    input wire D, clk, reset;
    output reg Q, Qbar;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            Q <= 0;
            Qbar <= 1;
        end else begin
            Q <= D;
            Qbar <= ~D;
        end
    end
endmodule