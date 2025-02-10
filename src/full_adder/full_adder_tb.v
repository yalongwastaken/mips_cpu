`define DELAY 5

module full_adder_tb();
    reg  a, b, cin;
    wire sum, cout;

    integer i;
    reg [31:0] error_count = 0;

    full_adder DUT(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        for (i = 0; i <= 7; i = i + 1) begin
            {cin, b, a} = i;
            #(`DELAY)
            if ({cout, sum} != a + b + cin) begin
                error_count = error_count + 1;
                $display("TEST FAIL: a=%1d b=%1d cin=%1d sum=%1d cout=%1d", a, b, cin, sum, cout);
            end else begin
                $display("TEST PASS: a=%1d b=%1d cin=%1d sum=%1d cout=%1d", a, b, cin, sum, cout);
            end
        end

        $display("Test Finish: error_count=%1d", error_count);

        $finish;
    end
endmodule