// Author: Anthony Yalong
// Description: Testbench to test the functionality of a DFF.
// Note: The error count does check for a D Latch. To ensure proper functionality, please examin the waveform.

`define DELAY 5

module dff_tb();
    reg D, clk, reset;
    wire Q, Qbar;

    integer i;
    integer error_count = 0;

    dff DUT (
        .D(D),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qbar(Qbar)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Initialize
        clk = 0;
        D = 0;
        reset = 1;
        #(`DELAY);

        // Test reset logic
        reset = 0; 
        #(`DELAY);

        if (Q !== 0 || Qbar !== 1) begin
            error_count = error_count + 1;
            $display("[FAIL] Reset failed: Q=%b, Qbar=%b", Q, Qbar);
        end else begin
            $display("[PASS] Reset successful: Q=%b, Qbar=%b", Q, Qbar);
        end
        #(`DELAY);

        // Test D input behavior
        reset = 1;
        for (i = 0; i < 4; i = i + 1) begin
            D = i[0];
            @(posedge clk)
            #1

            if (Q !== D) begin
                error_count = error_count + 1;
                $display("[FAIL] D=%b, Expected Q=%b, Got Q=%b", D, D, Q);
            end else begin
                $display("[PASS] D=%b, Q=%b", D, Q);
            end
        end
        #(`DELAY);

        // Test toggling D rapidly
        for (i = 0; i < 4; i = i + 1) begin
            D = ~D;
            @(posedge clk);
            #1

            if (Q !== D) begin
                error_count = error_count + 1;
                $display("[FAIL] Toggle Test: D=%b, Expected Q=%b, Got Q=%b", D, D, Q);
            end else begin
                $display("[PASS] Toggle Test: D=%b, Q=%b", D, Q);
            end
        end
        #(`DELAY);

        // Test reset logic
        reset = 0; 
        #(`DELAY);

        if (Q !== 0 || Qbar !== 1) begin
            error_count = error_count + 1;
            $display("[FAIL] Reset failed: Q=%b, Qbar=%b", Q, Qbar);
        end else begin
            $display("[PASS] Reset successful: Q=%b, Qbar=%b", Q, Qbar);
        end

        // End of test
        $display("Test Finished: error_count=%d", error_count);
        $finish;
    end
endmodule
