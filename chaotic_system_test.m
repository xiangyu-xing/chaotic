% function result=chaotic_system_test(filename_num)
%% 声明初始信息
root_path='D:\chaotic\';
%% 先随机生产系统
global W;% 3行9列,只有0或1
global K;% 3行9列
global initial_value;
load example_data.mat W K;
result=1;
%% 路径控制
filename_number=1;
output_path=[root_path,'system_',num2str(filename_number),'\'];
mkdir(output_path);
initial_value_history=[0,0,0];
init_num=1;% 控制initial_value_history的行数
step=0.01;
tend=10;
tspan_max=200; 
%% 循环判断初值的生成
while (1)
    %% 生成初始值，并进行判断，需要进行排除重复初始点的操作
    while(init_num)
        [temp_x,temp_y,temp_z]=get_initial_value; 
        initial_value=[temp_x,temp_y,temp_z];
        if init_num==1%第一次生成，直接加入历史记录中
            initial_value_history(init_num,:)=initial_value;
            break;
        else
            for k=1:init_num;%判断初始值是否已经出现过了
                if initial_value(1)==initial_value_history(k,1) && ...
                        initial_value(2)==initial_value_history(k,2) && ...
                        initial_value(3)==initial_value_history(k,3)
                    % 如果跟现有的重复了，重新生成,不用加入到矩阵中
                    continue;
                end
            end % 遍历过后，初值没有出现过，则保存到矩阵中
            initial_value_history(init_num,:)=initial_value;
            break;
        end
    end
    %% 根据初值计算LE，并保存结果
    LE_rough=get_ly(step,tend,initial_value);%先进行粗经度计算
    mode_code=check_ly(LE_rough);%计算再次计算的精度
    LE_detailed=reget_ly(step,tend,initial_value,mode_code);%计算精度更高的数据
    chaotic_sign=check_chaotic(LE_detailed);%判断时候是混沌系统
    if chaotic_sign==1
        %% 如果是混沌，就绘制相图调用save_phase_figure,并保存系统信息
        [phase_t, phase_value]=get_phase(initial_value,tspan_max);
        phase_sign=check_phase(phase_value);
        if phase_sign==1 
            % 如果生成的相图合理，退出循环，说明参数正确，保存数据
            save_phase(phase_t,phase_value,output_path);
            save_ly(LE_detailed,output_path);
            break;
        else
            continue;
            % 生成的相图不合理，但是系统是混沌的，说明初值有问题
            % 需要从头生成新的初值，同时新的初值仍然要计算系统的ly指数的合理性
        end
    else
        %% 处理非混沌的情况
        if LE_rough(1)>0
            % ly指数中仍然有正的ly指数，说明是有希望成为混沌
            % 但是系统的初始值是右问题的，需要产生新的初始值
            continue;
        else
            % 系统中不存在正的ly指数，就永远不能成为混沌系统了
            % 直接退出循环
            result=0;
            break;
        end
    end
end

