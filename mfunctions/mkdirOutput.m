function[aaa]=mkdirOutput()
%make new direction:BC_Figures\output\xls\
FilepathAll_1={'Year';'Month';'Season';'Week';'Heating';'Winter'};
for i=1:size(FilepathAll_1,1)
    Filepath1=char(FilepathAll_1(i));
    xlsfilepath=strcat('D:\BC_Figures\output\xls\',Filepath1);
    mkdir(xlsfilepath);
end

%make new direction:BC_Figures\output\picture\
mkdir D:\BC_Figures\output\figure

FilepathAll_2={'Box';'Distribution';'Rainbow';'Timeseries';'R_openair';'R_Trend'};
for j=1:size(FilepathAll_2,1)
    Filepath2=char(FilepathAll_2(j));
    figure_filepath=strcat('D:\BC_Figures\output\figure\',Filepath2);
    mkdir(figure_filepath);
end

mkdir D:\BC_Figures\output\figure\R_openair\Polar_plot
mkdir D:\BC_Figures\output\figure\R_openair\PolarClusters
mkdir D:\BC_Figures\output\figure\R_openair\SummaryPlot
mkdir D:\BC_Figures\output\figure\R_openair\TimeProp
mkdir D:\BC_Figures\output\figure\R_openair\TimeVariation
mkdir D:\BC_Figures\output\figure\R_openair\WindRose

aaa=1;

end