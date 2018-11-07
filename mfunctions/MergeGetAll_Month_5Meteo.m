function[aaa]=MergeGetAll_Month_5Meteo()

cd D:\BC_Figures\data\BC_5_Meteo\Synchronized\Month
dir;
filepath=dir;
filenum=size(dir);
mkdir D:\BC_Figures\data\BC_5_Meteo\Synchronized\Month\all
destiny='D:\BC_Figures\data\BC_5_Meteo\Synchronized\Month\';

for i=3:filenum(1)
    cd_yearpath=strcat('D:\BC_Figures\data\BC_5_Meteo\Synchronized\Month\',filepath(i).name);
    cd(cd_yearpath);
    dir;
    filepath_year=dir;
    filenum_year=size(dir);
    for p=3:filenum_year
    copyfile(filepath_year(p).name,destiny)
    end
end

aaa=1;
end
