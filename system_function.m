function dY=system_function(t,Y)
% 已经写成标准形式的系统方程，无须进行修改
% 为save_xiangtu的子函数
dY=zeros(3,1);
x=Y(1);y=Y(2);z=Y(3);
global K;% 3行9列
global W;% 3行9列,只有0或1
P=[x,y,z,x*x,x*y,x*z,y*y,y*z,z*z];
dY(1)=sum(K(1,:).*W(1,:).*P);
dY(2)=sum(K(2,:).*W(2,:).*P);
dY(3)=sum(K(3,:).*W(3,:).*P);
end