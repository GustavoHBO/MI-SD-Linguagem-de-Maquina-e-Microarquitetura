module NovoQuartus (clk, botao, led);
input clk, botao;
output [3:0] led;
wire [3:0] out;
assign led = ~out;
  processador u0 (
        .clk_clk                          (clk),                          //                       clk.clk
        .reset_reset_n                    (1'b1),                    //                     reset.reset_n
        .pio_0_external_connection_export (out), // pio_0_external_connection.export
        .pio_1_external_connection_export (~botao)  // pio_1_external_connection.export
    );
endmodule 