function save_ly(LE, output_path)
global W;
global K;
filename=[output_path,'system_data.mat'];
save(filename,'W','K','LE');
end