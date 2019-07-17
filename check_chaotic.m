function chaotic_sign=check_chaotic(LE_detailed)
%% 根据ly指数判断系统时候是混沌系统
ly1=LE_detailed(1);
ly2=LE_detailed(2);
ly3=LE_detailed(3);
ly_sum=LE_detailed(4);
if isnan(ly_sum) || isnan(ly_sum) || isnan(ly_sum) ||isnan(ly_sum)
    sign=0;
elseif ly1>ly2 && ly2>ly3 && ly_sum<0 %大前提为系统的ly顺序正确，和小于0
    if ly1>abs(ly2) && abs(ly2)<0.5% ly2更加接近0，都可以算为混沌系统
        sign=1;%还是限制以下ly2的值不让他太大的好
    else
        sign=0;
    end
else
    sign=0;
end
chaotic_sign=sign;
end