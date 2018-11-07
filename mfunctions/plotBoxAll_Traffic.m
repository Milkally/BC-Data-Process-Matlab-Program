function [picwhether]=plotBoxAll_Traffic(BC6,TM,Datastr,Filepath)
mkdir('D:\BC_Figures\output\figure\Box\',Filepath);
outputstr=strcat('D:\BC_Figures\output\figure\Box\',Filepath,'\');
titlestr=Datastr;

%TM=total month number from 2015/1
%这个函数可以统计出：一共有多少个不同的月份
B=length(TM)-length(find(diff(sort(TM))==0));
    %B=length(find(diff(sort(TM))==1))+2; %same function
Labelcell=cell(1,B);
MonthList={'Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sept';'Oct';'Nov';'Dec'};
YearList={'2015','2016','2017','2018'};

Labelcell(1,1)=cellstr( strcat (char(MonthList(1)),'-',char(YearList(1))));
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

figure(11)
ax=boxplot(BC6,TM,...
   'Labels',Labelcell);
      %'Labels',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'});
   %ax.Labels=char(Labelcell);
   set(gcf,'unit','centimeters','position',[0.01 5 35.3 12]) ;
   title('2015-2018 Traffic Ratio');
   xlabel('Month');
   ylabel('Traffic Ratio');
    aa=gca;
      aa.XTickLabelRotation=30;
PRystring1=strcat(outputstr,titlestr,'_Box_plot.jpg');
saveas(11,strcat(PRystring1,'.fig'));
print(11,'-djpeg','-r1000',PRystring1);

figure(12)
 ax=boxplot(BC6,TM,...
       'Labels',{'2015.12','2016.1','2016.2','2016.3','2016.4','2016.5','2016.8','2016.9','2016.10','2016.11','2016.12','2017.1','2017.2','2017.3','2017.4','2017.5','2017.6','2017.7','2017.8','2017.9','2017.10','2017.11','2017.12','2018.1','2018.2','2018.3','2018.4'});
   set(gcf,'unit','centimeters','position',[0.01 5 35.3 12]) ;
   title('2015-2018 Traffic Ratio');
   xlabel('Month');
   ylabel('Traffic Ratio');
   aa=gca;
      aa.XTickLabelRotation=30;
PRystring2=strcat(outputstr,titlestr,'_Box_plot_YYYY.MM.jpg');
saveas(12,strcat(PRystring2,'.fig'));
print(12,'-djpeg','-r1000',PRystring2); 
      
%This figure is for checking the plot is right
%figure(13)
% ax=boxplot(BC6,TM);      
%set(gcf,'unit','centimeters','position',[0.01 5 35.3 12]) ;
%   title('2015-2018 BC');
%   xlabel('Month');
%   ylabel('BC Concentration (μg/m^{3})');
%PRystring3=strcat(outputstr,titlestr,'_Box_plot_for_check.jpg');
%saveas(13,strcat(PRystring3,'.fig'));
%print(13,'-djpeg','-r1000',PRystring3); 

picwhether=1;
end
