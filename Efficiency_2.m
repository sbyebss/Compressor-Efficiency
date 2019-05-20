close;clear
%加载一下数据
load volume_flow_2;load power_select;load pd2_select;
%volume_flow_2是实验二测试容积效率表达式的实际容积流量们
%最基本的数据
k=1.4;T=1.589;lamta=1.65;D1=0.1785;Cphi=1;Cn1=0.4495;
nr=[15.5416667,20.2166667,24.966667];%24.966667r/s是电机转速
e_p=(k-1)/k;%就是一个符号，指数n=39.447;%1.58转速
%最基本的数据结束了
%————————————————————————————————
%下面关于容积效率部分
ROS=[0,0.25,0.5];%the resistence of oil seperator
RAF=0:2:6;%the resistence of air filter
%下面画实际容积流量和各个参数的关系图
% mesh(ROS,RAF,Volume_60);%是线性的
% mesh(ROS,RAF,Volume_100);%是线性的
q_Vt=Cphi*Cn1.*nr.*T*lamta*D1^3;%这是一个数
nv_60=Volume_60_2/q_Vt(1)/60;
nv_80=Volume_80_2/q_Vt(2)/60;
nv_100=Volume_100_2/q_Vt(3)/60;%算volume efficiency
%---------------------------------------------------------------------------------%
%下面关于绝热效率部分
nad_60=k/(k-1)*ps(5)*Volume_60_2/60.*((pd2_60./ps(5)).^(e_p)-1)./Pr_2_60;
nad_80(2:3,:)=k/(k-1)*ps(5)*Volume_80_2(2:3,:)/60.*((pd2_80(2:3,:)./ps(5)).^(e_p)-1)./Pr_2_80(2:3,:);
nad_80(1,:)=k/(k-1)*ps(5)*Volume_80_2(1,:)/60.*((pd2_80(1,:)./ps(5)).^(e_p)-1)./Pr_2_80(1,:);
%------------------------------------------------------------%
%下面画绝热效率和ROF、TO的关系图
ROF=0:0.25:0.5;% the resistence of oil filter
TO=0:2.5:5;%the temperature of oil
figure
mesh(ROF,TO(1:2),nad_60);
hold on;
mesh(ROF,TO,nad_80);
% hold on;
% mesh(ROS,RAF,nad_100);
title('绝热效率与油分芯阻力和空滤器阻力的关系曲面图');
xlabel('油滤阻力');
ylabel('油温偏移量');
zlabel('绝热效率');