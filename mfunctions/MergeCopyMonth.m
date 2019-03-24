function[aaa]=MergeCopyMonth()
mkdir D:\BC_Figures\data\BC_4_merge\Temp_Month\Fulltime
cd D:\BC_Figures\data\BC_3_DetectionLimit\BC_Detected\Fulltime
dir;
filepath=dir;
filenum=size(dir);
destiny='D:\BC_Figures\data\BC_4_merge\Temp_Month\Fulltime';
for p=3:filenum
copyfile(filepath(p).name,destiny)
end

mkdir D:\BC_Figures\data\BC_4_merge\Temp_Month\RMmissing
cd D:\BC_Figures\data\BC_3_DetectionLimit\BC_Detected\RMmissing
dir;
filepath=dir;
filenum=size(dir);
destiny2='D:\BC_Figures\data\BC_4_merge\Temp_Month\RMmissing';
for p=3:filenum
copyfile(filepath(p).name,destiny2)
end

aaa=1;
end