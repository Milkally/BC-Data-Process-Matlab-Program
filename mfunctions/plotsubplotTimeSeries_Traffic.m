function [picwhether]=plotsubplotTimeSeries_Traffic(tt1,BC_1,tt2,BC_2,tt3,BC_3,tt4,BC_4,Datastr,Filepath)
mkdir('D:\BC_Figures\output\figure\Time_series\',Filepath);
titlestr = strcat(Datastr);
outputstr=strcat('D:\BC_Figures\output\figure\Time_series\',Filepath,'\All');
figure(9)
subplot(4,1,1);
plot(tt1,BC_1,'LineWidth',0.4,'Color',[0 191 255]/255);
ax=gca;
ax.XLim=[datetime(2015,1,1);datetime(2015,12,31,23,59,00)];
datetick('x',26);
%datetick('x',26,'keepticks');
ax.YLim=[0 1];

subplot(4,1,2);
plot(tt2,BC_2,'LineWidth',0.4,'Color',[0 191 255]/255);
ax=gca;
datetick('x',26,'keepticks');
ax.YLim=[0 1];

subplot(4,1,3);
plot(tt3,BC_3','LineWidth',0.4,'Color',[0 191 255]/255);
ax=gca;
%datetick('x',26);
tickm=[datetime(2017,1,1);datetime(2017,4,1);datetime(2017,7,1);datetime(2017,10,1);datetime(2018,1,1)];%因为你这个格式比较长，我只分了4格，你想多分点也行，就是会叠在一起
set(gca,'xtick',tickm);
for n=1:length(tickm)
tm{n}=datestr(tickm(n),'yyyy-mm-dd');
end
set(gca,'xticklabel',tm);
ax.YLim=[0 1];

subplot(4,1,4);
plot(tt4,BC_4,'LineWidth',0.4,'Color',[0 191 255]/255);
ax=gca;
%datetick('x',26,'keepticks');
ax.XLim=[datetime(2018,1,1);datetime(2018,12,31,23,59,00)];
datetick('x',26);
ax.YLim=[0 1];

%加坐标轴
hAxis = axes('visible','off');
h = text(-0.1,0.5,'Traffic Ratio');
set(h,'fontsize',10,'rotation',90,'HorizontalAlignment','center');
%ylabel('BC Concentration (μg/m^{3})');
h = text(0.5,1.025,'2015-2018 BC Time-series');
set(h,'fontsize',9,'rotation',0,'HorizontalAlignment','center');

print(9,'-djpeg','-r1000',outputstr); %修改分辨率保存
saveas(9,strcat(outputstr,'.fig'));

picwhether=1;
end