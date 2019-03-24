function [aaa]=MergeCopyToTempSeason()
cd D:\BC_Figures\data\BC_4_merge\Month\Fulltime
dir;
filepath=dir;
filenum=size(dir);

prepath='D:\BC_Figures\data\BC_4_merge\Temp_Season\';
sea_name={'all_spring','all_summer','all_fall','all_winter'};
origin_path='D:\BC_Figures\data\BC_4_merge\Month\Fulltime\all';

cd(origin_path)
for i=1:size(sea_name,2) %¼´1£º4
destiny=strcat(prepath,sea_name(i));
  
switch i
    case{1}
        copyfile *06 destiny
    case{2}
    case{3}
    case{4}

end


end