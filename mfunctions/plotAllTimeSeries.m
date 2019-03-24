function [picwhether]= plotAllTimeSeries(BC6,tt,Datastr,Filepath)
picwhether=0;
ymax=nanmax(BC6);

mkdir('D:\BC_Figures\output\figure\Timeseries\',Filepath);
titlestr=strcat(extractBefore(Datastr,'.xlsx'),' BC.Concentration');
outputstr=strcat('D:\BC_Figures\output\figure\Timeseries\',Filepath,'\',titlestr);
%title(titlestr,'Fontname','times new Roman');

figure(1)
h=plot(tt,BC6,'-b',...
    'LineWidth',0.3,...
    'MarkerSize',0.1);
   %'MarkerFaceColor',[1,0.84314,0]);
datetick('x',26,'keepticks'); %这样的话会有比较多的X轴小刻度
set(h,'Color',[0,0.749,1]);
set(gcf,'unit','centimeters','position',[0.01 5 33.3 12]) ;
title(titlestr,'Fontname','times new Roman');
ax=gca;
ax.TickDir='out';
ax.XLabel.String='Date';
ax.YLabel.String='BC (μg/m^{3})','Fontname';'times new Roman';
ax.FontSize=10;


hold on
plot([datetime(2015,12,1,0,0,0) datetime(2015,12,1,0,0,0)], [0 ymax],'--k');
plot([datetime(2016,1,1,0,0,0) datetime(2016,1,1,0,0,0)], [0 ymax],'--k');
plot([datetime(2017,1,1,0,0,0) datetime(2017,1,1,0,0,0)], [0 ymax],'--k');
plot([datetime(2018,1,1,0,0,0) datetime(2018,1,1,0,0,0)], [0 ymax],'--k');

legend('BC Concentration');
%ax.Legend.TextColor = [1,0.84314,0]; %这个是橙色的字体，妈呀

%将画出的BC时序图保存
pdfstring=strcat(outputstr,'.pdf');jpgstring=strcat(outputstr,'.jpg');
%saveas(gcf,pdfstring,'pdf');
%saveas(gcf,pngstring,'png');
print(1,'-djpeg','-r800',jpgstring); %修改分辨率保存
saveas(1,strcat(outputstr,'.fig'));
picwhether=1;
end
