%This main file is to calculate the pressure difference between
%the main engine and the final exhaust vent
close;clear
%����һ������
load p_MF1;
%�����������
k=1.4;
% ps=100846.6393421;%3000Pa=0.03bar ��ѹ
T=1.58;
lamta=1.65;
D1=0.1785;
Cphi=1;
Cn1=0.4495;
nr=[15.5416667,20.2166667,24.966667];%24.966667r/s�ǵ��ת��
e_p=(k-1)/k;%����һ�����ţ�ָ��n=39.447;%1.58ת��
%����������ݽ�����
