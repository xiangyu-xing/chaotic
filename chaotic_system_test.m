% function chaotic_system_test
%% ������ʼ��Ϣ
root_path='D:\chaotic\';
%% ���������ϵͳ
global W;% 3��9��,ֻ��0��1
global K;% 3��9��
load example_data.mat W K;
%% ���ɳ�ʼֵ���������ж�
[temp_x,temp_y,temp_z]=get_initial_value;
initial_value=[temp_x,temp_y,temp_z];
%% ·������
filename_number=1;
output_path=[root_path,'system_',num2str(filename_number),'\'];
mkdir(output_path);
%% ���ݳ�ֵ����LE����������
step=0.01;
tend=10;
tspan_max=200;  
LE_rough=get_ly(step,tend,initial_value);%�Ƚ��д־��ȼ���
mode_code=check_ly(LE_rough);%�����ٴμ���ľ���
LE_detailed=reget_ly(step,tend,initial_value,mode_code);%���㾫�ȸ��ߵ�����
chaotic_sign=check_chaotic(LE_detailed);%�ж�ʱ���ǻ���ϵͳ
if chaotic_sign==1
    %% ����ǻ��磬�ͻ�����ͼ����save_phase_figure,������ϵͳ��Ϣ
    save_ly(LE_detailed,output_path);
    [phase_t, phase_value]=get_phase(initial_value,tspan_max);
    save_phase(phase_t,phase_value,output_path);
else
    %% ����ǻ�������
    disp('this way out')
end

