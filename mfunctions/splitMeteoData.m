function[meteo]=splitMeteoData(Meteo_data_path)
may0=readtable(strcat(Meteo_data_path,'\Meteo_all.xlsx'));
%may0.Date_Time=datetime(may0.Date,'InputFormat','mm/dd/yyyy');
may1=table2timetable(may0);
ttDate=may1.Date;
may1.Month=month(ttDate);
diffM=diff(may1.Month);
index=find(diffM~=0);
index=[0;index;length(diffM)];
N=cell(length(index)-1,1);
cell1=may0.Properties.VariableNames;
cell1(1)={'Date_Time'};

for i=1:length(index)-1
    struct_Meteo(i).cell=table2cell(may0(index(i)+1:index(i+1),:));
    struct_Meteo(i).cell=[cell1;struct_Meteo(i).cell]
end

mkdir D:\BC_Figures\data\Meteorology_data\Meteo_Month
for i=1:length(index)-1
    N1=struct_Meteo(i).cell;
    dat_1=datevec(datestr(N1{2,1},26));
    yystr=num2str(dat_1(1,1));mmstr=num2str(dat_1(1,2));
    if (dat_1(1,2)<10&&dat_1(1,2)>=1)
        mmstr=strcat('0',mmstr);
    end
    titlestr=strcat(yystr,mmstr);
    outputfilename=strcat('D:\BC_Figures\data\Meteorology_data\Meteo_Month\',titlestr,'.csv');
   % csvwrite(outputfilename,cell2table(N1));
    T=cell2table(N1(2:end,:));
    T.Properties.VariableNames = N1(1,:);
    writetable(T, strcat(outputfilename));
end
meteo=1;
end