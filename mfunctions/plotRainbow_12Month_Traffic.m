function[picwhether]=plotRainbow_12Month_Traffic(final,Datastr,Filepath)
%final=[num(:,1:2) BC6];
mkdir('D:\BC_Figures\output\figure\Rainbow\',Filepath);

N=cell(13,25);
N(1,2:end)=num2cell(1:1:24);
N(2:end,1)={'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'};
N2=cell(5,25);
N2(1,2:end)=num2cell(0:1:23);
N2(2:end,1)={'Spring','Summer','Fall','Winter'};

M=zeros(12,24);
Q=zeros(12,24);
M2=zeros(4,24);
Q2=zeros(4,24);

jan=1;feb=1;mar=1;apr=1;may=1;jun=1;jul=1;aug=1;sept=1;oct=1;nov=1;dec=1;
[JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEPT,OCT,NOV,DEC] = deal(zeros(50000,2));
spring=1;summer=1;fall=1;winter=1;
[SPRING,SUMMER,FALL,WINTER] = deal(zeros(50000,2));

for i=1:size(final,1)
   switch final(i,1)
       case{1}  
           JAN(jan,:)=final(i,2:3);jan=jan+1;
           WINTER(winter,:)=final(i,2:3);winter=winter+1;
       case{2} 
           FEB(feb,:)=final(i,2:3);feb=feb+1;
            WINTER(winter,:)=final(i,2:3);winter=winter+1;
       case{3} 
           MAR(mar,:)=final(i,2:3);mar=mar+1;
           SPRING(spring,:)=final(i,2:3);spring=spring+1;
       case{4} 
           APR(apr,:)=final(i,2:3);apr=apr+1;
           SPRING(spring,:)=final(i,2:3);spring=spring+1;
       case{5} 
           MAY(may,:)=final(i,2:3);may=may+1;
           SPRING(spring,:)=final(i,2:3);spring=spring+1;
       case{6} 
           JUN(jun,:)=final(i,2:3);jun=jun+1;
           SUMMER(summer,:)=final(i,2:3);summer=summer+1;
       case{7} 
           JUL(jul,:)=final(i,2:3);jul=jul+1;
       case{8}  
           AUG(aug,:)=final(i,2:3);aug=aug+1;
       case{9}  
           SEPT(sept,:)=final(i,2:3);sept=sept+1;
           FALL(fall,:)=final(i,2:3);fall=fall+1;
       case{10} 
           OCT(oct,:)=final(i,2:3);oct=oct+1;
           FALL(fall,:)=final(i,2:3);fall=fall+1;
       case{11} 
           NOV(nov,:)=final(i,2:3);nov=nov+1;
           FALL(fall,:)=final(i,2:3);fall=fall+1;
       case{12}  
           DEC(dec,:)=final(i,2:3);dec=dec+1;
            WINTER(winter,:)=final(i,2:3);winter=winter+1;
   end
end
statA=[JAN(:,1) FEB(:,1) MAR(:,1) APR(:,1) MAY(:,1) JUN(:,1) JUL(:,1) AUG(:,1) SEPT(:,1) OCT(:,1) NOV(:,1) DEC(:,1)];
statB=[JAN(:,2) FEB(:,2) MAR(:,2) APR(:,2) MAY(:,2) JUN(:,2) JUL(:,2) AUG(:,2) SEPT(:,2) OCT(:,2) NOV(:,2) DEC(:,2)];
statC=[SPRING(:,1) SUMMER(:,1) FALL(:,1) WINTER(:,1)];
statD=[SPRING(:,2) SUMMER(:,2) FALL(:,2) WINTER(:,2)];

for i=1:length(statB)
    for j=1:12
    if (statB(i,j)~=0&&(~isnan(statB(i,j))))
        for n=1:24
        if statA(i,j)==n-1
            M(j,n)=M(j,n)+statB(i,j);
            Q(j,n)=Q(j,n)+1;
        end
        end
    end
    end
end

for i=1:12
    for j=1:24
    ANS(i,j)=M(i,j)/Q(i,j);
    N(i+1,j+1)=num2cell(ANS(i,j));
    end
end

figure(15)
%画彩虹图
x=[1:1:12];y=[1:1:24];
h=imagesc(x,y,ANS',[0 1]);colormap(jet);colorbar;
h=gcf
h.Alphamap = .35;%使图像的半透明参数为0.5
%颜色图：jet.颜色数据0.5-7，X轴1-12，Y轴1-24。轴标题.
axis xy;
ax=gca;
xlabel('Month');
ylabel('Hour');
title('2015-2018 Diurnal');
%ax.XLabel=("Month");
%ax.YLabel=("Hour");
ax.XTick=[1:1:12]
ax.YTick=[1:1:24]
%ax.YLabel=cellstr(num2str([0:1:23]));
ax.YTickLabel={'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23'};

PRystring1=strcat('D:\BC_Figures\output\figure\Rainbow\',Filepath,'\',Datastr);
saveas(15,strcat(PRystring1,'.fig'));
print(15,'-djpeg','-r1000',PRystring1);

xlsfilename=strcat('D:\BC_Figures\output\figure\Rainbow\',Filepath,'\',Datastr,'_12Month.xlsx');
xlswrite(xlsfilename,N);

%下面是季节的
for i=1:length(statD)
    for j=1:4
    if (statD(i,j)~=0&&(~isnan(statD(i,j))))
        for n=1:24
        if statC(i,j)==n-1
            M2(j,n)=M2(j,n)+statD(i,j);
            Q2(j,n)=Q2(j,n)+1;
        end
        end
    end
    end
end

for i=1:4
    for j=1:24
    ANS2(i,j)=M2(i,j)/Q2(i,j);
    N2(i+1,j+1)=num2cell(ANS2(i,j));
    end
end

xlsfilename=strcat('D:\BC_Figures\output\figure\Rainbow\',Filepath,'\',Datastr,'_4Seasons.xlsx');
xlswrite(xlsfilename,N2);



picwhether=1;
end






          