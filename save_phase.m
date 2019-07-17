function save_phase(t,y,output_path)
% ����������;�ǰ�ϵͳ���̵�ͼ�����ֵ�洢����
% ��һ���������ڶ�������get_phase�Ľ��
% ����������Ϊ����ļ�·��
% output_path='D:\system_1\
%% ����ϵͳ��������ͼ����
output_data_filename=[output_path,'pashe_data.mat'];
pashe_data_x=y(:,1);
pashe_data_y=y(:,2);
pashe_data_z=y(:,3);
save(output_data_filename,'t','pashe_data_x','pashe_data_y','pashe_data_z');
%% ������ͼ
h_figure=figure(1);
filename=[output_path,'figure_xyz'];
h_xyz=plot3(pashe_data_x,pashe_data_y,pashe_data_z);
saveas(h_figure,filename,'bmp');
delete(h_xyz);
filename=[output_path,'figure_xy'];
h_xy=plot(pashe_data_x,pashe_data_y);
saveas(h_figure,filename,'bmp');
delete(h_xy);
filename=[output_path,'figure_xz'];
h_xz=plot(pashe_data_x,pashe_data_z);
saveas(h_figure,filename,'bmp');
delete(h_xz);
filename=[output_path,'figure_yz'];
h_yz=plot(pashe_data_y,pashe_data_z);
saveas(h_figure,filename,'bmp');
delete(h_yz);
close all
end
