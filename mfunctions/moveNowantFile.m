function[whether]=moveMeteoFile(Meteo_Month_path)
%移走不想要的气象数据文件（与BC不匹配的
[num txt mov_table]=xlsread('D:\BC_Figures\data\mov_table.xlsx')
mov_desti='D:\BC_Figures\data\Meteorology_data\tmp';

for haha=1:length(mov_table)
    mov_name=strcat(Meteo_Month_path,'\',num2str(num(haha,1)),'.csv');
    movefile(mov_name,mov_desti);
end
whether=1;
end
