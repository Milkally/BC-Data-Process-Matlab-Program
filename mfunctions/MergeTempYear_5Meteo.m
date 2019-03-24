function[aaa]=MergeTempYear_5Meteo(struct_Vamos)
mon_num=length(struct_Vamos);

YearList=zeros(mon_num,1);
for i=1:mon_num
YearList(i)=str2num(struct_Vamos(i).Year);
end
aa=diff(YearList);
index=find(aa~=0);
index=[0;index;length(YearList)];

initial_place=0;
diffYear=length(index)-1;

for j=1:diffYear
   inThisYear=index(j+1)-index(j);
   Yearstr=struct_Vamos(initial_place+1).Year;  
   % dat_1=datevec(ttYear.Date_Time(1));
   % yystr=num2str(dat_1(1,1));
        %mkdir ('D:\BC_Figures\data\BC_4_merge\Year\RMmissing\',Yearstr)
        mkdir ('D:\BC_Figures\data\BC_5_Meteo\Synchronized\Temp_Year\',Yearstr)
        TempYearPath=strcat('D:\BC_Figures\data\BC_5_Meteo\Synchronized\Temp_Year\',Yearstr);
   for k=1:inThisYear
    ttTemp=struct_Vamos(k+initial_place).Timetable;  
    TempMonStr=struct_Vamos(k+initial_place).Month;
        if (1<= str2num(TempMonStr)&&str2num(TempMonStr)<=9)
            TempMonStr=strcat('0',TempMonStr);
        end
    TempYearName=strcat(Yearstr,TempMonStr);
    TableTMP=timetable2table(ttTemp);
    writetable(TableTMP, strcat(TempYearPath,'\',TempYearName,'.csv'))
   end
    initial_place=initial_place+inThisYear;
  %  YearPath=cell(1,diffYear);
   % YearPath(j)=str2cell(TempYearPath);

    folderstr=strcat('D:\BC_Figures\data\BC_5_Meteo\Synchronized\Temp_Year\',Yearstr);
        goalexcel=strcat('D:\BC_Figures\data\BC_5_Meteo\Synchronized\Year\',Yearstr,'.xlsx');

cd (TempYearPath)
dir;
filepath=dir;filenum=size(dir);
lineoftotal=0;
for u=3:filenum
    readexcel=strcat(folderstr,'\',filepath(u).name);
    [num txt raw]=xlsread(readexcel);
     %把有字符的第一行（“Date&Time”那些写进去）；
     if u==3
       cellname1=['A1:Z1'];
       xlswrite(goalexcel,raw(1,:),cellname1);
       lineoftotal=lineoftotal+1;
     end
    lineofthis=length(raw)-1;%strlineofthis=num2str(lineofthis);
    %设定位置、输出sheet区域，把这个月的数据整合写进对应年的合并excel中
    cellnames=['A',num2str(lineoftotal+1),':Z',num2str(lineoftotal+lineofthis)];
    xlswrite(goalexcel,raw(2:end,:),cellnames);
    lineoftotal=lineoftotal+lineofthis;
    clear raw num txt cellnames  readexcel lineofthis
 end
 clear u  filenum filepath lineoftotal
end
 
aaa=1;
end

