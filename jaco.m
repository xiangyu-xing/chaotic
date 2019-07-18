function dX=jaco(t,X)
% 参数化的描述了jaco矩阵的求解方法,不需要在单独计算方程了
%% 描述参数位置
x=X(1);y=X(2);z=X(3);
Y=[X(4), X(7), X(10);
    X(5), X(8), X(11);
    X(6), X(9), X(12);];
dX=zeros(12,1);
%% k参数为系数,w参数为0-1选择项,D为提前算好的偏导参数
% 通过global避免对几个矩阵的传递
global K;% 3行9列
global W;% 3行9列,只有0或1
P=[x,y,z,x*x,x*y,x*z,y*y,y*z,z*z];
D=[ 1,  0,  0,  2*x,y,  z,  0,  0,  0;...
    0,  1,  0,  0,  x,  0,  2*y,z,  0;...
    0,  0,  1,  0,  0,  x,  0,  y,  2*z;];
%% 描述方程
dX(1)=sum(K(1,:).*W(1,:).*P);
dX(2)=sum(K(2,:).*W(2,:).*P);
dX(3)=sum(K(3,:).*W(3,:).*P);
%% 描述jaco矩阵
Jaco=[sum(K(1,:).*W(1,:).*D(1,:)),...
            sum(K(1,:).*W(1,:).*D(2,:)),...
            sum(K(1,:).*W(1,:).*D(3,:));...
      sum(K(2,:).*W(2,:).*D(1,:)),...
            sum(K(2,:).*W(2,:).*D(2,:)),...
            sum(K(2,:).*W(2,:).*D(3,:));...
      sum(K(3,:).*W(3,:).*D(1,:)),...
            sum(K(3,:).*W(3,:).*D(2,:)),...
            sum(K(3,:).*W(3,:).*D(3,:));];
dX(4:12)=Jaco*Y;
end