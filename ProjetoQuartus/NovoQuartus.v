module NovoQuartus (clk, botao, led);
input clk, botao;
output [3:0] led;
wire [3:0] out;
assign led = ~out;


 processador u0 (
        .clk_clk         (clk),         //      clk.clk
        .reset_reset_n   (1'b1),   //    reset.reset_n
        .ledout_export   (out),   //   ledout.export
        .botaoout_export (~botao)  // botaoout.export
    );

endmodule 