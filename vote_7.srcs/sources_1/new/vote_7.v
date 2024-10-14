`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/26 09:09:44
// Design Name: 
// Module Name: vote_7
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


module TG(pass,segment_out,vote,an);  //���½�����Դ�ļ�TG
integer i,n;
output wire an;          //�����λ�ź�
output reg[7:0] pass;    //passλ8λ������������һλ��ʾ����ͶƱ�Ƿ�ͨ����
output reg[7:0] segment_out;    //�˶������
input [6:0] vote;        //vote7��ͶƱ������
reg[3:0] vote_count;     //����

assign an=1;    //�����λ�ź�
always@(vote)begin
  vote_count=0;
  for(i = 0;i<7;i = i+1) begin
    if (vote[i])
      vote_count = vote_count+1;
  end
end
always@(vote)
for(n = 0;n<7; n= n+1)
 pass[n] = vote[n];    //��ͶƱ�������pass
always@(vote_count)  
pass[7] = (vote_count>3) ? 1 : 0;    //���һλΪ����ͶƱ���

always@(vote_count)       //�����������ʾ
   begin
     case(vote_count)         
        4'd0: begin segment_out <= 8'b00111111; end
        4'd1: begin segment_out <= 8'b00000110; end
        4'd2: begin segment_out <= 8'b01011011; end
        4'd3: begin segment_out <= 8'b01001111; end
        4'd4: begin segment_out <= 8'b01100110; end
        4'd5: begin segment_out <= 8'b01101101; end
        4'd6: begin segment_out <= 8'b01111101; end
        4'd7: begin segment_out <= 8'b00000111; end
        4'd8: begin segment_out <= 8'b01111111; end
        default: begin segment_out <= 8'b11111111; end
     endcase
   end
endmodule



