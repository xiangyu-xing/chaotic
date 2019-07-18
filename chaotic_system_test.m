% function chaotic_system_test
%% 声明初始信息
root_path='D:\chaotic\';
%% 先随机生产系统
global W;% 3行9列,只有0或1
global K;% 3行9列
load example_data.mat W K;
%% 生成初始值，并进行判断
[temp_x,temp_y,temp_z]=get_initial_value;
initial_value=[temp_x,temp_y,temp_z];
%% 路径控制
filename_number=1;
output_path=[root_path,'system_',num2str(filename_number),'\'];
mkdir(output_path);
%% 根据初值计算LE，并保存结果
step=0.01;
tend=10;
tspan_max=200;  
LE_rough=get_ly(step,tend,initial_value);%先进行粗经度计算
mode_code=check_ly(LE_rough);%计算再次计算的精度
LE_detailed=reget_ly(step,tend,initial_value,mode_code);%计算精度更高的数据
chaotic_sign=check_chaotic(LE_detailed);%判断时候是混沌系统
if chaotic_sign==1
    %% 如果是混沌，就绘制相图调用save_phase_figure,并保存系统信息
    save_ly(LE_detailed,output_path);
    [phase_t, phase_value]=get_phase(initial_value,tspan_max);
    save_phase(phase_t,phase_value,output_path);
else
    %% 处理非混沌的情况
    disp('this way out')
end

