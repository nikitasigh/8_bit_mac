`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2023 22:45:08
// Design Name: 
// Module Name: mac_8_bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mac_8_bit(In1,In2,clk,rst,OUT);
input[7:0]In1,In2;
input clk,rst;  
output  reg [18:0]OUT;
reg[7:0]in1_reg,in2_reg;
wire cin=1'b0;
wire co;
wire[18:0]Out1_rca;
wire[15:0]product_16;
reg[18:0]in_reg;
wire[18:0]out_am;

assign out_am={product_16[15],product_16[15],product_16[15],product_16};
signed_multiplier MULTIPLIER(.a(in1_reg),.b(in2_reg),.z(product_16));
rca_adder RCA(.A({out_am}),.B(in_reg),.CIN(cin),.COUT(co),.SUM(Out1_rca));

always@(posedge clk)
begin
if(rst)begin 
in1_reg<=0;
in2_reg<=0;
OUT<=0;
in_reg<=19'd0;end
else begin 
in1_reg<=In1;
in2_reg<=In2;
OUT<=Out1_rca;
in_reg<=Out1_rca;
end
end
endmodule
 


