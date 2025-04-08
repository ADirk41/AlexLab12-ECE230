module binary_states (
    input w, Clk, R,
    output Z, [2:0] Y_out
);
    
    // *Spliced from Lab Instructions, then modified for 3 bits*
    wire [2:0] Y_S; // Current y
    wire [2:0] Y_N; // Next Y
    
    dff zero(
        .Default(1'b0),
        .D(Y_N[0]),
        .clk(Clk),
        .reset(R),
        .Q(Y_N[0])
    );
    
    dff one(
        .Default(1'b0),
        .D(Y_N[1]),
        .clk(Clk),
        .reset(R),
        .Q(Y_N[1])
    );
    
    dff two(
        .Default(1'b0),
        .D(Y_N[2]),
        .clk(Clk),
        .reset(R),
        .Q(Y_N[2])
    );
    
    // Implement states A, B, C, D, and E states
    assign Y_N[0] = ~w & ~(Y_S[1] ^ Y_S[0]) | w & ~Y_S[2] & (~Y_S[1] | ~Y_S[0]);
    assign Y_N[1] = w & ~Y_S[2] & ~Y_S[1] | (Y_S[1] ^ Y_S[0]);
    assign Y_N[2] = w & (Y_S[2] | Y_S[1] & Y_S[0]);
    
    // Getting Weird Wired
    assign Z = Y_S[2] | Y_S[1] & ~Y_S[0];
    assign Y_out = Y_S;
    
endmodule