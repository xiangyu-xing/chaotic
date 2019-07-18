function phase_sign=check_phase(phase_value)
[m,n]=size(phase_value);
x=phase_value(:,1);
y=phase_value(:,2);
z=phase_value(:,3);
step=1/0.001;
num=floor(m/step);
trend_code_array=zeros(3,num-1);
for i=1:num-1
    %获取每个相图的趋势。
    x1=x(i+1);x0=x(i);
    y1=y(i+1);y0=y(i);
    z1=z(i+1);z0=z(i);
    trend_code_array(1,i)=trend_code(x1,x0,y1,y0);
    trend_code_array(2,i)=trend_code(x1,x0,z1,z0);
    trend_code_array(3,i)=trend_code(y1,y0,z1,z0);
end
phase_sign=phase_tend_analyse(trend_code_array);