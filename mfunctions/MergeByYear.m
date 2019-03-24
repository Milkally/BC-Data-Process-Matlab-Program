function[struct_Vamos1]=MergeByYear(struct_Vamos)
mon_num=length(struct_Vamos);

YearList=zeros(mon_num,1);
for i=1:mon_num
YearList(i)=str2num(struct_Vamos(i).Year);
end
aa=diff(YearList);
index=find(aa~=0);
diffYear=length(index);
index=[0;index;length(aa)];

initial_place=0;
for j=1:diffYear
    inThisYear=index(j+1)-index(j);
    ttFirst=struct_Vamos(index(j)+1).Timetable;
        yFirst=year(ttFirst.Date_Time(1));
        mFirst=month(ttFirst.Date_Time(1));
        dFirst=day(ttFirst.Date_Time(1));
        hFirst=hour(ttFirst.Date_Time(1));
    ttLast=struct_Vamos(index(j+1)).Timetable;
        yLast=year(ttLast.Date_Time(1));
        mLast=month(ttLast.Date_Time(end));
        dLast=day(ttLast.Date_Time(end));
        hLast=hour(ttLast.Date_Time(end));
    tvv=[datetime( yFirst,mFirst,dFirst,hFirst,0,0):hours(1):datetime(yLast,mLast,dLast,hLast,0,0)];
    for k=1:inThisYear
        ttTemp=struct_Vamos(k+initial_place).Timetable;  
        if k==1
            %ttAll=outerjoin(ttTemp,tvv);
            ttAll=ttTemp;
        else
            ttAll=retime(ttTemp,ttAll);
        end
    end
        struct_TEMP(j)=struct('Timetable',ttAll);
    initial_place=initial_place+inThisYear;
    clear ttTemp ttAll
%Êä³öÎªexcelÎÄµµ
 % dat_1=datevec(ttAll.Date_Time(1));
 %   yystr=num2str(dat_1(1,1));
 %   titlestr=yystr;
    
%output_path_2='D:\BC_Figures\data\BC_4_merge\Year\';
%output_filename_2=strcat(output_path_2,char(titlestr),'.xlsx');
%[~]=fromTimetabletoExcel(ttAll,output_filename_2);
end

struct_Vamos1=struct_TEMP;

end
