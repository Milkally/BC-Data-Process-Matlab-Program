function[aaa]=MergeGetAll_5Meteo(q)
 yearstring='all';
 folderstring=strcat('D:\BC_Figures\data\BC_5_Meteo\Synchronized\Year\');
 goalexcel=strcat('D:\BC_Figures\data\BC_5_Meteo\Synchronized\Year\',yearstring,'.xlsx');
 
  cd(folderstring);
  dir;
  filepath=dir;
  filenum=size(dir,1);
  lineoftotal=0;%打开每一个文件之前，总共已有多少行
     
 for j=3:filenum
     %读取对应的excel:20yymm.xlsx
     readexcel=strcat(folderstring,'\',filepath(j).name);
    [num txt raw]=xlsread(readexcel);
    %把有字符的第一行（“Date&Time”那些写进去）；
    if j==3
        cellname1=['A1:Z1'];
       xlswrite(goalexcel,raw(1,:),cellname1);
       lineoftotal=lineoftotal+1;
    end
    lineofthis=length(raw)-1;%strlineofthis=num2str(lineofthis);
    %设定位置、输出sheet区域，把这个月的数据整合写进对应年的合并excel中
    cellnames=['A',num2str(lineoftotal+1),':Z',num2str(lineoftotal+lineofthis)];
    xlswrite(goalexcel,raw(2:end,:),cellnames);
    lineoftotal=lineoftotal+lineofthis;
    clear rawq num txt cellnames  readexcel lineofthis
 end
 
 aaa=1;
 end
