function[struct_RE]=Missing_Statistic(struct_Fulltime)
mon_num=length(struct_Fulltime);

for m=1:mon_num
ttTemp=struct_Fulltime(m).Timetable;

dat_1=datevec(ttTemp.Date_Time);
yy=dat_1(:,1);mm=dat_1(:,2);dd=dat_1(:,3);

ttTemp=removevars(ttTemp,29);
ttTemp=removevars(ttTemp,28);
ttTemp=removevars(ttTemp,1);

ttRE = retime(ttTemp,'hourly',@nanmean);
ttRE=rmmissing(ttRE);

struct_RE(m)=struct('Timetable',ttRE,'length_RE',length(ttRE.Date_Time));

%Êä³öÎª¾ØÕó

for i=1:length(struct_RE)
Matrix(i,2)=struct_RE(i).length_RE;
Matrix(i,1)=month(struct_RE(i).Timetable.Date_Time(1));
end
outputfilename='D:\BC_Figures\data\Missing_Statistic.xlsx';
[a,b]=size(Matrix);
N=cell(a+1,b);
N(1,1)={'Date&Time'};
N(1,2:end)={'Hours'};
tt1=Matrix(:,1);
N(2:end,1)=mat2cell(Matrix(:,1),ones(size(tt1,1),1),size(tt1,2));
N(2:end,2)=num2cell(Matrix(:,2));
xlswrite(outputfilename,N);
end

end
