close;clear
%����һ������
load vflow_1select;
load power_select;
load pd1_select;
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
%����������������������������������������������������������������
%��������ݻ�Ч�ʲ���
ROS=[0,0.25,0.5];%the resistence of oil seperator 
RAF=0:2:6;%the resistence of air filter
%���滭ʵ���ݻ������͸��������Ĺ�ϵͼ
% mesh(ROS,RAF,Volume_60);%�����Ե�
% mesh(ROS,RAF,Volume_100);%�����Ե�
q_Vt=Cphi*Cn1.*nr.*T*lamta*D1^3;%����һ����
nv_60=Volume_60/q_Vt(1)/60;
nv_80=Volume_80/q_Vt(2)/60;
nv_100=Volume_100/q_Vt(3)/60;%��volume efficiency
%���滭�ݻ�Ч�ʺ�ROS��RAF�Ĺ�ϵͼ
%�ݻ�Ч��nv��Volume,�ͷ�о���������ĺ���
mesh(ROS,RAF,nv_60,'FaceColor','g','FaceAlpha',0.5);
hold on;
mesh(ROS,RAF,nv_80,'FaceColor','y','FaceAlpha',0.5);
hold on;
mesh(ROS,RAF,nv_100,'FaceColor','b','FaceAlpha',0.5);
title('�ݻ�Ч�����ͷ�о�����Ϳ����������Ĺ�ϵ����ͼ');
xlabel('�ͷ�о����','Rotation',45);
ylabel('��������������','Rotation',-3);
zlabel('�ݻ�Ч��');
legend('60%����','80%����','100%����');
ROS_in=0:0.01:0.5;
RAF_in=0:0.1:10;
[ROS_IN,RAF_IN]=meshgrid(ROS_in,RAF_in);
nv_in_100=interp2(ROS,RAF,nv_100,ROS_IN,RAF_IN);
nv_in_60=interp2(ROS,RAF,nv_60,ROS_IN,RAF_IN);
nv_in_80=interp2(ROS,RAF,nv_80,ROS_IN,RAF_IN);
figure
mesh(ROS_IN,RAF_IN,nv_in_60);
hold on;
mesh(ROS_IN,RAF_IN,nv_in_80);
hold on;    
mesh(ROS_IN,RAF_IN,nv_in_100);
title('�ݻ�Ч�����ͷ�о�����Ϳ����������Ĺ�ϵ����ͼ');
xlabel('�ͷ�о����');
ylabel('��������������');
zlabel('�ݻ�Ч��');
% close all;
%����������������������������������������������������������������������������
%������ھ���Ч�ʲ���
nad_60=k/(k-1)*ps(2)*Volume_60.*((pd1_60./ps(2)).^(e_p)-1)./Pr_1_60_A;
nad_80=k/(k-1)*ps(3)*Volume_80.*((pd1_80./ps(3)).^(e_p)-1)./Pr_1_80_A;
nad_100(1:2,:)=k/(k-1)*ps(1)*Volume_100(1:2,:).*((pd1_100(1:2,:)./ps(1)).^(e_p)-1)./Pr_1_100_A(1:2,:);
nad_100(3:4,:)=k/(k-1)*ps(2)*Volume_100(3:4,:).*((pd1_100(3:4,:)./ps(2)).^(e_p)-1)./Pr_1_100_A(3:4,:);
%���滭����Ч�ʺ�ROS��RAF�Ĺ�ϵͼ
figure
mesh(ROS,RAF,nad_60);
hold on;   
mesh(ROS,RAF,nad_80);
hold on;   
mesh(ROS,RAF,nad_100);
title('����Ч�����ͷ�о�����Ϳ����������Ĺ�ϵ����ͼ');
xlabel('�ͷ�о����');
ylabel('��������������');
zlabel('����Ч��');