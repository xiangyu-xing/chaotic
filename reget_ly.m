function LE_detailed=reget_ly(step,tend,initial_value,mode_code)
%% 根据mode_code判断进行的计算的精度是多少
if mode_code==0%% 正在情况下不需要进行计算了
    LE_detailed=[nan,nan,nan,nan];
else
    if mode_code==1
        tend=tend*mode_code*10;%100
    elseif mode_code==2
        tend=tend*10*(1+mode_code);%300
    elseif mode_code==3
        tend=tend*10*(2+mode_code);%500
    end
    if step > 0.01
        step=0.01;%控制步长，防止步长过小
    end
    LE_detailed=get_ly(step,tend,initial_value);
end
