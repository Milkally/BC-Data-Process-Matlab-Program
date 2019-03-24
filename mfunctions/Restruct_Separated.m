function[struct_Separated]=Restruct_Separated()
close all;
clear struct_Separated
cd 'D:\BC_Figures\data\BC_2_separation\BC_separated\BC_Baseline';dir;
filepath=dir;filenum=size(dir);
for q=3:filenum
    may0=readtable(filepath(q).name);
    may1=table2timetable(may0);
    Year=year(may1.Date_Time(1));
    Month=month(may1.Date_Time(1));
    Year=num2str(Year);Month=num2str(Month);
    struct_Separated(q-2)=struct('Timetable',may1,'Year',Year,'Month',Month,'BC6_Raw',may1.BC6_,'BC6_Baseline',may1.BC6_15min);
end
end