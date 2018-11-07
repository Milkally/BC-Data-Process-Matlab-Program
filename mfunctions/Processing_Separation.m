function[struct_Separated]=Processing_Separation(struct_Fulltime)
mon_num=length(struct_Fulltime);
Filepath='Month';
mkdir('D:\BC_Figures\data\BC_2_separation\BC_separated\BC_Traffic\plots\',Filepath);
outputstr=strcat('D:\BC_Figures\data\BC_2_separation\BC_separated\BC_Traffic\plots\',Filepath,'\');

for m=1:mon_num
ttTemp=struct_Fulltime(m).Timetable;

%用Chow文献的方法进行Separation
[ttSep_full,ttSeparation]= SeparatingTimeseries(ttTemp);

%输出为处理好的矩阵~
Year=year(ttSeparation.Date_Time(1));
    Month=month(ttSeparation.Date_Time(1));
    Year=num2str(Year);Month=num2str(Month);
struct_Separated(m)=struct('Timetable',ttSeparation,'Full_SepTT',ttSep_full,'Year',Year,'Month',Month,'BC1',ttSeparation.BC1_15min,'BC6',ttSeparation.BC6_15min);

%输出为excel文档
[Labelcell]=createLabelcell();
titlestr=Labelcell(m);
output_path_2='D:\BC_Figures\data\BC_2_separation\BC_separated\BC_Baseline\';
output_filename_2=strcat(output_path_2,'separated_',char(titlestr),'.xlsx');
[~]=fromTimetabletoExcel(ttSeparation,output_filename_2);

%画图看Raw和分出的Baseline，并保存
%画图
figure(m)
h=plot(ttSeparation.Date_Time,ttSeparation.BC6_,'-b',...
    'LineWidth',0.3,...
    'MarkerSize',0.1);
datetick('x',26,'keepticks'); 
set(h,'Color',[0,0.749,1]);
set(gcf,'unit','centimeters','position',[0.01 5 33.3 12]) ;
hold on
h2=plot(ttSeparation.Date_Time,ttSeparation.BC6_15min,...
    'LineWidth',0.3,...
    'MarkerSize',0.1);
datetick('x',26,'keepticks'); 
legend('BC raw','BC baseline')
title(titlestr);
%输出保存
Name_string=strcat(outputstr,titlestr,'_Raw_vs_Baseline');
Full_Name_string=strcat(char(Name_string),'.jpg');
print(m,'-djpeg','-r600',Full_Name_string); 
saveas(m,strcat(char(Name_string),'.fig'));
end