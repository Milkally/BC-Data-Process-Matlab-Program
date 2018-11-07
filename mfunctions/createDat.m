function [dat_Vamos,yy,mm,yystr,mmstr,titlestr]=createDat(ttVamos)
dat_Vamos=datevec(ttVamos.Date_Time);
yy=dat_Vamos(:,1);mm=dat_Vamos(:,2);
yystr=num2str(yy(1));mmstr=num2str(mm(1));
    if (mm(1)<10&&mm(1)>=1)
        mmstr=strcat('0',mmstr);
    end
titlestr=strcat(yystr,mmstr);
end
