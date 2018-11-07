
function [tt,sizeofTimetable,T1]=fromTimetabletoCsv(TimeTable,create_str,Datastr)
tt=TimeTable.Date_Time;

sizeofTimetable=size(TimeTable,1);

T1=timetable2table(TimeTable); 

outputfilename=strcat(create_str,'\csv\',Datastr);
writetable(T1, strcat(outputfilename,'.csv'));%, 'VariableNames', columns)
%csvwrite(outputfilename,N1);
end

