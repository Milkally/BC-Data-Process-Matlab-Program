
function [situation]=ConvertExceltoCsv(aastr,firststr,Filepath)
cd (aastr)
dir;
filepath=dir;
filenum=size(dir);

for p=3:filenum
    parta=strcat(aastr,'\');partb=filepath(p).name;
    read_data_name=strcat(parta,partb);
    Datastr=extractBefore(partb,'.');
 
may0=readtable(read_data_name);

outputfilename=strcat(firststr,'\Csv\',Filepath,'\',Datastr);
writetable(may0, strcat(outputfilename,' .csv'));%, 'VariableNames', columns)
%csvwrite(outputfilename,N1);
end

situation=1;

end

