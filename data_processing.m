%=====说明：数据处理程序=====%
%输入数据:1）BC。根据采样记录处理好的数据，逐月,1min步长。
%         2）气象数据。原始数据整合进excel后的数据：meteo_all，4年，1day步长。

%处理内容:1）Fulltime.补全时间表；
%         2）Separation.得到Baseline的BC数据；
%         3）DetectionLimits.求出每一天的检测线，并基于此剔除BC6的数据。
%            在此基础上做Hourmean，即小时平均。同时删除<30数据的小时；删除BC6>BC1的小时；
%         4）（如果有必要）RMmissing.把有空缺的行都删除。
%         5）Merge, getting Final data.分别整合数据为：Year,Month,Season,Heating,Winter,Week
%         6）整合气象数据和BC数据
%         7）计算Angstrom指数

%输出数据:1)处理后BC小时平均数据，在BC_3_中
%         2)按类别整合的BC小时平均数据，在BC_4_Merge中
%         3)整合好的BC和Meteo日平均数据，以及合并的时间表，在BC_5_Meteo中
%         4)Angstrom指数计算结果，在BC_6_Angstrom中。



clear all;close all;clc;
dbstop if error;
%addpath(D:\BC_Figures\prog\mFunctions）第一次处理数据的时候需要运行一下这一行，就是把自定义函数添加进默认的搜索路径
%cd D:\BC_Figures\prog\mFunctions 不需要，因为上一步之后已经添加到路径了


%[Labelcell]=createLabelcell();

%==========================================================================
%1）Fulltime.补全时间表。
[whether]=mkdirDetectLimit();
[struct_Fulltime]=Processing_Fulltime();
    %------restruct Fulltime------
    [struct_Fulltime]=Restruct_Fulltime();
    %-----------------------------
%统计数据完整度：观测时段覆盖的小时数
    [struct_RE]=Missing_Statistic(struct_Fulltime);
    
%==========================================================================
%2) Separation.分出Traffic的spike信号和区域的Baseline
%2017.12的空列问题:struct_Fulltime(23).Timetable = removevars(struct_Fulltime(23).Timetable, 'Var70');
[whether]=mkdirSeparation();
[struct_Separated]=Processing_Separation(struct_Fulltime);
%注意:结果是fulltime的，因为只有fulltime可以用来separate。
    %=------restruct Separated------
    [struct_Separated]=Restruct_Separated();
    %-------------------------------
    
%==========================================================================
%3) Detection limit, and Hourmean。计算检测线并剔除数据。小时平均并进一步筛选。
[whether]=mkdirDetectLimit();
[struct_Detected]=Processing_DetectLimit(struct_Separated);
%这一步得到了fulltime和RMmissing的,放在文件夹。
    %-----=restruct Detected------
    [struct_Detected]=Restruct_Detected();
    %目前重构的是RMmissing的,需要Fullttime的话在上面这个函数中调一行，或者运行下面的函数。
        [struct_Detected_1]=Restruct_Detected_Fulltime();
    %在之后的气象数据合并中用到这一个重构的struct。
    %-----------------------------

%==========================================================================
%4) Merge to get final data。整合不同类型的数据，得到用于分析的数据表。
[whether]=mkdirMergeData();
%%i)以下一句得到：[Year],[Month]
[lalala]=Processing_MergeAndSort();
     %[struct_Week struct_Year]=Processing_MergeAndSort(struct_Detected);
%ii)到这一步以后，手动分出Temp_Season,然后以下一句得到Season:（fulltime)
[aaa]=MergeSeason();
%iii)手动分出Winter的数据(fulltime)

%iv)手动得到Heating_2016等元文档，放进Heating文件夹中
%再分类放进Temp_Heating当中并用以下的Merge,得到[Heating]:（fulltime)
[aaa]=MergeHeating();

%先把Month中的all中所有copy到\Fulltime下，再把Month中所有剪切粘贴到新建的文件夹\Fulltime_sorted中
%通过遍历Year,Month,Season,Winter,Heating,进行星期处理，得到[Week]
[aaa]=MergeWeek();

%再手动整理一下，使每个数据都放在6个类别文件夹下的\Fulltime中

%==========================================================================
%5) Daily BC, Meteo data。整合气象数据和BC数据（日平均）
[whether]=mkdirMeteoData();
%先把气象数据分割一下
Meteo_data_path='D:\BC_Figures\data\Meteorology_data';
[meteo]=splitMeteoData(Meteo_data_path);
%移走不想要的气象数据文件（与BC不匹配的
move=1;
Meteo_Month_path='D:\BC_Figures\data\Meteorology_data\Meteo_Month';
if move~=1
[move]=moveNowantFile(Meteo_Month_path);
end
%然后与BC数据进行整合，得到daily数据
[struct_Daily]=Processing_DailyMerge(struct_Detected);
%整合为Year数据
[aaa]=MergeMeteoDailytoYear()

%=========================================================================
%6)计算得到Angstrom指数的结果
[~]=mkdirAngstrom();
[aaa]=GetAngstrom();

%=========================================================================
%7)画图
[~]=mkdirOutput();
[struct_BCcategory]=Output_All_New();
[~]=Output_Traffic_New();
%手动在\BC Merge中建立一个Comparison文件夹，以及子文件夹
[~]=mkdirComparison();
    %再筛选一下'\Comparison\Years',手动把Data不完整的年份删掉。
%然后在每个文件夹里面整理放好：要compare的几个工作表，再运行下一行的画图函数
[~]=Compare_Figures();

