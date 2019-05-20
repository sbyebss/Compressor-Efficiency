close;clear
% 加载一下数据
load vflow_1select;
load power_select;
load pd1_select;
load p_MF1;
%最基本的数据
k=1.4;
% ps=100846.6393421;%3000Pa=0.03bar 表压
T=1.589;
lamta=1.65;
D1=0.1785;
Cphi=1;
Cn1=0.4495;
nr=[15.5416667,20.2166667,24.966667];%24.966667r/s是电机转速
e_p=(k-1)/k;%就是一个符号，指数n=39.447;%1.58转速
%最基本的数据结束了
% %————下面关于容积效率部分——————
ROS=[0,0.25,0.5];%the resistence of oil seperator
RAF=0:2:6;%the resistence of air filter
%下面画实际容积流量和各个参数的关系图
% mesh(ROS,RAF,Volume_60);%是线性的
% mesh(ROS,RAF,Volume_100);%是线性的
q_Vt=Cphi*Cn1.*nr.*T*lamta*D1^3;%这是一个数
nv_60=Volume_60/q_Vt(1)/60;
nv_80=Volume_80/q_Vt(2)/60;
nv_100=Volume_100/q_Vt(3)/60;%算volume efficiency
%--------------------------------------------------------------%
% %下面画容积效率和ROS、RAF的关系图
% %容积效率nv是Volume,油分芯，空滤器的函数
% mesh(ROS,RAF,nv_60,'FaceColor','g','FaceAlpha',0.5);
% hold on;
% mesh(ROS,RAF,nv_80,'FaceColor','y','FaceAlpha',0.5);
% hold on;
% mesh(ROS,RAF,nv_100,'FaceColor','b','FaceAlpha',0.5);
% title('容积效率与油分芯阻力和空滤器阻力的关系曲面图');
% xlabel('油分芯阻力','Rotation',45);
% ylabel('空气过滤器阻力','Rotation',-3);
% zlabel('容积效率');
% legend('60%气量','80%气量','100%气量');
% %--------下面开始做容积效率的插值-------------%
% nv(:,:,1)=nv_60;
% nv(:,:,2)=nv_80;
% nv(:,:,3)=nv_100;
% [ROS_in_raw,RAF_in_raw,Vflow_in_raw] = meshgrid(0:.25:.5,0:2:6,0:40:80);
% Vflow_in_raw(:,:,1)=Volume_60./9.5*100;
% Vflow_in_raw(:,:,2)=Volume_80./9.5*100;
% Vflow_in_raw(:,:,3)=Volume_100./9.5*100;
% [ROS_in,RAF_in,Vflow_in] = meshgrid(0:.05:.5,0:.5:6,61:5:99.5);
% nv_in=griddata(ROS_in_raw,RAF_in_raw,Vflow_in_raw,nv,ROS_in,RAF_in,Vflow_in,'natural');
% %以下是曾经二维的数据
% % ROS_in=0:0.01:0.5;
% % RAF_in=0:0.1:10;
% % [ROS_IN,RAF_IN]=meshgrid(ROS_in,RAF_in);
% % nv_in_100=interp2(ROS,RAF,nv_100,ROS_IN,RAF_IN);
% % nv_in_60=interp2(ROS,RAF,nv_60,ROS_IN,RAF_IN);
% % nv_in_80=interp2(ROS,RAF,nv_80,ROS_IN,RAF_IN);
% figure
% for i=1:size(nv_in,3)
%     mesh(ROS_in(:,:,1),RAF_in(:,:,1),nv_in(:,:,i));
%     hold on;
% end
% title('容积效率与容积流量、油分芯阻力和空滤器阻力的插值曲面图');
% xlabel('油分芯阻力');
% ylabel('空气过滤器阻力');
% zlabel('容积效率');
% % close all;
%——————————————————————————————————————
%下面关于绝热效率部分
nad_60=k/(k-1)*ps(2)*Volume_60/60.*((pd1_60./ps(2)).^(e_p)-1)./Pr_1_60_A;
nad_80=k/(k-1)*ps(3)*Volume_80/60.*((pd1_80./ps(3)).^(e_p)-1)./Pr_1_80_A;
nad_100(1:2,:)=k/(k-1)*ps(1)*Volume_100(1:2,:)/60.*((pd1_100(1:2,:)./ps(1)).^(e_p)-1)./Pr_1_100_A(1:2,:);
nad_100(3:4,:)=k/(k-1)*ps(2)*Volume_100(3:4,:)/60.*((pd1_100(3:4,:)./ps(2)).^(e_p)-1)./Pr_1_100_A(3:4,:);
%下面画绝热效率和ROS、RAF的关系图
figure
mesh(ROS,RAF,nad_60);
hold on;
mesh(ROS,RAF,nad_80);
hold on;
mesh(ROS,RAF,nad_100);
title('绝热效率与油分芯阻力和空滤器阻力的关系曲面图');
xlabel('油分芯阻力');
ylabel('空气过滤器阻力');
zlabel('绝热效率');
%--------------------------------------------------------------%
%下面分析压差和ROS、RAF的关系
%下面画的是各个气量的时候压差的图
% figure
% mesh(ROS,RAF,p_MF1_60*1e5,'FaceColor','g','FaceAlpha',0.5);
% hold on;
% mesh(ROS,RAF,p_MF1_80*1e5,'FaceColor','y','FaceAlpha',0.5);
% hold on;
% mesh(ROS,RAF,p_MF1_100*1e5,'FaceColor','b','FaceAlpha',0.5);
% hold on;
% title('主机和整机排气压差与油分芯阻力和空滤器阻力的关系曲面图');
% xlabel('油分芯阻力');
% ylabel('空气过滤器阻力');
% zlabel('主机和整机排气压差');
% legend('60%气量','80%气量','100%气量');
%下面画压差与气量、油分芯阻力的关系
% p_MF1