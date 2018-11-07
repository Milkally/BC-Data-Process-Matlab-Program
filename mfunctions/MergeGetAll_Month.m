function[aaa]=MergeGetAll_Month(m)
switch m
case{1}
mkdir D:\BC_Figures\data\BC_4_merge\Month\Fulltime\all
destiny='D:\BC_Figures\data\BC_4_merge\Month\Fulltime\all';
cd D:\BC_Figures\data\BC_4_merge\Month\Fulltime
dir;
filepath=dir;
filenum=size(dir)-1;
for i=3:filenum(1)
    cd_yearpath=strcat('D:\BC_Figures\data\BC_4_merge\Month\Fulltime\',filepath(i).name);
    cd(cd_yearpath);
    dir;
    filepath_year=dir;
    filenum_year=size(dir);
    for p=3:filenum_year
    copyfile(filepath_year(p).name,destiny)
    end
end

case{2}
cd D:\BC_Figures\data\BC_4_merge\Month\RMmissing
dir;
filepath=dir;
filenum=size(dir);
mkdir D:\BC_Figures\data\BC_4_merge\Month\RMmissing\all
destiny='D:\BC_Figures\data\BC_4_merge\Month\RMmissing\all';
for i=3:filenum(1)
    cd_yearpath=strcat('D:\BC_Figures\data\BC_4_merge\Month\RMmissing\',filepath(i).name);
    cd(cd_yearpath);
    dir;
    filepath_year=dir;
    filenum_year=size(dir);
    for p=3:filenum_year
    copyfile(filepath_year(p).name,destiny)
    end
end

end

aaa=1;
end
