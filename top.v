module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
    binary_states bin_stin (
        .w(sw),
        .Clk(btnC),
        .R(btnU),
        .za(led[1]),
        .Y_out(led[9:7])
    );
    
    one_hot oneshot (
        .w(sw),
        .Clk(btnC),
        .R(btnU),
        .za(led[0]),
        .A(led[2]),
        .B(led[3]),
        .C(led[4]),
        .D(led[5]),
        .E(led[6])
    );

endmodule