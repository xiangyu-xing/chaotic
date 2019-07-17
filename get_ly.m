function LE=get_ly(step, tend,initial_value)
%% �����쳣��׽��ode45���ܻ���ֶ��ִ���ȫ����׽Ϊͬһ�������������
% ��ϸ�Ĵ�����̣���Ϊ�����ȥ�Ŀ����Բ���
try
    [~,Res]=lyapunov(3,@jaco,@ode45,0,step,tend,initial_value,0);
    LE=[Res(end,1),...
        Res(end,2),...
        Res(end,3),...
        Res(end,1)+Res(end,2)+Res(end,3)];
catch error_info
    disp(error_info);
    LE=[nan,nan,nan,nan];
end
end


