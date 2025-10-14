`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/08 15:57:03
// Design Name: 
// Module Name: gosoccer_sim
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


module gosoccer_sim( );
    logic [15:0] sw;
    logic [15:0] led;
    
    //ʵ����
    gosoccer A(.SW(sw),
               .LED(led));
               
    initial
    begin
        integer i;
        
        //�ȸ�sw��ֵΪ0
        for(i = 15 ; i >= 0 ; --i)
            sw[i] = 0;
        
        //10ns�����޸�15λ��0λ��sw��ֵ
        #10
         //�޸�15����ʾ���쵫û�յ����
         
        sw[15] = 1;
        #10
        
        //��ʾ�пյ���������
        sw[15] = 0;
        sw[0] = 1;
        #10
        
        //��ʾ�п�����������
        sw[15] = 1;
        
    end
endmodule
