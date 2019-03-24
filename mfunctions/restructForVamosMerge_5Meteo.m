function[struct_Detected]=restructForVamosMerge_5Meteo()
clear struct_Detected
close all
%switch i
 %   case{1}
  %  cd 'D:\BC_Figures\data\BC_3_DetectionLimit\BC_Detected\Fulltime';dir;
   % case{2}
    cd 'D:\BC_Figures\data\BC_5_Meteo\Synchronized\Temp_Month';dir;
%end
filepath=dir;filenum=size(dir);
for j=3:filenum
    may0=readtable(filepath(j).name);
    may1=table2timetable(may0);
    struct_Detected(j-2)=struct('Timetable',may1,'Date',may1.Date_Time,...
        'WD',may1.WD_ttBC,...
        'WS',may1.WS_ttBC, 'Year',num2str(may1.Year(1)),'Month',num2str(may1.Month(1)) );
end

end
