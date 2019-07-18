function [phase_t,phase_value]=get_phase(initial_value,tspan_max)
% 本函数的用途是把系统方程的图像和数值存储起来
% 第一个参数为系统方程初始值
% 第二参数为输出文件路径
% output_path='D:\system_1\'
%%
global W;
global K;
format long
tspan=0:0.001:tspan_max;
[phase_t,phase_value]=ode45('system_function',tspan,initial_value);
end
