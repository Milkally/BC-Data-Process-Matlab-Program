function[whether]=Processing_MergeAndSort()

%===========================Month,Year=====================================
for i=1:2
[struct_Detected]=restructForVamosMerge(i);
%给每个表格加入星期的列
[struct_Vamos]=MergeGetWeek(struct_Detected); %OK
%把含有Weekday的数据拷贝到Month里,分Fulltime和RMmissing
[aaa]=MergeTempWeek(struct_Vamos,i); %OK
[aaa]=MergeGetAll_Month(i);

%放好待Merge的Temp_year,随后整合得到Year数据。分Fulltime和RMmissing
[aaa]=MergeTempYear(struct_Vamos,i);
%得到Year_all数据
[aaa]=MergeGetAll(i);
end

%===========================Temp_Month=====================================
%把不含weekday的数据拷贝到Temp_Month里
[aaa]=MergeCopyMonth();
    %源文件目前是：\BC_3_DetectionLimit\BC_Detected\RMmissing
    %目标文件目前是：\BC_4_merge\Temp_Month\Fulltime以及RMmissing

%========================Mkdir_TempSeason==================================
%[aaa]=MergeTempSeason(struct_Vamos); 在分到Temp_Season的这一步还没有调好
[bbb]=mkdirMergeTempSeason(struct_Vamos);
    %这步是在Struct创建一个YearseasonList并基于此创建文件夹而已
    %然后把2018Winter手动删掉吧...
    %来自MergeTempSeason，有空完善一下，看看能不能到Season也自动处理（只需要自己整理Winter,Heating,Week)
%==========================================================================
whether=1;
end