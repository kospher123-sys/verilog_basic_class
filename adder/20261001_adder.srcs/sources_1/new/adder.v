`timescale 1ns / 1ps

module full_adder_4 (
    // input  a1,
    // input  a2,
    // input  a3,
    // input  a4,
    input [3:0] a,
    // input  b1,
    // input  b2,
    // input  b3,
    // input  b4,
    input [3:0] b,
    //input  cin,
    // output s1,
    // output s2,
    // output s3,
    // output s4,
    output [3:0] s,
    output c
);
    //wire w_c1, w_c2, w_c3;

    full_adder U_FA1 (
        .a  (a[0]),
        .b  (b[0]),
        .cin(1'b0),
        .s  (s[0]),
        .c  (w_c1)
    );
    full_adder U_FA2 (
        .a  (a[1]),
        .b  (b[1]),
        .cin(w_c1),
        .s  (s[1]),
        .c  (w_c2)
    );
    full_adder U_FA3 (
        .a  (a[2]),
        .b  (b[2]),
        .cin(w_c2),
        .s  (s[2]),
        .c  (w_c3)
    );
    full_adder U_FA4 (
        .a  (a[3]),
        .b  (b[3]),
        .cin(w_c3),
        .s  (s[3]),
        .c  (c)
    );

endmodule

module full_adder (
    input  a,
    input  b,
    input  cin,
    output s,
    output c
);

    wire w_s1, w_c1, w_c2;

    half_adder U_HA0 (
        .a(a),
        .b(b),
        .s(w_s1),
        .c(w_c1)
    );

    half_adder U_HA1 (
        .a(w_s1),
        .b(cin),
        .s(s),     // full_adder autput s
        .c(w_c2)
    );

    assign c = w_c1 | w_c2;

endmodule

module half_adder (
    input  a,
    input  b,
    output s,
    output c
);

    assign s = a ^ b;
    assign c = a & b;


endmodule
