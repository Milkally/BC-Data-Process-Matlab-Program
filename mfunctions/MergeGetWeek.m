function[struct_Vamos]=MergeGetWeek(struct_Detected)
mon_num=length(struct_Detected);

for m=1:mon_num
ttTemp=struct_Detected(m).Timetable;
  %dat_1=datevec(ttTemp.Date_Time);
  %  yy=dat_1(:,1);mm=dat_1(:,2);dd=dat_1(:,3); hh=dat_1(:,4);mimi=dat_1(:,5);ss=dat_1(:,6);
  
%if yy(2)==2015
  %  Day=datenum(ttTemp.Date_Time)-datenum(2015,12,1,0,0,0);
  %  else if yy(2)==2016
  %  Day=datenum(ttTemp.Date_Time)-datenum(2015,12,31,0,0,0);
   %    else if yy(2)==2017  
   % Day=datenum(ttTemp.Date_Time)-datenum(2016,12,31,0,0,0);
   %        else     
  %  Day=datenum(ttTemp.Date_Time)-datenum(2017,12,31,0,0,0);end;end;end;

%if yy(2)==2015 day=mod(fix(Day)+2,7);
%else if yy(2)==2016 day=mod(fix(Day)+4,7);
%   else if yy(2)==2017 day=mod(fix(Day)+6,7);
%    else if yy(2)==2018 day=mod(fix(Day),7);end;end;end;end;
    
%ttTemp.day=day;
[DayNumber,DayName]=weekday(ttTemp.Date_Time);
ttTemp.weekdayNum=DayNumber;
ttTemp.weekdayName=DayName;
struct_Detected(m).Timetable=ttTemp;
struct_Vamos=struct_Detected;
end
end
