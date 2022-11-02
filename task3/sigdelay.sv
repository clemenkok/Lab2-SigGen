module sigdelay #(
    parameter       A_WIDTH = 8,
                    D_WIDTH = 8
)(
    input logic                 clk,
    input logic                 rst,
    input logic                 wr,
    input logic                 rd,
    input logic [D_WIDTH-1:0]   offset,
    input logic [D_WIDTH-1:0]   mic_signal,
    output logic [D_WIDTH-1:0]   delayed_signal
);

    logic   [A_WIDTH-1:0]       address;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (rd),
    .incr (offset),
    .count (address)
);

ram audioRam (
    .clk (clk),
    .wr_addr (address),
    .rd_addr (offset),
    .wr_en (wr),
    .rd_en (rd),
    .din (mic_signal),
    .dout (delayed_signal)
);

endmodule
