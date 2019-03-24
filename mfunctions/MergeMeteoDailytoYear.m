function[aaa]=MergeMeteoDailytoYear()

%可以合并，但是合并的xls文件中，2017,2018年之前都出现了100+行的空行。手动删除的。
    t=0;%跳过下面一段
    if t~=0
prename={'2015','2016','2017','2018','all'};
    patterns ={ '2015'; '2016';'2017';'2018';'1'};
for p=1:size(prename,2)
    prestr=char(prename(1,p));
    mkdir('D:\BC_Figures\data\BC_5_Meteo\Year\BC',prestr);
        destiny=strcat('D:\BC_Figures\data\BC_5_Meteo\Synchronized\Temp_Year\',prestr);
    pattern=char(patterns(p));
    aastr='D:\BC_Figures\data\BC_5_Meteo\Synchronized\Month\';
    dir(aastr); 
     filepath=dir;
     for k=3:size(filepath,1)
        TF(k) = contains(filepath(k).name,pattern);
        end
        for j=3:size(filepath,1)
            if TF(j)
            copyfile(filepath(j).name,destiny)
            end
        end
end
    end
    
%一一找到原始数据的文件夹
%for i=1:size(prename,2)
%prestr=char(prename(1,i));
mkdir D:\BC_Figures\data\BC_5_Meteo\Year\BC
 folderstring=strcat('D:\BC_Figures\data\BC_5_Meteo\BC_Daily\');
  cd(folderstring);
  dir;
  filepath=dir;
  filenum=size(dir,1);
  lineoftotal=0;%打开每一个文件之前，总共已经有了多少行
 %goalexcel=strcat('D:\BC_Figures\data\BC_5_Meteo\Year\BC\',prestr,'.xlsx');
 goalexcel=strcat('D:\BC_Figures\data\BC_5_Meteo\Year\BC\','all.xlsx');
 for j=3:filenum
     %读取对应的excel:20yymm.xlsx
     readexcel=strcat(folderstring,'\',filepath(j).name);
     [num txt raw]=xlsread(readexcel);
     %T1=readtable(readexcel);
     %把有字符的第一行（“Date&Time”那些写进去）；
  if j==3
       cellname1=['A1:Z1'];
       xlswrite(goalexcel,raw(1,:),cellname1);
       lineoftotal=lineoftotal+1;
  end
    %lineofthis=这个excel的总行数-1
    lineofthis=length(raw)-1;
   % lineofthis=size(T1,1);%strlineofthis=num2str(lineofthis);
    %设定位置、输出sheet区域，把这个月的数据整合写进对应年的合并excel中
    cellnames=['A',num2str(lineoftotal+1),':AC',num2str(lineoftotal+lineofthis)];
   % xlswrite(goalexcel,table2cell(T1),cellnames);
   xlswrite(goalexcel,raw(2:end,:),cellnames);
    lineoftotal=lineoftotal+lineofthis;
    clear cellnames  readexcel lineofthis
 end
% clear j filenum filepath lineoftotal
%end

    may0=readtable('D:\BC_Figures\data\BC_5_Meteo\Year\BC\all.xlsx');
    may1=table2timetable(may0);
tv = [datetime(2015,12,1):days(1):datetime(2018,4,5)]';
ttFull = retime(may1,tv);
   output_path_1='D:\BC_Figures\data\BC_5_Meteo\Year\BC\';
output_filename_1=strcat(output_path_1,'all_fulltime.xlsx');
[whether]=fromOriginTimetabletoExcel(ttFull,output_filename_1);
    

aaa=1;
end