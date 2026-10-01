`timescale 1ns / 1ps


module tb_adder ();
    reg [3:0] a, b;
    wire [3:0] s;
    wire c;
    integer i, j;


full_adder_4 UDT(
    .a(a),
    .b(b),
    .s(s),
    .c(c)
);



    initial begin

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i;
                b = j;
                #10;
            end
        end

        $finish;
    end



endmodule
