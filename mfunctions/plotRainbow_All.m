function[picwhether]=plotRainbow_All(final_27,Datastr,Filepath)
%final=[num(:,1:2) BC6];
mkdir('D:\BC_Figures\output\figure\Rainbow\','All');

monthnum=size(unique(final_27(:,1)),1);

N=cell(monthnum+1,25);
N(1,2:end)=num2cell(0:1:23);
N(2:end,1)={'Jan-15';'Jan-16';'Feb-16';'Mar-16';'Apr-16';'May-16';'Aug-16';'Sept-16';'Oct-16';'Nov-16';'Dec-16';...
    'Jan-17';'Feb-17';'Mar-17';'Apr-17';'May-17';'Jun-17';'Jul-17';'Aug-17';'Sept-17';'Oct-17';'Nov-17';'Dec-17';...
    'Jan-18';'Feb-18';'Mar-18';'Apr-18'};
N2=cell(11,25);
N2(1,2:end)=num2cell(0:1:23);
N2(2:end,1)={'Winter-15','Spring-16','Summer-16','Fall-16','Winter-16','Spring-17','Summer-17','Fall-17','Winter-17','Spring-18'};

M=zeros(monthnum,24);
Q=zeros(monthnum,24);
M2=zeros(10,24);
Q2=zeros(10,24);

jan15=1;jan16=1;feb16=1;mar16=1;apr6=1;may16=1;aug16=1;sept16=1;oct16=1;nov16=1;dec16=1;
jan17=1;feb17=1;mar17=1;apr17=1;may17=1;jun17=1;jul17=1;aug17=1;sept17=1;oct17=1;nov17=1;dec17=1;
jan18=1;feb18=1;mar18=1;apr18=1;
[JAN15,JAN16,FEB16,MAR16,APR16,MAY16,AUG16,SEPT16,OCT16,NOV16,DEC16,...
    JAN17,FEB17,MAR17,APR17,MAY17,JUN17,JUL17,AUG17,SEPT17,OCT17,NOV17,DEC17,...
    JAN18,FEB18,MAR18,APR18] = deal(zeros(50000,2));
win15=1;spr16=1;sum16=1;fal16=1;win16=1;spr17=1;sum17=1;fal17=1;win17=1;spr18=1;
[WIN15,SPR16,SUM16,FAL16,WIN16,SPR17,SUM17,FAL17,WIN17,SPR18]=deal(zeros(50000,2));

for i=1:size(final_27,1)
   switch final_27(i,1)-11
       case{1}  
           JAN15(jan15,:)=final_27(i,2:3);jan15=jan15+1;
           WIN15(win15,:)=final_27(i,2:3);win15=win15+1;
       case{2} 
           JAN16(jan16,:)=final_27(i,2:3);jan16=jan16+1;
           WIN15(win15,:)=final_27(i,2:3);win15=win15+1;
       case{3} 
           FEB16(feb16,:)=final_27(i,2:3);feb16=feb16+1;
           WIN15(win15,:)=final_27(i,2:3);win15=win15+1;
       case{4} 
           MAR16(mar16,:)=final_27(i,2:3);mar16=mar16+1;
           SPR16(spr16,:)=final_27(i,2:3);spr16=spr16+1;
       case{5} 
           APR16(apr6,:)=final_27(i,2:3);apr6=apr6+1;
           SPR16(spr16,:)=final_27(i,2:3);spr16=spr16+1;
       case{6} 
           MAY16(may16,:)=final_27(i,2:3);may16=may16+1;
           SPR16(spr16,:)=final_27(i,2:3);spr16=spr16+1;
       case{9} 
           AUG16(aug16,:)=final_27(i,2:3);aug16=aug16+1;
           SUM16(sum16,:)=final_27(i,2:3);sum16=sum16+1;
       case{10}  
           SEPT16(sept16,:)=final_27(i,2:3);sept16=sept16+1;
           FAL16(fal16,:)=final_27(i,2:3);fal16=fal16+1;
       case{11}  
           OCT16(oct16,:)=final_27(i,2:3);oct16=oct16+1;
           FAL16(fal16,:)=final_27(i,2:3);fal16=fal16+1;
       case{12} 
           NOV16(nov16,:)=final_27(i,2:3);nov16=nov16+1;
           FAL16(fal16,:)=final_27(i,2:3);fal16=fal16+1;
       case{13} 
           DEC16(dec16,:)=final_27(i,2:3);dec16=dec16+1;
            WIN16(win16,:)=final_27(i,2:3);win16=win16+1;
       case{14}  
           JAN17(jan17,:)=final_27(i,2:3);jan17=jan17+1;
           WIN16(win16,:)=final_27(i,2:3);win16=win16+1;
       case{15}
           FEB17(feb17,:)=final_27(i,2:3);feb17=feb17+1;
           WIN16(win16,:)=final_27(i,2:3);win16=win16+1;
       case{16}
           MAR17(mar17,:)=final_27(i,2:3);mar17=mar17+1;
           SPR17(spr17,:)=final_27(i,2:3);spr17=spr17+1;
       case{17}
           APR17(apr17,:)=final_27(i,2:3);apr17=apr17+1;
           SPR17(spr17,:)=final_27(i,2:3);spr17=spr17+1;
       case{18}
           MAY17(may17,:)=final_27(i,2:3);may17=may17+1;
           SPR17(spr17,:)=final_27(i,2:3);spr17=spr17+1;
       case{19}
           JUN17(jun17,:)=final_27(i,2:3);jun17=jun17+1;
           SUM17(sum17,:)=final_27(i,2:3);sum17=sum17+1;
       case{20}
           JUL17(jul17,:)=final_27(i,2:3);jul17=jul17+1;
           SUM17(sum17,:)=final_27(i,2:3);sum17=sum17+1;
       case{21}
           AUG17(aug17,:)=final_27(i,2:3);aug17=aug17+1;
           SUM17(sum17,:)=final_27(i,2:3);sum17=sum17+1;
       case{22}
           SEPT17(sept17,:)=final_27(i,2:3);sept17=sept17+1;
           FAL17(fal17,:)=final_27(i,2:3);fal17=fal17+1;
       case{23}
           OCT17(oct17,:)=final_27(i,2:3);oct17=oct17+1;
           FAL17(fal17,:)=final_27(i,2:3);fal17=fal17+1;
       case{24}
           NOV17(nov17,:)=final_27(i,2:3);nov17=nov17+1;
           FAL17(fal17,:)=final_27(i,2:3);fal17=fal17+1;
       case{25}
           DEC17(dec17,:)=final_27(i,2:3);dec17=dec17+1;
           WIN17(win17,:)=final_27(i,2:3);win17=win17+1;
       case{26}
           JAN18(jan18,:)=final_27(i,2:3);jan18=jan18+1;
           WIN17(win17,:)=final_27(i,2:3);win17=win17+1;
       case{27}
           FEB18(feb18,:)=final_27(i,2:3);feb18=feb18+1;
           WIN17(win17,:)=final_27(i,2:3);win17=win17+1;
       case{28}
           MAR18(mar18,:)=final_27(i,2:3);mar18=mar18+1;
           SPR18(spr18,:)=final_27(i,2:3);spr18=spr18+1;
       case{29}
           APR18(apr18,:)=final_27(i,2:3);apr18=apr18+1;
           SPR18(spr18,:)=final_27(i,2:3);spr18=spr18+1;
   end
end
statA=[JAN15(:,1) JAN16(:,1) FEB16(:,1) MAR16(:,1) APR16(:,1) MAY16(:,1) AUG16(:,1) SEPT16(:,1) OCT16(:,1) NOV16(:,1) DEC16(:,1) JAN17(:,1) FEB17(:,1) MAR17(:,1) APR17(:,1) MAY17(:,1) JUN17(:,1) JUL17(:,1) AUG17(:,1) SEPT17(:,1) OCT17(:,1) NOV17(:,1) DEC17(:,1)...
    JAN18(:,1) FEB18(:,1) MAR18(:,1) APR18(:,1)];
statB=[JAN15(:,2) JAN16(:,2) FEB16(:,2) MAR16(:,2) APR16(:,2) MAY16(:,2) AUG16(:,2) SEPT16(:,2) OCT16(:,2) NOV16(:,2) DEC16(:,2) JAN17(:,2) FEB17(:,2) MAR17(:,2) APR17(:,2) MAY17(:,2) JUN17(:,2) JUL17(:,2) AUG17(:,2) SEPT17(:,2) OCT17(:,2) NOV17(:,2) DEC17(:,2)...
    JAN18(:,2) FEB18(:,2) MAR18(:,2) APR18(:,2)];
statC=[WIN15(:,1) SPR16(:,1) SUM16(:,1) FAL16(:,1) WIN16(:,1) SPR17(:,1) SUM17(:,1) FAL17(:,1) WIN17(:,1) SPR18(:,1)];
statD=[WIN15(:,2) SPR16(:,2) SUM16(:,2) FAL16(:,2) WIN16(:,2) SPR17(:,2) SUM17(:,2) FAL17(:,2) WIN17(:,2) SPR18(:,2)];


for i=1:size(statB,1)
    for j=1:monthnum
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

for i=1:monthnum
    for j=1:24
    ANS(i,j)=M(i,j)/Q(i,j);
    N(i+1,j+1)=num2cell(ANS(i,j));
    end
end

figure(16)
%画彩虹图
x=[1:1:monthnum];y=[1:1:24];
h=imagesc(x,y,ANS',[0 8]);colormap(jet);colorbar;
h=gcf
set(gcf,'unit','centimeters','position',[0.01 5 22 12]) ;
h.Alphamap = .35;%使图像的半透明参数为0.5
%颜色图：jet.颜色数据0.5-8，X轴1-12，Y轴1-24。轴标题.
axis xy;
ax=gca;
xlabel('Month');
ylabel('Hour');
title('2015-2018 Diurnal');
%ax.XLabel=("Month");
%ax.YLabel=("Hour");
ax.XTick=[1:1:monthnum]
ax.YTick=[1:1:24]
%ax.YLabel=cellstr(num2str([0:1:23]));
%ax.YTickLabel=cellstr(mat2str([0:1:23],23,1))
ax.XTickLabel=N(2:end,1);
ax.XTickLabelRotation=60;

PRystring1=strcat('D:\BC_Figures\output\figure\Rainbow\',Filepath,'\',Datastr);
saveas(16,strcat(PRystring1,'_temp.fig'));
print(16,'-djpeg','-r1000',PRystring1);

xlsfilename=strcat('D:\BC_Figures\output\figure\Rainbow\',Filepath,'\',Datastr,'_EachMonth.xlsx');
xlswrite(xlsfilename,N);


%下面是季节的
for i=1:length(statD)
    for j=1:10
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

for i=1:10
    for j=1:24
    ANS2(i,j)=M2(i,j)/Q2(i,j);
    N2(i+1,j+1)=num2cell(ANS2(i,j));
    end
end

xlsfilename=strcat('D:\BC_Figures\output\figure\Rainbow\',Filepath,'\',Datastr,'_AllSeasons.xlsx');
xlswrite(xlsfilename,N2);

picwhether=1;
end






          