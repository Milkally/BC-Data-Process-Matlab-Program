function[aaa]=MergeSeason()

%可以合并，但是合并的xls文件中，2017,2018年之前都出现了100+行的空行。手动删除的。
prename={'2015Winter','2016Spring','2016Summer','2016Fall','2016Winter',...
    '2017Spring','2017Summer','2017Fall','2017Winter','2018Spring','all_Spring',...
    'all_Fall','all_Summer', 'all_Winter'};

%一一找到原始数据的文件夹
for i=1:size(prename,2)
prestr=char(prename(1,i));
 folderstring=strcat('D:\BC_Figures\data\BC_4_merge\Temp_Season\',prestr);
  cd(folderstring);
  dir;
  filepath=dir;
  filenum=size(dir,1);
  lineoftotal=0;%打开每一个文件之前，总共已经有了多少行
 goalexcel=strcat('D:\BC_Figures\data\BC_4_merge\Season\',prestr,'.xlsx');
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
    cellnames=['A',num2str(lineoftotal+1),':Z',num2str(lineoftotal+lineofthis)];
   % xlswrite(goalexcel,table2cell(T1),cellnames);
   xlswrite(goalexcel,raw(2:end,:),cellnames);
    lineoftotal=lineoftotal+lineofthis;
    clear cellnames  readexcel lineofthis
 end
 clear j filenum filepath lineoftotal
end


aaa=1;
end