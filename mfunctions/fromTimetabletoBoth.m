
function [tt,sizeofTimetable,T1,N1,whether]=fromTimetabletoBoth(TimeTable,outputfilename)
tt=TimeTable.Date_Time;
tt1=datestr(tt);
sizeofTimetable=size(TimeTable,1);
%获得重构数据的时间数据
%dat_2=zeros(sizeofTimetable,6);
%for j=1:sizeofTimetable
%dat_2(j,:)=datevec(tt(j));
%end 
dat_2=datevec(tt);
yy2=dat_2(:,1);mm2=dat_2(:,2);dd2=dat_2(:,3); hh2=dat_2(:,4);mimi2=dat_2(:,5);ss2=dat_2(:,6);
tt_year=num2cell(yy2);
tt_month=num2cell(mm2);
tt_date=num2cell(dd2);
tt_time=num2cell(hh2);
%输出成:未剔除异常值的完整时间序列_分钟
T1=timetable2table(TimeTable); NameT1=T1.Properties.VariableNames;
%建立元胞数组N1. T1里面关于时间有3列，而N1里面有2+4=6列
N1=cell(sizeofTimetable+1,size(T1,2)+2);
%第一行
N1(1,1)=T1.Properties.VariableNames(1,1);%VariableNames,see: help table
N1(1,2)={'Year'};N1(1,3)={'Month'};N1(1,4)={'Day'};N1(1,5)={'Time'};
N1(1,6:end)=T1.Properties.VariableNames(1,4:end);
%第1-5列：完整时间，年，月，日，小时
N1(2:end,1)=mat2cell(tt1,ones(size(tt1,1),1),size(tt1,2));
%N1(2:end,2)=mat2cell(tt_day1,ones(size(tt_day1,1),1),size(tt_day1,2));
N1(2:end,2)=tt_year(1:end,1);
N1(2:end,3)=tt_month(1:end,1);
N1(2:end,4)=tt_date(1:end,1);
N1(2:end,5)=tt_time(1:end,1);
%第6列
N1(2:end,6:end)=table2cell(T1(1:end,4:end));
whether=xlswrite(outputfilename,N1);
%writetable(N1, ' .csv') 
writetable(T1, strcat(outputfilename,' .csv'));%, 'VariableNames', columns)
%csvwrite(outputfilename,N1);
end

