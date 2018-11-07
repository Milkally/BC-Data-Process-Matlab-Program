function[aaa]=MergeWeek()
prename={'Year';'Month';'Season';'Winter';'Heating'};
rootname='D:\BC_Figures\data\BC_4_merge\';

for q=1:length(prename)
%for q=1:length(prename)
weekname='D:\BC_Figures\data\BC_4_merge\Week';
mkname=strcat(weekname,'\Fulltime\',char(prename(q)));
mkdir(mkname);

rootpath=strcat(rootname,char(prename(q)),'\Fulltime');%\Year\Fulltime
cd (rootpath)
dir;
filepath=dir;
filenum=size(dir);
%不是要合并，只是要分出来Weekday和weekend

for i=3:filenum
    filename=strcat(rootpath,'\',filepath(i).name);
[num txt raw]=xlsread(filename);
    a=size(raw,1); b=size(raw,2);
    N=raw;
     Time=txt(2:end,1);
    t=datestr(Time,31);
    DateTime=datenum(t);  
N1=cell(a,b);N1(1,:)=raw(1,:);
nc1=2;
N2=cell(a,b);N2(1,:)=raw(1,:);
nc2=2;
for u=1:a-1
    switch num(u,end)
        case{2,3,4,5,6}
            N1(nc1,:)=N(u+1,:);
            nc1=nc1+1;
        case{1,7}
            N2(nc2,:)=N(u+1,:);
            nc2=nc2+1;
    end
end
xlsfilename1=strcat(mkname,'\weekday_',extractBefore(filepath(i).name,'.'),'.xlsx');
xlsfilename2=strcat(mkname,'\weekend_',extractBefore(filepath(i).name,'.'),'.xlsx');
xlswrite(xlsfilename1,N1);
xlswrite(xlsfilename2,N2);
    %运行完一次(画好一个月的数据图）后，及时清除变量，以免对后续产生干扰
    clear N N1 N2 nc1 nc2 dat_1 ;
    clear Time t DateTime;
end
end

%一一找到原始数据的文件夹
%for i=3:filenum(1)
%prestr=char(prename(1,i));
 %folderstring=rootpath;
  %cd(folderstring);
  %dir;
  %filepath_conc=dir;
  %filenum_conc=size(dir,1);
  %lineoftotal=0;%打开每一个文件之前，总共已经有了多少行
 %goalexcel=strcat('D:\BC_Figures\data\BC_4_merge\Week\Fulltime\',char(prename(q)),'\',filepath(i).name,'.xlsx');
 %for j=3:filenum_conc
     %读取对应的excel:20yymm.xlsx
  %   readexcel=strcat(folderstring,'\',filepath_conc(j).name);
   %  [num txt raw]=xlsread(readexcel);
     %T1=readtable(readexcel);
     %把有字符的第一行（“Date&Time”那些写进去）；
  %if j==3
   %    cellname1=['A1:Z1'];
    %   xlswrite(goalexcel,raw(1,:),cellname1);
    %   lineoftotal=lineoftotal+1;
  %end
    %lineofthis=这个excel的总行数-1
  %  lineofthis=length(raw)-1;
   % lineofthis=size(T1,1);%strlineofthis=num2str(lineofthis);
    %设定位置、输出sheet区域，把这个月的数据整合写进对应年的合并excel中
   % cellnames=['A',num2str(lineoftotal+1),':Z',num2str(lineoftotal+lineofthis)];
   % xlswrite(goalexcel,table2cell(T1),cellnames);
   %xlswrite(goalexcel,raw(2:end,:),cellnames);
    %lineoftotal=lineoftotal+lineofthis;
    %clear cellnames  readexcel lineofthis
 %end
 %clear j  lineoftotal
%end
aaa=1;
end
