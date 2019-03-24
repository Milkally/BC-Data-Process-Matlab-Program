function[aaa]=Output_Traffic_New()

%FilepathAll={'Year';'Month';'Season';'Week';'Heating';'Winter'};
FilepathAll={'Year';'Season';'Week'};
for m=2:3
    Filepath=strcat('Traffic\',char(FilepathAll(m)));
aastr=strcat('D:\BC_Figures\data\BC_4_merge\',Filepath,'\Fulltime\csv');

mkdir ('D:\BC_Figures\output\xls\',Filepath)
mkdir ('D:\BC_Figures\output\figure\',Filepath)

cd (aastr);
dir;
filepath=dir;
filenum=size(dir);

%读取整理好的数据文件
for p=3:filenum
%p=filenum(1);
    parta=strcat(aastr,'\');
    partb=filepath(p).name;
read_data_name=strcat(parta,partb);
Datastr=extractBefore(partb,'.');

%读取时间表
may0=readtable(read_data_name);
may1=table2timetable(may0);
%a=size(may1,1);b=size(may1,2); 

%得到时间和时间矩阵
%dat_1=datevec(may1.Date_Time);
%yy=dat_1(:,1);mm=dat_1(:,2);dd=dat_1(:,3); hh=dat_1(:,4);mimi=dat_1(:,5);ss=dat_1(:,6);

%if m==1
   % if (yy(1)==2015||yy(1)==2018)
    %tv = [datetime(yy(1),1,1,0,0,0):hours(1):datetime(yy(1),12,31,23,59,00)]';
    %may1=retime(may1,tv);
   % end
%end

%提出BC %转化为ug/m3
tt=may1.Date_Time;
traffic=may1.traffic; 
traffic(traffic<0)=NaN;
%cd D:\BC_Figures\prog\mFunctions
%获得一个stat矩阵: 时间 计数项 平均值 标准偏差 中位数 最大值 最小值
%Final(1,:)={'Time' 'Number' 'Mean' 'Std' 'Median' 'Max' 'Min'};
[~]=StatisticalCalculationXls(traffic,partb,Filepath);
%Final(p-2,:)=N(2,:);

%箱式图
if m==1
    [~]=plotBoxEachYear_Traffic(traffic,may1.Month,Datastr,Filepath,p-2);
end

%绘制时序图，并添加图注，坐标轴标题等；
%如果要画多张图，就把y变成矩阵
[~]=plotTimeSeries_Traffic(traffic,tt,Datastr,Filepath);
if m==1&&p==7
[~]=plotAllTimeSeries_Traffic(traffic,tt,Datastr,Filepath);
end
close all;

%绘制频率分布直方图
[~]=plotDistribution_Traffic(traffic,Datastr,Filepath);
close all;

%保存每一个文件的BC和tt数据，为了之后一起作图来相互比较，而不是只能一个文件一个图
struct_BCeachmonth(p-2)=struct('Timetable',may1,'tt',tt,'traffic',traffic);
clear traffic dat_1 yy mm dd hh mimi ss 
end
struct_BCcategory(m)=struct('MonthStruct',struct_BCeachmonth);

%==========绘制4年上下对比的时序图,12月彩虹图==========%
%Subplot 2015-2018
if m==1&&p==7
    may1.TM=12*(may1.Year-2015)+may1.Month;
    traffic_1=struct_BCeachmonth(1).traffic;traffic_2=struct_BCeachmonth(2).traffic;
    traffic_3=struct_BCeachmonth(3).traffic;traffic_4=struct_BCeachmonth(4).traffic;
    traffic_5=struct_BCeachmonth(5).traffic;
    tt_1=struct_BCeachmonth(1).tt;
    tt_2=struct_BCeachmonth(2).tt;
    tt_3=struct_BCeachmonth(3).tt;
    tt_4=struct_BCeachmonth(4).tt;
    tt_5=struct_BCeachmonth(5).tt;
    
    [~]=plotsubplotTimeSeries_Traffic(tt_1,traffic_1,...
                              tt_2,traffic_2,...
                              tt_3,traffic_3,...
                              tt_4,traffic_4,Datastr,Filepath);
%Rainbow_12Month
    final=[may1.Month may1.Hour traffic_5];
    [~]=plotRainbow_12Month_Traffic(final,Datastr,Filepath);
%Rainbow_EachMonth
    final_27=[may1.TM may1.Hour traffic_5];
    [~]=plotRainbow_All_Traffic(final_27,Datastr,Filepath);
end
%=========绘制总的箱式图============%
if m==1&&p==7
    [~]=plotBoxAll_Traffic(traffic_5,may1.TM,Datastr,Filepath);
end
%====================================
%clear struct_BCeachmonth
end
aaa=1;
end