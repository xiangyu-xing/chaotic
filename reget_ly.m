function LE_detailed=reget_ly(step,tend,initial_value,mode_code)
%% ����mode_code�жϽ��еļ���ľ����Ƕ���
if mode_code==0%% ��������²���Ҫ���м�����
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
        step=0.01;%���Ʋ�������ֹ������С
    end
    LE_detailed=get_ly(step,tend,initial_value);
end
