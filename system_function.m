function dY=system_function(t,Y)
% �Ѿ�д�ɱ�׼��ʽ��ϵͳ���̣���������޸�
% Ϊsave_xiangtu���Ӻ���
dY=zeros(3,1);
x=Y(1);y=Y(2);z=Y(3);
global K;% 3��9��
global W;% 3��9��,ֻ��0��1
P=[x,y,z,x*x,x*y,x*z,y*y,y*z,z*z];
dY(1)=sum(K(1,:).*W(1,:).*P);
dY(2)=sum(K(2,:).*W(2,:).*P);
dY(3)=sum(K(3,:).*W(3,:).*P);
end