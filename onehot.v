module one_hot (
    input w, Clk, R,
    output Z, A, B, C, D, E
);

    // BAH HUMBUG
    wire A_S, B_S, C_S, D_S, E_S;
    wire A_N, B_N, C_N, D_N, E_N;

    dff Alpha(
        .Default(1'b1),
        .D(A_N),
        .clk(Clk),
        .reset(R),
        .Q(A_S)
    );

    dff Beta(
        .Default(1'b0),
        .D(B_N),
        .clk(Clk),
        .reset(R),
        .Q(B_S)
    );
    
    dff Chi(
        .Default(1'b0),
        .D(C_N),
        .clk(Clk),
        .reset(R),
        .Q(C_S)
    );
    
    dff Delta(
        .Default(1'b0),
        .D(D_N),
        .clk(Clk),
        .reset(R),
        .Q(D_S)
    );
    
    dff Epsilon(
        .Default(1'b0),
        .D(E_N),
        .clk(Clk),
        .reset(R),
        .Q(E_S)
    );
    
    // Implement states A, B, C, D, and E states
    assign A_N = 1'b0;
    assign B_N = ~w & A_S;
    assign C_N = ~w & (B_S | C_S);
    assign D_N = w & A_S;
    assign E_N = ~w & (D_S | E_S);*/
    
    assign Z = C_S | E_S;
    
    // Getting Weird Wired
    assign A = A_S;
    assign B = B_S;
    assign C = C_S;
    assign D = D_S;
    assign E = E_S; 

endmodule