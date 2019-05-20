close;clear
%����һ������
load volume_flow_2;load power_select;load pd2_select;
%volume_flow_2��ʵ��������ݻ�Ч�ʱ��ʽ��ʵ���ݻ�������
%�����������
k=1.4;T=1.589;lamta=1.65;D1=0.1785;Cphi=1;Cn1=0.4495;
nr=[15.5416667,20.2166667,24.966667];%24.966667r/s�ǵ��ת��
e_p=(k-1)/k;%����һ�����ţ�ָ��n=39.447;%1.58ת��
%����������ݽ�����
%����������������������������������������������������������������
%��������ݻ�Ч�ʲ���
ROS=[0,0.25,0.5];%the resistence of oil seperator
RAF=0:2:6;%the resistence of air filter
%���滭ʵ���ݻ������͸��������Ĺ�ϵͼ
% mesh(ROS,RAF,Volume_60);%�����Ե�
% mesh(ROS,RAF,Volume_100);%�����Ե�
q_Vt=Cphi*Cn1.*nr.*T*lamta*D1^3;%����һ����
nv_60=Volume_60_2/q_Vt(1)/60;
nv_80=Volume_80_2/q_Vt(2)/60;
nv_100=Volume_100_2/q_Vt(3)/60;%��volume efficiency
%---------------------------------------------------------------------------------%
%������ھ���Ч�ʲ���
nad_60=k/(k-1)*ps(5)*Volume_60_2/60.*((pd2_60./ps(5)).^(e_p)-1)./Pr_2_60;
nad_80(2:3,:)=k/(k-1)*ps(5)*Volume_80_2(2:3,:)/60.*((pd2_80(2:3,:)./ps(5)).^(e_p)-1)./Pr_2_80(2:3,:);
nad_80(1,:)=k/(k-1)*ps(5)*Volume_80_2(1,:)/60.*((pd2_80(1,:)./ps(5)).^(e_p)-1)./Pr_2_80(1,:);
%------------------------------------------------------------%
%���滭����Ч�ʺ�ROF��TO�Ĺ�ϵͼ
ROF=0:0.25:0.5;% the resistence of oil filter
TO=0:2.5:5;%the temperature of oil
figure
mesh(ROF,TO(1:2),nad_60);
hold on;
mesh(ROF,TO,nad_80);
% hold on;
% mesh(ROS,RAF,nad_100);
title('����Ч�����ͷ�о�����Ϳ����������Ĺ�ϵ����ͼ');
xlabel('��������');
ylabel('����ƫ����');
zlabel('����Ч��');