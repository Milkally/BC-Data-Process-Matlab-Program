function[struct_Fulltime]=Processing_Fulltime()
mkdir D:\BC_Figures\data\BC_2_separation\BC_fulltime
cd 'D:\BC_Figures\data\BC_1_raw\BC_month_raw';
dir;
filepath=dir;
filenum=size(dir);

datapath='D:\BC_Figures\data\BC_1_raw\BC_month_raw\';
for p=3:filenum
read_data_name=strcat(datapath,filepath(p).name);
may0=readtable(read_data_name);
may1=table2timetable([may0(:,1:2),may0(:,4:end)]);
a=size(may1,1);b=size(may1,2); 

dat_1=datevec(may1.Date_Time);
yy=dat_1(:,1);mm=dat_1(:,2);dd=dat_1(:,3); hh=dat_1(:,4);
tv = [datetime(yy(1),mm(1),1,0,0,0):hours(1/60):datetime(yy(1),mm(1),dd(a-1),23,59,00)]';
ttFull = retime(may1,tv);

struct_Fulltime(p-2)=struct('Timetable',ttFull,'BC6',ttFull.BC6_);

output_path_1='D:\BC_Figures\data\BC_2_separation\BC_fulltime\';
output_filename_1=strcat(output_path_1,'fulltime_',extractBefore(extractAfter(filepath(p).name,'raw_'),'.xlsx'));
[whether]=fromOriginTimetabletoExcel(ttFull,output_filename_1);
end
end

