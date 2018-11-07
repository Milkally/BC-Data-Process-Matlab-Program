function [picwhether]=plotWithOutlier_for_Choose(BC6,tt,TFlogic,yy,mm,Howmanyhours)
figure(1)
picwhether=plot(tt,BC6,tt(TFlogic),BC6(TFlogic),'x');
xlabel('Date');
ylabel('BC Concentration (\mug/m^{3})');
yystr=num2str(yy);mmstr=num2str(mm);
if(1<=mm&&mm<=9)
    mmstr=strcat('0',num2str(mm));
end
Datestr=strcat(yystr,mmstr);
titlestr=strcat(Datestr,'BC',' With Outliers');
title(titlestr,'Fontname','times new Roman');
legend('BC Concentration');
%ax=gca;
datetick('x',31,'keepticks');
%ax.XLim=[tt(1) tt(size(tt,1))];
%ax.XTick=[linspace(tt(1),tt(size(tt,1)),4)];
set(1,'unit','centimeters','position',[0.01 5 33.3 12]) ;
outlier_inform_path='D:\BC_Figures\data\BC_outliers\output\choosed_days\WithOutlier_Window\';
Monthstr=strcat(num2str(yy),num2str(mm));
printname1=strcat('WO',Monthstr,'_',num2str(Howmanyhours),'h');
printroute1=strcat(outlier_inform_path,printname1);
print(1,'-djpeg','-r800',printroute1); %修改分辨率保存
end