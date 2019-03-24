function[N]=StatisticalCalculationXls(BC6,partb,Filepath)
diffseanum=1;
stat=cell(diffseanum,7);
[Size,Mean,Std,Median,Max,Min] = deal(zeros(diffseanum,1));
n=diffseanum;
    Name(n,1)=cellstr(extractBefore(partb,'.'));
    Size(n,1)=length(BC6);
    Mean(n,1)=nanmean(BC6);
    Std(n,1)=nanstd(BC6);
    Median(n,1)=nanmedian(BC6);
    Max(n,1)=nanmax(BC6);
    Min(n,1)=nanmin(BC6);
stat(:,1)=Name(:,1);
stat(:,2)=num2cell(Size(:,1));
stat(:,3)=num2cell(Mean(:,1));stat(:,4)=num2cell(Std(:,1));
stat(:,5)=num2cell(Median(:,1));stat(:,6)=num2cell(Max(:,1));stat(:,7)=num2cell(Min(:,1));
%把统计结果导出成xlsx或者txt文件
M={'Time' 'Number' 'Mean' 'Std' 'Median' 'Max' 'Min'};
N=cell(diffseanum+1,7);
N(1,:)=M;
%xlsyearstr=num2str(yy(1));
  newpath=extractBefore(partb,'.');  
Seasonstr=char(newpath);
xlsfilename=strcat('D:\BC_Figures\output\xls\',Filepath,'\',Seasonstr,'_StatAnalysis.xlsx');


for i=1:diffseanum
N(i+1,1:end)=stat(i,:);
end
xlswrite(xlsfilename,N);
end
