function[aaa]=MergeWeekFaster()

%嗯这个函数没有写好……
prename={'Year';'Month';'Season';'Winter';'Heating'};
rootname='D:\BC_Figures\data\BC_4_merge\';

for q=2:2
%for q=1:length(prename)
weekname='D:\BC_Figures\data\BC_4_merge\Week';
mkname=strcat(weekname,'\Fulltime\',char(prename(q)));
mkdir(mkname);

rootpath=strcat(rootname,char(prename(q)),'\Fulltime');%\Year\Fulltime
cd (rootpath)
dir;
filepath=dir;
filenum=size(dir);
%注意这里不是要合并，只是要分出来Weekday和weekend

for i=3:filenum
    filename=strcat(rootpath,'\',filepath(i).name);
    
    T1=readtable(filename);
    ttWeek=table2timetable(T1);
    
    ttWeekday=ttWeek;
    ttWeekday.weekdayNum(ttWeek.weekdayNum==1||ttWeek.weekdayNum==7)=NaN;
    ttWeekday=rmmissing(ttWeekday);
    
    
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


xlsfilename1=strcat(mkname,'\weekday_',filepath(i).name);
xlsfilename2=strcat(mkname,'\weekend_',filepath(i).name);
xlswrite(xlsfilename1,N1);
xlswrite(xlsfilename2,N2);
    %运行完一次(画好一个月的数据图）后，及时清除变量，以免对后续产生干扰
    clear N N1 N2 nc1 nc2 dat_1 ;
    clear Time t DateTime;
end
end

aaa=1;
end
