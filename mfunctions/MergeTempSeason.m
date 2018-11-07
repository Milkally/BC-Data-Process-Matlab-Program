function[aaa]=MergeTempSeason(struct_Vamos)
mon_num=length(struct_Vamos);

for q=1:mon_num
    if str2num(struct_Vamos(q).Month)==12||str2num(struct_Vamos(q).Month)==1||str2num(struct_Vamos(q).Month)==2
    struct_Vamos(q).Season='Winter';
    else if str2num(struct_Vamos(q).Month)==3||str2num(struct_Vamos(q).Month)==4||str2num(struct_Vamos(q).Month)==5
    struct_Vamos(q).Season='Spring';
    else if str2num(struct_Vamos(q).Month)==6||str2num(struct_Vamos(q).Month)==7||str2num(struct_Vamos(q).Month)==8
    struct_Vamos(q).Season='Summer';
    else    struct_Vamos(q).Season='Fall';
        end;end;end
end

YearList=zeros(1,mon_num);
SeasonList=cell(1,mon_num);
YearSeasonList=cell(1,mon_num);
for i=1:mon_num
YearList(i)=str2num(struct_Vamos(i).Year);
SeasonList(i)=cellstr(struct_Vamos(i).Season);
struct_Vamos(i).Year_Season=strcat(struct_Vamos(i).Year,struct_Vamos(i).Season);
YearSeasonList(i)=cellstr(struct_Vamos(i).Year_Season);
end

UniYear=num2str(unique(YearList));
UniSeason=(unique(SeasonList));
UniYearSeason=(unique(YearSeasonList));
prename={'all spring','all fall','all summer', 'all winter'};
prename=[UniYearSeason prename];

for u=1:length(prename)
mkdir('D:\BC_Figures\data\BC_4_merge\Temp_Season',char(prename(u)));
end

num_uni_ys=length(UniYearSeason)-1;
%YearSeason_str=string(YearSeasonList);
Season_str=string(SeasonList);
[aa]=diffstr(Season_str,num_uni_ys);
aa=aa-1;aa(1)=0;
aa=[aa;length(Season_str)];


index=aa;
diffYearSeason=length(index);

initial_place=0;
for j=1:diffYearSeason
   inThisYearSeason=index(j+1)-index(j);
   
   Yearstr=struct_Vamos(initial_place+1).Year;  
   % dat_1=datevec(ttYear.Date_Time(1));
   % yystr=num2str(dat_1(1,1));
   % mkdir ('D:\BC_Figures\data\BC_4_merge\Temp_Year\',YearSeasonstr)
    TempYearPath=strcat('D:\BC_Figures\data\BC_4_merge\Temp_Season\',char(prename(j)));
    
   for k=1:inThisYearSeason
    ttTemp=struct_Vamos(k+initial_place).Timetable;  
    TempMonStr=struct_Vamos(k+initial_place).Month;
        if (1<= str2num(TempMonStr)&&str2num(TempMonStr)<=9)
            TempMonStr=strcat('0',TempMonStr);
        end
    TempYearName=strcat(Yearstr,TempMonStr);
    TableTMP=timetable2table(ttTemp);
    writetable(TableTMP, strcat(TempYearPath,'\',TempYearName,'.csv'))
   end
    initial_place=initial_place+inThisYearSeason;
  %  YearPath=cell(1,diffYear);
   % YearPath(j)=str2cell(TempYearPath);

cd (TempYearPath)
dir;
filepath=dir;filenum=size(dir);
lineoftotal=0;
for u=3:filenum
    %读取对应的excel:20yymm.xlsx
    folderstr=strcat('D:\BC_Figures\data\BC_4_merge\Temp_Season\',char(prename(j)));
    readexcel=strcat(folderstr,'\',filepath(u).name);
    [num txt raw]=xlsread(readexcel);
    goalexcel=strcat('D:\BC_Figures\data\BC_4_merge\Season\',char(prename(j)),'.xlsx');
     %把有字符的第一行（“Date&Time”那些写进去）；
     if u==3
       cellname1=['A1:X1'];
       xlswrite(goalexcel,raw(1,:),cellname1);
       lineoftotal=lineoftotal+1;
    end
    %lineofthis=这个excel的总行数-1
    lineofthis=length(raw)-1;%strlineofthis=num2str(lineofthis);
    %设定位置、输出sheet区域，把这个月的数据整合写进对应年的合并excel中
    cellnames=['A',num2str(lineoftotal+1),':X',num2str(lineoftotal+lineofthis)];
    xlswrite(goalexcel,raw(2:end,:),cellnames);
    lineoftotal=lineoftotal+lineofthis;
    clear raw num txt cellnames  readexcel goalexcel lineofthis
 end
 clear u n filenum filepath lineoftotal
 
end
 


aaa=1;
end