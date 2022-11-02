module sinegen #(
    parameter       A_WIDTH = 8,
                    D_WIDTH = 8
)(
    input logic                 clk,
    input logic                 rst,
    input logic                 en,
    input logic [D_WIDTH-1:0]   incr1,
    input logic [D_WIDTH-1:0]   incr2,
    output logic [D_WIDTH-1:0]  dout1,
    output logic [D_WIDTH-1:0]  dout2
);

    logic   [A_WIDTH-1:0]       addr1;
    logic   [A_WIDTH-1:0]       addr2;

counter1 addrCounter1 (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr1),
    .count (addr1)
);

counter2 addrCounter2 (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr2),
    .count (addr2)
);

rom1 sineRom1 (
    .clk (clk),
    .addr (addr1),
    .dout (dout1)
);

rom2 sineRom2 (
    .clk (clk),
    .addr (addr2),
    .dout (dout2)
);

endmodule
