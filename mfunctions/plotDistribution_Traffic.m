function [picwhether]=plotDistribution_Traffic(BC6,Datastr,Filepath)
picwhether=0;

mkdir('D:\BC_Figures\output\figure\Distribution\',Filepath);
titlestr = strcat(Datastr,' Distribution');
outputstr=strcat('D:\BC_Figures\output\figure\Distribution\',Filepath,'\');
str1=strcat(Filepath,'\FreqN1');
str2=strcat(Filepath,'\Freq');
str4=strcat(Filepath,'\Count');
mkdir ('D:\BC_Figures\output\figure\Distribution\',str1);
mkdir ('D:\BC_Figures\output\figure\Distribution\',str2);
mkdir ('D:\BC_Figures\output\figure\Distribution\',str4);
%这个不对呀：hist(BC6,10);
%[f,x]=ecdf(BC6);
%ecdfhist(f,x);

figure(1) %频数直方图,宽度5
h1 = histogram(BC6);
set(h1,'FaceColor',[0 191 255]/255,'LineWidth',2,'EdgeColor','w','Binwidth',0.1);
title(titlestr,'Fontname','times new Roman');
ax=gca;
ax.XLim=[0 1];
xlabel('Traffic Ratio','Fontname','times new Roman');
ylabel('Count');
legend('Count','Location','NorthEast');
%存储图片
PRystring1=strcat(outputstr,'Count\',titlestr,'_Number.jpg');
saveas(1,strcat(PRystring1,'.fig'));
print(1,'-djpeg','-r1000',PRystring1);

figure(2) %频数直方图，宽度1
h2 = histogram(BC6);
set(h2,'FaceColor',[0 191 255]/255,'LineWidth',0.8,'EdgeColor','w','Binwidth',0.05);
title(titlestr,'Fontname','times new Roman');
ax=gca;
ax.XLim=[0 1];
xlabel('Traffic Ratio','Fontname','times new Roman');
ylabel('Count');
legend('Count','Location','NorthEast');
%存储图片
PRystring2=strcat(outputstr,'Count\',titlestr,'_Number2.jpg');
saveas(2,strcat(PRystring2,'.fig'));
print(2,'-djpeg','-r1000',PRystring2);


figure(3)%N1频率直方图
h3 = histogram(BC6,10,'Normalization','probability');
set(h3,'FaceColor',[0.98039 0.50196 0.44706],'LineWidth',0.5,'EdgeColor','w','Binwidth',0.1);
title(titlestr,'Fontname','times new Roman');
ax=gca;
ax.XLim=[0 1];
ax.TickDir='out';
xlabel('Traffic Ratio','Fontname','times new Roman');
ylabel('Frequency');
%legend('Frequency','Location','NorthEast');
%存储图片
PRystring3=strcat(outputstr,'FreqN1\',titlestr,'_Prob.jpg');
saveas(3,strcat(PRystring3,'.fig'));
print(3,'-djpeg','-r1000',PRystring3);

figure(4);%N1频率直方图+ECDF
yyaxis left
h4 = histogram(BC6,1,'Normalization','probability');
set(h4,'FaceColor',[65 105 225]/255,'LineWidth',1.5,'EdgeColor','w','Binwidth',0.1);
ax=gca;ylabel('Frequency');
hold on
yyaxis right  % 用右边的y轴展示
cdfplot(BC6);
title(titlestr,'Fontname','times new Roman');
ax=gca;
%.YColor=[65 105 225]/255
ax.XLim=[0 1];
xlabel('Traffic Ratio','Fontname','times new Roman');
ylabel('Empirical CDF');
%ll=legend('Probablity','Empirical cumulative distribution function','Location','East');
ll=legend('Frequency','Traffic Ratio Empirical CDF','Location','NorthEast');
%保存图片
PRystring4=strcat(outputstr,'FreqN1\',titlestr,'_Prob+ECDF.jpg');
saveas(4,strcat(PRystring4,'.fig'));
print(4,'-djpeg','-r1000',PRystring4);

figure(5) %N1频率直方图，宽度5,+ECDF
yyaxis left
h4 = histogram(BC6,20,'Normalization','probability');
set(h4,'FaceColor',[65 105 225]/255,'LineWidth',1.5,'EdgeColor','w','Binwidth',0.05);
ax=gca;ylabel('Frequency');
hold on
yyaxis right  % 用右边的y轴展示
cdfplot(BC6);
title(titlestr,'Fontname','times new Roman');
ax=gca;
%.YColor=[65 105 225]/255
ax.XLim=[0 1];
xlabel('Traffic Ratio','Fontname','times new Roman');
ylabel('Empirical CDF');
ll=legend('Frequency','Traffic Ratio ECDF','Location','NorthEast');
%存储图片
PRystring5=strcat(outputstr,'FreqN1\',titlestr,'_Prob+Ecdf2.5.jpg');
saveas(5,strcat(PRystring5,'.fig'));
print(5,'-djpeg','-r1000',PRystring5);

figure(6)%N1频率直方图,宽度5
h6 = histogram(BC6,20,'Normalization','probability');
set(h6,'FaceColor',[0.98039 0.50196 0.44706],'LineWidth',2,'EdgeColor','w','Binwidth',0.05);
title(titlestr,'Fontname','times new Roman');
ax=gca;
ax.XLim=[0 1];
ax.TickDir='out';
xlabel('Traffic Ratio','Fontname','times new Roman');
ylabel('f(x)');
ll=legend('Frequency','Location','NorthEast');
%存储图片
PRystring6=strcat(outputstr,'FreqN1\',titlestr,'_Prob.jpg');
saveas(6,strcat(PRystring6,'.fig'));
print(6,'-djpeg','-r1000',PRystring6);

figure(7)%真的频率直方图+EFDC-Freq
[n,bins]=hist(BC6);
h7=bar(bins,n/length(BC6));
%h7 = histogram(BC6,'Normalization','pdf');
set(h7,'FaceColor',[255 193 193]/255,'LineWidth',1,'EdgeColor','w','BarWidth',0.1);%橙红色
h7.FaceAlpha=0.9;%黄
ax=gca;
ylabel('Frequency');
ax.XLim=[0 1];
%ax.YLim=[0 0.5];
hold on
yyaxis right  % 用右边的y轴展示
cdfplot(BC6);
ax=gca;
xlabel('Traffic Ratio','Fontname','times new Roman');
ylabel('Empirical CDF');
YGrid='off'
legend('Frequency','Traffic Ratio ECDF')
title(titlestr,'Fontname','times new Roman');
%保存图片
PRystring7=strcat(outputstr,'Freq\','_All_ProbN1+ECDF.jpg');
saveas(7,strcat(outputstr,'Freq\','_All_Prob+ECDF','.fig'));
print(7,'-djpeg','-r1000',PRystring7);


%h=findobj(gca,'Type','patch');
%h.FaceColor=[0.941176,1,1];
%h.FaceColor='red';
%axis=[0 30];
%ax=gca
%set(gca,'xtick',[0:5:30]);
%ax.TickDir='out';
%ax.XLim=[0 25];
%yyaxis right  % 用右边的y轴展示
%yyaxis left
%set(ll,'Interpreter','latex');

picwhether=1;
end