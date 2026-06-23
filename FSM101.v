 module moore_101_detector (input wire clk, input wire rst, input wire in, output reg out );

    reg [2:0] state;
 
    always @(posedge clk) begin
        if (rst)
            state <= 3'b000;
        else
            state <= {state[1:0], in};
    end
 
    always @(posedge clk) begin
        if (rst)
            out <= 1'b0;
        else
            out <= (state[2] & ~state[1] & state[0]) | (state[1] & ~state[0] & in);         
    end
 
endmodule
 
module mealy_101_detector (input wire clk, input wire rst, input wire in, output wire out );

    reg [2:0] state;
 
    always @(posedge clk) begin
        if (rst)
            state <= 3'b000;
        else
            state <= {state[1:0], in};
    end
 
    assign out = (state[2] & ~state[1] & state[0]) | (state[1] & ~state[0] & in);         

endmodule
 