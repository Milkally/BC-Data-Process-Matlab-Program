function[struct_Fulltime]=Restruct_Fulltime()
close all;
clear struct_Fulltime
cd 'D:\BC_Figures\data\BC_2_separation\BC_fulltime';dir;
filepath=dir;filenum=size(dir);
for q=3:filenum
    may0=readtable(filepath(q).name);
    may1=table2timetable(may0);
    Year=year(may1.Date_Time(1));
    Month=month(may1.Date_Time(1));
    Year=num2str(Year);Month=num2str(Month);
    struct_Fulltime(q-2)=struct('Timetable',may1,'BC6_',may1.BC6_,'Year',Year,'Month',Month);
end
end