function[aaa]=mkdirComparison()
mkdir D:\BC_Figures\data\BC_4_merge\Comparison
str={'Spring','Summer','Fall','Winter',...%每个季节的4年比较 4
    '2016Seasons','2017Seasons','AllSeason',...%同一年中的4季比较 7
    'Weekdays','Weekends',...%（非)工作日的4年比较 9
    '2016Week','2017Week','AllWeek',...%同一年中的工作日/非工作日比较 12
    '2015WinterWeek','2016WinterWeek','2017WinterWeek','AllWinterWeek'...%16 同一个"冬季"中的工作日/非工作日比较
    'Heating','NonHeating',...%（非）采暖季的多年比较18 
    '2016Heating','2017Heating','AllHeating','Last2Heating',...%22同一年中的采暖/非采暖季比较
    'Years',...%2016和2017年的比较 23
    'Traffic_Winter','Traffic_Summer','Traffic_Fall','Traffic_Spring',... %27
    'Traffic_2016Seasons','Traffic_2017Seasons',...%29
    'Traffic_2016Week','Traffic_2017Week','Traffic_AllWeek',... %32
    'Traffic_2015WinterWeek','Traffic_2016WinterWeek','Traffic_2017WinterWeek','Traffic_AllWinterWeek',...%36
    'Traffic_2016Heating','Traffic_2017Heating','Traffic_AllHeating','Traffic_Last2Heating',...%40
    'Traffic_Year'};%41

for k=1:3
Mpath=strcat('D:\BC_Figures\data\BC_4_merge\Comparison\',char(str(k)));
mkdir(Mpath)
end

%复制待Compare的文件
for p=1:size(str,2)
     destiny=strcat('D:\BC_Figures\data\BC_4_merge\Comparison\',char(str(p)));
switch p
  % Spring','Summer','Fall','Winter', '2016Seasons','2017Seasons','AllSeason'
    case{1,2,3,4,5,6,7}
        current=p;
        patterns ={ 'Spring'; 'Summer';'Fall';'Winter';'2016';'2017';'all_'};
        pattern=char(patterns(current));
        aastr='D:\BC_Figures\data\BC_4_merge\Season\Fulltime';
  %'Weekdays','Weekends','2016Week','2017Week','AllWeek'
    case{8,9,10,11,12}
        current=p-7;
        patterns ={ 'weekday'; 'weekend';'2016';'2017';'all_'};
        pattern=char(patterns(current));
        aastr='D:\BC_Figures\data\BC_4_merge\Week\Fulltime\Year\';
  %'2015WinterWeek','2016WinterWeek','2017WinterWeek'
    case{13,14,15,16}
        current=p-12;
        patterns ={ '2015Winter';'2016Winter';'2017Winter';'All_Winter'};
        pattern=char(patterns(current));
        aastr='D:\BC_Figures\data\BC_4_merge\Week\Fulltime\Season\';
 %'Heating','NonHeating',
 %'2016Heating','2017Heating','AllHeating','Last2Heating'
   case{17,18,19,20,21,22}
        current=p-16;
        patterns ={ 'Heating';'NonHeating';'2016';'2017';'all';'Last2'};
        pattern=char(patterns(current));
        aastr='D:\BC_Figures\data\BC_4_merge\Heating\Fulltime\';   
  %'Traffic_Winters'
    case{23}
        current=p-22;
        patterns ={ '1'};
        pattern=char(patterns(current));
        aastr='D:\BC_Figures\data\BC_4_merge\Year\Fulltime\';   
    case{24,25,26,27}
        current=p-23;
        patterns ={ 'inter','ummer','Fall','pring'};
        pattern=char(patterns(current));
        aastr='D:\BC_Figures\data\BC_4_merge\Traffic\Season\Fulltime\csv\';   
      case{28,29}
        current=p-27;
        patterns ={ '2016','2017'};
        pattern=char(patterns(current));   
        aastr='D:\BC_Figures\data\BC_4_merge\Traffic\Season\Fulltime\csv\';   
  %'Traffic_AllWeek'
   % case{30,31,32}
      %  current=p-29;
      %  patterns ={ '2016','2017','all'};
      %  pattern=char(patterns(current));
      %  aastr='D:\BC_Figures\data\BC_4_merge\Traffic\Week\All\Fulltime\csv\';  
    %  case{33,34,35,36}
    %    current=p-32;
    %    patterns ={ '2015Winter','2016Winter','2017Winter'};
    %    pattern=char(patterns(current));
    %    aastr='D:\BC_Figures\data\BC_4_merge\Traffic\Week\All\Fulltime\csv\';  
     case{37,38,39,40}
        current=p-36;
        patterns ={ '16','17','ll','ast2'};
        pattern=char(patterns(current));
        aastr='D:\BC_Figures\data\BC_4_merge\Traffic\Heating\Fulltime\csv\';  
      case{41}
        current=p-40;
        patterns ={ '1'};
        pattern=char(patterns(current));
        aastr='D:\BC_Figures\data\BC_4_merge\Traffic\Year\Fulltime\csv\';   
end
cd(aastr); 
        dir;
        filepath=dir;
        for i=3:size(filepath,1)
        TF(i) = contains(filepath(i).name,pattern);
        end
        for j=3:size(filepath,1)
            if TF(j)
            copyfile(filepath(j).name,destiny)
            end
        end
end

aaa=1;
end