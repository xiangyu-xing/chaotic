function [phase_t,phase_value]=get_phase(initial_value,tspan_max)
% ����������;�ǰ�ϵͳ���̵�ͼ�����ֵ�洢����
% ��һ������Ϊϵͳ���̳�ʼֵ
% �ڶ�����Ϊ����ļ�·��
% output_path='D:\system_1\'
%%
global W;
global K;
format long
tspan=0:0.001:tspan_max;
[phase_t,phase_value]=ode45('system_function',tspan,initial_value);
end
