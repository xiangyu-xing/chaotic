function [x,y,z]= get_initial_value
%% 用于生成混沌系统的初始值
% 初值的生成肯定不止这一个条件
global W;
global K;
while(1)
    init_value=abs(floor(10*rands(1,3))+1);
    out=system_function(0,init_value);
    if out(1)~=0 && out(2)~=0 && out(3)~=0
        break;
    end 
end
x=init_value(1);
y=init_value(2);
z=init_value(3);

