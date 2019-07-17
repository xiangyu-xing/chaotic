function mode_code=check_ly(LE_rough)
% 用于判断是否需要经度更高的方式验证ly，已确定混沌性
ly1=LE_rough(1);
ly2=LE_rough(2);
ly3=LE_rough(3);
ly_sum=LE_rough(4);
if isnan(ly1) || isnan(ly2) || isnan(ly3) || isnan(ly_sum)
    mode_code=0;%如果出现解不出来结果的情况
elseif ly1>ly2 && ly2>ly3%确定关于ly的大小假设，不满足的时候直接输出0
    if ly3>0 || ly1<0
        mode_code=0;
    elseif ly1>0 && ly3<0
        if ly_sum<=0 % 和小于0说明很可能是混沌的
            if ly2<=0 && ly2>=-1 %% + - -的情况
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
        else % 和大于0说明需要进行更多的判断
            if ly1>abs(ly3)+ly2% 正指数过大，可能挽救不回来
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
    disp('出现李雅普诺夫指数假设的矛盾！！！');
    mode_code=0;
end
