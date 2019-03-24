function[struct_Detected_1]=Restruct_Detected_Fulltime()
clear struct_Detected
close all
cd 'D:\BC_Figures\data\BC_3_DetectionLimit\BC_Detected\Fulltime';dir;
%cd 'D:\BC_Figures\data\BC_3_DetectionLimit\BC_Detected\RMmissing';dir;
filepath=dir;filenum=size(dir);
for q=3:filenum
    may0=readtable(filepath(q).name);
    may1=table2timetable(may0);
    struct_Detected_1(q-2)=struct('Timetable',may1,...
        'BC6_Baseline',may1.BC6_baseline,'BC6_AFDT',may1.BC6_AFDT,...
        'Year',num2str(may1.Year(1)),'Month',num2str(may1.Month(1)) );
end
end