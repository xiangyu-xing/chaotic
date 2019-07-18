% function result=chaotic_system_test(filename_num)
%% ������ʼ��Ϣ
root_path='D:\chaotic\';
%% ���������ϵͳ
global W;% 3��9��,ֻ��0��1
global K;% 3��9��
global initial_value;
load example_data.mat W K;
result=1;
%% ·������
filename_number=1;
output_path=[root_path,'system_',num2str(filename_number),'\'];
mkdir(output_path);
initial_value_history=[0,0,0];
init_num=1;% ����initial_value_history������
step=0.01;
tend=10;
tspan_max=200; 
%% ѭ���жϳ�ֵ������
while (1)
    %% ���ɳ�ʼֵ���������жϣ���Ҫ�����ų��ظ���ʼ��Ĳ���
    while(init_num)
        [temp_x,temp_y,temp_z]=get_initial_value; 
        initial_value=[temp_x,temp_y,temp_z];
        if init_num==1%��һ�����ɣ�ֱ�Ӽ�����ʷ��¼��
            initial_value_history(init_num,:)=initial_value;
            break;
        else
            for k=1:init_num;%�жϳ�ʼֵ�Ƿ��Ѿ����ֹ���
                if initial_value(1)==initial_value_history(k,1) && ...
                        initial_value(2)==initial_value_history(k,2) && ...
                        initial_value(3)==initial_value_history(k,3)
                    % ��������е��ظ��ˣ���������,���ü��뵽������
                    continue;
                end
            end % �������󣬳�ֵû�г��ֹ����򱣴浽������
            initial_value_history(init_num,:)=initial_value;
            break;
        end
    end
    %% ���ݳ�ֵ����LE����������
    LE_rough=get_ly(step,tend,initial_value);%�Ƚ��д־��ȼ���
    mode_code=check_ly(LE_rough);%�����ٴμ���ľ���
    LE_detailed=reget_ly(step,tend,initial_value,mode_code);%���㾫�ȸ��ߵ�����
    chaotic_sign=check_chaotic(LE_detailed);%�ж�ʱ���ǻ���ϵͳ
    if chaotic_sign==1
        %% ����ǻ��磬�ͻ�����ͼ����save_phase_figure,������ϵͳ��Ϣ
        [phase_t, phase_value]=get_phase(initial_value,tspan_max);
        phase_sign=check_phase(phase_value);
        if phase_sign==1 
            % ������ɵ���ͼ�����˳�ѭ����˵��������ȷ����������
            save_phase(phase_t,phase_value,output_path);
            save_ly(LE_detailed,output_path);
            break;
        else
            continue;
            % ���ɵ���ͼ����������ϵͳ�ǻ���ģ�˵����ֵ������
            % ��Ҫ��ͷ�����µĳ�ֵ��ͬʱ�µĳ�ֵ��ȻҪ����ϵͳ��lyָ���ĺ�����
        end
    else
        %% ����ǻ�������
        if LE_rough(1)>0
            % lyָ������Ȼ������lyָ����˵������ϣ����Ϊ����
            % ����ϵͳ�ĳ�ʼֵ��������ģ���Ҫ�����µĳ�ʼֵ
            continue;
        else
            % ϵͳ�в���������lyָ��������Զ���ܳ�Ϊ����ϵͳ��
            % ֱ���˳�ѭ��
            result=0;
            break;
        end
    end
end

