//程序计数器 IF
module PC( 
    input wire clk,
    input wire rst_n,
    output reg [31:0] pc_out
);
    reg [31:0] pc_reg;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            pc_reg <= 32'b0;
        end else begin
            pc_reg <= pc_reg + 32'd4;
        end
    end
    assign pc_out = pc_reg;
endmodule