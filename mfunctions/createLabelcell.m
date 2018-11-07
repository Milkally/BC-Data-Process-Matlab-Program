function[Labelcell]=createLabelcell()
Labelcell=cell(1,27);
MonthList={'Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sept';'Oct';'Nov';'Dec'};
YearList={'2015','2016','2017','2018'};

Labelcell(1,1)=cellstr( strcat (char(MonthList(12)),'-',char(YearList(1))));
for i=2:6
Labelcell(1,i)=cellstr( strcat (char(MonthList(i-1)),'-',char(YearList(2))));
end
for i=7:11
Labelcell(1,i)=cellstr( strcat (char(MonthList(i+1)),'-',char(YearList(2))));
end
for i=12:23
Labelcell(1,i)=cellstr( strcat (char(MonthList(i-11)),'-',char(YearList(3))));
end
for i=24:27
Labelcell(1,i)=cellstr( strcat (char(MonthList(i-23)),'-',char(YearList(4))));
end
end
