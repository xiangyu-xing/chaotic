function mode_code=check_ly(LE_rough)
% �����ж��Ƿ���Ҫ���ȸ��ߵķ�ʽ��֤ly����ȷ��������
ly1=LE_rough(1);
ly2=LE_rough(2);
ly3=LE_rough(3);
ly_sum=LE_rough(4);
if isnan(ly1) || isnan(ly2) || isnan(ly3) || isnan(ly_sum)
    mode_code=0;%������ֽⲻ������������
elseif ly1>ly2 && ly2>ly3%ȷ������ly�Ĵ�С���裬�������ʱ��ֱ�����0
    if ly3>0 || ly1<0
        mode_code=0;
    elseif ly1>0 && ly3<0
        if ly_sum<=0 % ��С��0˵���ܿ����ǻ����
            if ly2<=0 && ly2>=-1 %% + - -�����
                if abs(ly1)>abs(ly2)
                    mode_code=1;
                else
                    mode_code=3;
                end
            elseif ly2<=0 && ly2<-1
                if abs(ly1)>abs(ly2)
                    mode_code=2;
                else
                    mode_code=3;
                end
            elseif ly2>0
                if ly2>1
                    mode_code=3;
                else
                    mode_code=2;
                end
            end
        else % �ʹ���0˵����Ҫ���и�����ж�
            if ly1>abs(ly3)+ly2% ��ָ�����󣬿�����Ȳ�����
                mode_code=0;
            elseif ly1>=abs(ly3) && ly1<abs(ly3)+ly2
                if ly2>1
                    mode_code=3;
                else
                    mode_code=2;
                end
            else
                if ly2<1
                    mode_code=2;
                else
                    mode_code=3;
                end
            end
        end
    else
        mode_code=0;
    end
else
    disp('����������ŵ��ָ�������ì�ܣ�����');
    mode_code=0;
end
