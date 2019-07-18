function save_ly(LE, output_path)
global W;
global K;
global initial_value;
filename=[output_path,'system_data.mat'];
save(filename,'W','K','LE','initial_value');
end