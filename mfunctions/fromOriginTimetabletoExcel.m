
function [whether]=fromOriginTimetabletoExcel(TimeTable,outputfilename)
sizeofTimetable=size(TimeTable,1);
tt1=datestr(TimeTable.Date_Time);
%输出成:未剔除异常值的完整时间序列_分钟
T1=timetable2table(TimeTable); NameT1=T1.Properties.VariableNames;

%csv文件
writetable(T1, strcat(outputfilename,'.csv'));%, 'VariableNames', columns)
%csvwrite(outputfilename,N1);

%xlsx文件
%建立元胞数组N1. T1里面关于时间有3列，而N1里面有2+4=6列
%N1=cell(sizeofTimetable+1,size(T1,2));
%第一行
%N1(1,:)=T1.Properties.VariableNames(1,:);%VariableNames,see: help table
%第1列
%N1(2:end,1)=mat2cell(tt1,ones(size(tt1,1),1),size(tt1,2));
%第6列
%N1(2:end,2:end)=table2cell(T1(1:end,2:end));
%xlswrite(strcat(outputfilename,'.xlsx'),N1);


whether=1;
end

