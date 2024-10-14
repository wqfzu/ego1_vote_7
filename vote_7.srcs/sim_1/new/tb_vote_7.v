`timescale 10ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/26 09:17:30
// Design Name: 
// Module Name: tb_vote_7
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

module tb_vote_7;
reg[6:0] vote;
wire pass;
vote_7  v1(.pass(pass),.vote(vote));  //调用仿真模块
initial begin
  vote = 0;
  repeat(10) #10   // 重复十次
      begin
        vote <= (vote<<1) | 7'b1;   //每次左移并和0000001做位运算 
      end
  end
endmodule

