module full_adder(a, b, cin, sum, cout);
    input wire a, b, cin;
    output reg sum, cout;
    wire s0, s1, c0, c1;

    half_adder ha1(
        .a(a),
        .b(b),
        .sum(s0),
        .cout(c0)
    );

    half_adder ha2(
        .a(cin),
        .b(s0),
        .sum(s1),
        .cout(c1)
    );

    always @(*) begin
        cout = c0 | c1;
        sum = s1;
    end
endmodule