function[whether]=Processing_MergeAndSort_5Meteo()

%===========================Month,Year=====================================
%for i=1:2
[struct_Detected]=restructForVamosMerge_5Meteo();
%给每个表格加入星期的列
[struct_Vamos]=MergeGetWeek_5Meteo(struct_Detected); %OK
%把含有Weekday的数据拷贝到Month里,分Fulltime和RMmissing
[aaa]=MergeTempWeek_5Meteo(struct_Vamos); %OK
[aaa]=MergeGetAll_Month_5Meteo();

%画图之前还需要整合一下，使得\Month这个根目录下就是各个excel。这样才好画图。

%放好待Merge的Temp_year,随后整合得到Year数据。分Fulltime和RMmissing
[aaa]=MergeTempYear_5Meteo(struct_Vamos);
%得到Year_all数据
[aaa]=MergeGetAll_5Meteo();
%end

%===========================Temp_Month=====================================
%把不含weekday的数据拷贝到Temp_Month里——气象这里不需要，直接手动拷贝吧hh

%[aaa]=MergeCopyMonth();
    %或者不用手动，把源文件改成：\D:\BC_Figures\data\BC_5_Meteo\Synchronized\Month
    %目标文件改成：D:\BC_Figures\data\BC_5_Meteo\Synchronized\Temp_Month

%========================Mkdir_TempSeason==================================
%[aaa]=MergeTempSeason(struct_Vamos); 在分到Temp_Season的这一步还没有调好
[bbb]=mkdirMergeTempSeason_5Meteo(struct_Vamos);
    %这步是在Struct创建一个YearseasonList并基于此创建文件夹而已
    %然后把2018Winter手动删掉吧...
    %来自MergeTempSeason，有空完善一下，看看能不能到Season也自动处理（只需要自己整理Winter,Heating,Week)

%==================放好Temp以后，得到Season================================
[aaa]=MergeSeason_5Meteo();

%iii)手动分出Winter的数据(fulltime)

%iv)手动分出Temp_Heating,然后再用以下的Merge,得到[Heating]:（fulltime)
[aaa]=MergeHeating_5Meteo();

%通过遍历Year,Month,Season,Winter,Heating,进行星期处理，得到[Week]
[aaa]=MergeWeek_5Meteo();

whether=1;
end