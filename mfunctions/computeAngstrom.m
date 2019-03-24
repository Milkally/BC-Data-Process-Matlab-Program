function[aaa]=computeAngstrom(str,q)

mkdir 'D:\BC_Figures\data\BC_4_merge\Traffic'
for k=1:size(str,2)
Filepath=char(str(k));
%aastr=strcat('D:\BC_Figures\data\BC_4_merge\Comparison\',Filepath);
switch q
    case{1}
aastr=strcat('D:\BC_Figures\data\BC_4_merge\',Filepath,'\Fulltime');

    case{2}
aastr=strcat('D:\BC_Figures\data\BC_4_merge\',Filepath);
end

cd(aastr)
dir;
filepath=dir;
filenum=size(dir);
%wenjian=filenum(1)-2;

create_str1=strcat('D:\BC_Figures\data\BC_4_merge\Traffic','\',Filepath,'\Fulltime');
create_str2=strcat('D:\BC_Figures\data\BC_4_merge\Traffic','\',Filepath,'\RMmissing');
mkdir (create_str1)
csvstr1=strcat(create_str1, '\csv');xlsxstr1=strcat(create_str1, '\xlsx');
mkdir (csvstr1);mkdir (xlsxstr1);

mkdir (create_str2)
csvstr2=strcat(create_str2, '\csv');xlsxstr2=strcat(create_str2, '\xlsx');
mkdir (csvstr2);mkdir (xlsxstr2);

for p=3:filenum
    parta=strcat(aastr,'\');
    %partb=filepath(p).name;
   partb=strcat(extractBefore(filepath(p).name,'.'),'.xlsx');
read_data_name=strcat(parta,partb);
Datastr=extractBefore(partb,'.xlsx');
 
may0=readtable(read_data_name);
may1=table2timetable(may0);
a=size(may1,1);b=size(may1,2); 
 
tt=may1.Date_Time;
dat_1=datevec(may1.Date_Time);

BC6=may1.BC6_AFDT/1000;
BC1=may1.BC1_AFDT/1000;

sigma_air_370=18.47;
sigma_air_880=7.77;

babs370=BC1*sigma_air_370;
babs880=BC6*sigma_air_880;

index1=880/370;
index2=(880/370)^2;

traffic=zeros(size(BC1,1),1);
for i=1:size(BC1,1)
traffic(i)=(babs880(i)*index2-babs370(i))/(babs880(i))/(index2-index1);
end

may1.traffic=traffic;
may2=rmmissing(may1);

outputfilename1=strcat(xlsxstr1,'\',Datastr);
[tt,sizeofTimetable,T1,N1,whether]=fromTimetabletoExcel(may1,outputfilename1);
[tt,sizeofTimetable,T1]=fromTimetabletoCsv(may1,create_str1,Datastr);

outputfilename2=strcat(xlsxstr2,'\',Datastr);
[tt,sizeofTimetable,T1,N1,whether]=fromTimetabletoExcel(may2,outputfilename2);
[tt,sizeofTimetable,T1]=fromTimetabletoCsv(may2,create_str2,Datastr);
%[tt,sizeofTimetable,T1,N1,whether]=fromTimetabletoBoth(TimeTable,outputfilename)
end

end

aaa=1;
end
