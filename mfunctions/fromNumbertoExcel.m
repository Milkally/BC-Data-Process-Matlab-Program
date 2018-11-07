function [a1,b1]=fromNumbertoExcel(NumMatrix,titlecell,outputfilename)
a1=size(NumMatrix,1); b1=size(NumMatrix,2);
%T1=timetable2table(TimeTable); NameT1=T1.Properties.VariableNames;
%N1(1,1)=T1.Properties.VariableNames(1,1);%VariableNames,see: help table
N=cell(a1+1,b1);
N(1,:)=titlecell;
N(2:end,:)=num2cell(NumMatrix);
xlswrite(outputfilename,N);
end