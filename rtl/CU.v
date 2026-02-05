//control unit 控制单元 ID
module CU(
    input  wire [6:0] opcode,  // 指令[6:0]
    input  wire [2:0] funct3,  // 指令[14:12]
    input  wire [6:0] funct7,  // 指令[31:25]
    output wire       we,       // 寄存器写使能
    output wire       alu_src,  // ALU输入源选择 (0:寄存器, 1:立即数)
    output wire [3:0] alu_ctrl  // 告诉ALU做什么运算 (加/减) 加0000 减0001
);
    always @(*) begin
        case(opcode)
            //R型
            7'b0110011:begin
                case(funct3)
                    //ADD和SUB
                    3'b000:begin
                        case(funct7)
                            //ADD
                            7'b0000000: begin
                                we = 1'b1;
                                alu_src = 1'b0;
                                alu_ctrl = 4'b0000;
                            end
                            //SUB
                            7'b0100000: begin
                                we = 1'b1;
                                alu_src = 1'b0;
                                alu_ctrl = 4'b0001;
                            end
                        endcase
                    end
                endcase
            //I型
            7'0010011：begin
                case(funct3)
                //ADDI
                    7'b000: begin
                        we = 1'b1;
                        alu_src = 1'b0;
                        alu_ctrl = 4'b0000;
                   end
                endcase
            end
            end
        endcase
    end
endmodule





 