function[aaa]=MergeHeating()

%prename={'2015Winter','2016Spring','2016Summer','2016Fall','2016Winter',...
 %   '2017Spring','2017Summer','2017Fall','2017Winter','2018Spring','all_spring',...
 %   'all_fall','all_summer', 'all_winter'};

cd D:\BC_Figures\data\BC_4_merge\Temp_Heating\Fulltime
dir;
filepath=dir;
filename=size(dir);

%一一找到原始数据的文件夹
for i=3:filename(1)
%prestr=char(prename(1,i));
 folderstring=strcat('D:\BC_Figures\data\BC_4_merge\Temp_Heating\Fulltime\',filepath(i).name);
  cd(folderstring);
  dir;
  filepath_conc=dir;
  filenum_conc=size(dir,1);
  lineoftotal=0;%打开每一个文件之前，总共已经有了多少行
 goalexcel=strcat('D:\BC_Figures\data\BC_4_merge\Heating\Fulltime\',filepath(i).name,'.xlsx');
 for j=3:filenum_conc
     %读取对应的excel:20yymm.xlsx
     readexcel=strcat(folderstring,'\',filepath_conc(j).name);
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
 clear j  lineoftotal
end


aaa=1;
end