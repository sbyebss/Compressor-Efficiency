%--------------------------------------------------------%
%测试interp3，结果必须得是均匀的网格gg
% [X,Y,Z,V] = flow(10);
% figure
% slice(X,Y,Z,V,[6 9],2,0);
% shading flat
% [Xq,Yq,Zq] = meshgrid(.1:.25:10,-3:.25:3,-3:.25:3);
% Vq = interp3(X,Y,Z,V,Xq,Yq,Zq);
% figure
% slice(Xq,Yq,Zq,Vq,[6 9],2,0);
% shading flat
%--------------------------------------------------------%
%测试griddata
x = 2*rand(2500,1) - 1; 
y = 2*rand(2500,1) - 1; 
z = 2*rand(2500,1) - 1;
v = x.^2 + y.^3 - z.^4;
d = -1:0.05:1;
[xq,yq,zq] = meshgrid(d,d,0);
vq = griddata(x,y,z,v,xq,yq,zq);
plot3(x,y,v,'ro')
hold on
surf(xq,yq,vq)