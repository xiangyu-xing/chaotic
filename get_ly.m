function LE=get_ly(step, tend,initial_value)
%% 进行异常捕捉，ode45可能会出现多种错误，全部捕捉为同一种情况，不进行
% 详细的处理过程，因为处理回去的可能性不大
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


