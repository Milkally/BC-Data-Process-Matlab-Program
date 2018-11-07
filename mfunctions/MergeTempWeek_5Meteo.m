function[aaa]=MergeTempWeek_5Meteo(struct_Vamos)

mon_num=length(struct_Vamos);
   % mkdir D:\BC_Figures\data\BC_4_merge\Month\RMmissing
    out_TempWeek='D:\BC_Figures\data\BC_5_Meteo\Synchronized\Month\';
for m=1:mon_num
ttThis=struct_Vamos(m).Timetable;
dat_Vamos=datevec(ttThis.Date_Time);
yy=dat_Vamos(:,1);mm=dat_Vamos(:,2);dd=dat_Vamos(:,3);
yystr=num2str(yy(1));mmstr=num2str(mm(1));
    if (mm(1)<10&&mm(1)>=1)
        mmstr=strcat('0',mmstr);
    end
titlestr=strcat(yystr,mmstr);
    mkdir(out_TempWeek,yystr)
[~]=fromOriginTimetabletoExcel(ttThis,strcat(out_TempWeek,yystr,'\',titlestr));
aaa=1;
end

end