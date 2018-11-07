function [picwhether]=plotNoOutlier(BC6,tt,yy,mm,Howmanyhours)
figure(2)
picwhether=plot(tt,BC6);
xlabel('Date');
ylabel('BC Concentration (\mug/m^{3})');
yystr=num2str(yy);mmstr=num2str(mm);
if(1<=mm&&mm<=9)
    mmstr=strcat('0',num2str(mm));
end
Datestr=strcat(yystr,mmstr);
titlestr=strcat(Datestr,' BC Outliers Deleted');
title(titlestr,'Fontname','times new Roman');
legend('BC Concentration');
%ax=gca;
%xlim(datetime([tt(1) tt(size(tt,1))]));
%xtickformat('yyyy/MM/dd');
%ax.XLim=[tt(1) tt(size(tt,1))];
%ax.XTick=linspace(tt(1),tt(size(tt,1)),6);
%ax.XMinorTick='on'
datetick('x',26,'keepticks');%1为Mar-01-2000;26为yyyy/mm/dd,29为yyyy-mm-dd
%dynamicDateTicks;
%setDateAxes(2, 'XLim', [datenum('January 1, 2016') datenum('March 1, 2016')]);
set(2,'unit','centimeters','position',[0.01 5 33.3 12]) ;
outlier_inform_path='D:\BC_Figures\data\BC_2_outliers\4_outlier_inform\';
Monthstr=strcat(num2str(yy),num2str(mm));
printname1=strcat('PO',Monthstr,'_',num2str(Howmanyhours),'h');
printroute1=strcat(outlier_inform_path,printname1);
print(2,'-djpeg','-r800',printroute1); %修改分辨率保存
end