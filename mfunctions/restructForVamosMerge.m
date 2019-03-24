function[struct_Detected]=restructForVamosMerge(i)
clear struct_Detected
close all
switch i
    case{1}
    cd 'D:\BC_Figures\data\BC_3_DetectionLimit\BC_Detected\Fulltime';dir;
    case{2}
    cd 'D:\BC_Figures\data\BC_3_DetectionLimit\BC_Detected\RMmissing';dir;
end
filepath=dir;filenum=size(dir);
for j=3:filenum
    may0=readtable(filepath(j).name);
    may1=table2timetable(may0);
    struct_Detected(j-2)=struct('Timetable',may1,...
        'BC6_Baseline',may1.BC6_baseline,'BC6_AFDT',may1.BC6_AFDT,...
        'Year',num2str(may1.Year(1)),'Month',num2str(may1.Month(1)) );
end

end
