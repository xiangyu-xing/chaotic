function result=trend_code(x1,x0,y1,y0)
%用四种代码描述混沌吸引子的拓扑运动方式
%编码定义符合坐标轴中象限的定义
dx=x1-x0;
dy=y1-y0;
if dx>=0 && dy>=0
    result=1;
elseif dx<0 && dy<0
    result=4;
elseif dx<0 && dy>=0
    result=2;
elseif dx<0 && dy<0
    result =3;
else
    result=1;
end
end