module mux_4_to_1 (
    input wire [3:0] in,     // 4 data inputs
    input wire [1:0] sel,    // 2 select lines
    output reg out           // Output
);

    always(in or sel) begin
        case (sel)
            2'b00: out = in[0];
            2'b01: out = in[1];
            2'b10: out = in[2];
            2'b11: out = in[3];
            default: out = 1'bx; // Unknown output for safety
        endcase
    end

endmodule
