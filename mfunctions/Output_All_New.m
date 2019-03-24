function[struct_BCcategory]=Output_All_New()

%FilepathAll={'Year';'Month';'Season';'Week';'Heating';'Winter'};
FilepathAll={'Year';'Month';'Season';'Heating';'Winter'};
for m=1:5
Filepath=char(FilepathAll(m));
aastr=strcat('D:\BC_Figures\data\BC_4_merge\',Filepath,'\Fulltime');
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
BC6=may1.BC6_AFDT; BC6=BC6/1000;

%cd D:\BC_Figures\prog\mFunctions
%获得一个stat矩阵: 时间 计数项 平均值 标准偏差 中位数 最大值 最小值
%Final(1,:)={'Time' 'Number' 'Mean' 'Std' 'Median' 'Max' 'Min'};
[~]=StatisticalCalculationXls(BC6,partb,Filepath);
%Final(p-2,:)=N(2,:);

%箱式图
if m==1
    [~]=plotBoxEachYear(BC6,may1.Month,Datastr,Filepath,p-2);
end

%绘制时序图，并添加图注，坐标轴标题等；
%如果要画多张图，就把y变成矩阵
[picwhether1]=plotTimeSeries(BC6,tt,Datastr,Filepath);
if m==1&&p==7
[~]=plotAllTimeSeries(BC6,tt,Datastr,Filepath);
end
close all;

%绘制频率分布直方图
[~]=plotDistribution(BC6,Datastr,Filepath);
close all;

%保存每一个文件的BC和tt数据，为了之后一起作图来相互比较，而不是只能一个文件一个图
struct_BCeachmonth(p-2)=struct('Timetable',may1,'tt',tt,'BC6',BC6);
clear BC6 dat_1 yy mm dd hh mimi ss 
end
struct_BCcategory(m)=struct('MonthStruct',struct_BCeachmonth);

%==========绘制4年上下对比的时序图,12月彩虹图==========%
%Subplot 2015-2018
if m==1&&p==7
    may1.TM=12*(may1.Year-2015)+may1.Month;
    BC_1=struct_BCeachmonth(1).BC6;BC_2=struct_BCeachmonth(2).BC6;
    BC_3=struct_BCeachmonth(3).BC6;BC_4=struct_BCeachmonth(4).BC6;
    BC_5=struct_BCeachmonth(5).BC6;
    tt_1=struct_BCeachmonth(1).tt;
    tt_2=struct_BCeachmonth(2).tt;
    tt_3=struct_BCeachmonth(3).tt;
    tt_4=struct_BCeachmonth(4).tt;
    tt_5=struct_BCeachmonth(5).tt;
    
    [~]=plotsubplotTimeSeries(struct_BCeachmonth(1).tt,BC_1,...
                              struct_BCeachmonth(2).tt,BC_2,...
                              struct_BCeachmonth(3).tt,BC_3,...
                              struct_BCeachmonth(4).tt,BC_4,Datastr,Filepath);
%Rainbow_12Month
    final=[may1.Month may1.Hour BC_5];
    [~]=plotRainbow_12Month(final,Datastr,Filepath);
%Rainbow_EachMonth
    final_27=[may1.TM may1.Hour BC_5];
    [~]=plotRainbow_All(final_27,Datastr,Filepath);
end
%=========绘制总的箱式图============%
if m==1&&p==7
    [~]=plotBoxAll(may1.BC6_AFDT,may1.TM,Datastr,Filepath);
end
%====================================
clear struct_BCeachmonth
end

end