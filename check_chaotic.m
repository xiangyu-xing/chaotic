function chaotic_sign=check_chaotic(LE_detailed)
%% ����lyָ���ж�ϵͳʱ���ǻ���ϵͳ
ly1=LE_detailed(1);
ly2=LE_detailed(2);
ly3=LE_detailed(3);
ly_sum=LE_detailed(4);
if isnan(ly_sum) || isnan(ly_sum) || isnan(ly_sum) ||isnan(ly_sum)
    sign=0;
elseif ly1>ly2 && ly2>ly3 && ly_sum<0 %��ǰ��Ϊϵͳ��ly˳����ȷ����С��0
    if ly1>abs(ly2) && abs(ly2)<0.5% ly2���ӽӽ�0����������Ϊ����ϵͳ
        sign=1;%������������ly2��ֵ������̫��ĺ�
    else
        sign=0;
    end
else
    sign=0;
end
chaotic_sign=sign;
end