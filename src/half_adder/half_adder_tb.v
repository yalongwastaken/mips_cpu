`define DELAY 5

module half_adder_tb();
    reg  a, b;
    wire sum, cout;

    integer i;
    reg [31:0] error_count = 0;

    half_adder DUT(
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        for (i = 0; i <= 7; i = i + 1) begin
            {b, a} = i;
            #(`DELAY)
            if ({cout, sum} != a + b) begin
                error_count = error_count + 1;
                $display("TEST FAIL: a=%1d b=%1d sum=%1d cout=%1d", a, b, sum, cout);
            end else begin
                $display("TEST PASS: a=%1d b=%1dsum=%1d cout=%1d", a, b, sum, cout);
            end
        end

        $display("Test Finish: error_count=%1d", error_count);

        $finish;
    end
endmodule