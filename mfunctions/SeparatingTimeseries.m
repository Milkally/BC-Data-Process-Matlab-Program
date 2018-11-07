function[ttTemp,ttSeparation]= SeparatingTimeseries(ttTemp)

%首先剔除1min的异常值
BC6=ttTemp.BC6_;
tt=ttTemp.Date_Time;
Howmanyhours=5;
tmp=BC6;
mdn=fillmissing(tmp,'movmedian',Howmanyhours*60);
NaN_posi_raw=isnan(tmp);tmp(NaN_posi_raw) = mdn(NaN_posi_raw);
TF5 = isoutlier(tmp,'movmedian',hours(Howmanyhours),'SamplePoints',tt);
ttFull.TF=TF5;
sum(TF5)
%识别spike的开始点和持续时间
vamos=find(TF5==1);
u=1;
current=vamos(1);
v=1;
t=1;
while u<length(vamos)
if u==1
    n2(v,1)=vamos(u);
    n2(v,2)=t;
    v=v+1;
    end
if vamos(u+1)-vamos(u)~=1
    n2(v,1)=vamos(u+1);
    n2(v-1,2)=t;
    v=v+1;
    t=1;
else
    t=t+1;
end
u=u+1;
end
if n2(end,2)==0
    n2(end,2)=1;
end
%输出成矩阵
    N2=cell(size(n2,1)+1,3);
    N2(1,:)={'Time_Start','Place_in_day','Duration_Points_Number'};
    N2(2:end,2:3)=num2cell(n2);
    for s=1:size(n2,1)
        timelist(s,1)=ttTemp.Date_Time(n2(s,1));
    end
    N2(2:end,1)=cellstr(datestr(timelist(:,1),31));
%写入本地文件夹  
mkdir D:\BC_Figures\data\BC_2_separation\OutlierInform
Year=year(ttTemp.Date_Time(1));
    Month=month(ttTemp.Date_Time(1));
    Year=num2str(Year);Month=num2str(Month); 
    if str2num(Month)<=9
        Month=strcat('0',Month);
    end
    Datastr=strcat(Year,Month);
goalexcel=strcat('D:\BC_Figures\data\BC_2_separation\OutlierInform\',Datastr,'.xlsx');
xlswrite(goalexcel,N2);
  
%剔除异常值
for p=1:length(n2)
    judge=n2(p,:);
    if judge(1,2)==1
    ttTemp.BC6_(judge(1,1))=NaN;
    end
end

    %========Successive smoothing==========%
%第一步:1h窗口
span=61;
BC6_smooth=smooth(ttTemp.BC6_,span);
%如果数据中有NaN,第一步不是smooth而是填充、
 if sum(isnan(ttTemp.BC1_))~=0
 BC6_smooth=smooth(BC6_smooth,span);
 end
ttTemp.BC6_smooth=BC6_smooth;
    BC1_smooth=smooth(ttTemp.BC1_,span);
    if sum(isnan(ttTemp.BC1_))~=0
    BC1_smooth=smooth(BC1_smooth,span);
    end
    ttTemp.BC1_smooth=BC1_smooth;
ttTemp.BC6_hour=min(ttTemp.BC6_,ttTemp.BC6_smooth);
    ttTemp.BC1_hour=min(ttTemp.BC1_,ttTemp.BC1_smooth);
%第二步：30min窗口
span2=31;
BC6_smooth2=smooth(ttTemp.BC6_hour,span2);
ttTemp.BC6_smooth2=BC6_smooth2;
    BC1_smooth2=smooth(ttTemp.BC1_hour,span2);
    ttTemp.BC1_smooth2=BC1_smooth2;
ttTemp.BC6_30min=min(ttTemp.BC6_,ttTemp.BC6_smooth2);
    ttTemp.BC1_30min=min(ttTemp.BC1_,ttTemp.BC1_smooth2);
%第三步：15min窗口哦
span3=15;
BC6_smooth3=smooth(ttTemp.BC6_30min,span3);
ttTemp.BC6_smooth3=BC6_smooth3;
    BC1_smooth3=smooth(ttTemp.BC1_30min,span3);
    ttTemp.BC1_smooth3=BC1_smooth3;
ttTemp.BC6_15min=min(ttTemp.BC6_,ttTemp.BC6_smooth3);
    ttTemp.BC1_15min=min(ttTemp.BC1_,ttTemp.BC1_smooth3);
    
%Traffic部分
ttTemp.BC6_traffic=ttTemp.BC6_-ttTemp.BC6_15min;
    ttTemp.BC1_traffic=ttTemp.BC1_-ttTemp.BC1_15min;

%删除缺失的行
TF=isnan(ttTemp.BC6_);
ttTemp1=rmmissing(ttTemp);

%然后再次补全时间表
dat_1=datevec(ttTemp1.Date_Time);
yy=dat_1(:,1);mm=dat_1(:,2);dd=dat_1(:,3);
Tmp_a=size(ttTemp1,1);
tv = [datetime(yy(1),mm(1),1,0,0,0):hours(1/60):datetime(yy(1),mm(1),dd(Tmp_a-1),23,59,00)]';
ttSeparation = retime(ttTemp1,tv);

end