%=====˵�������ݴ������=====%
%��������:1��BC�����ݲ�����¼����õ����ݣ�����,1min������
%         2���������ݡ�ԭʼ�������Ͻ�excel������ݣ�meteo_all��4�꣬1day������

%��������:1��Fulltime.��ȫʱ���
%         2��Separation.�õ�Baseline��BC���ݣ�
%         3��DetectionLimits.���ÿһ��ļ���ߣ������ڴ��޳�BC6�����ݡ�
%            �ڴ˻�������Hourmean����Сʱƽ����ͬʱɾ��<30���ݵ�Сʱ��ɾ��BC6>BC1��Сʱ��
%         4��������б�Ҫ��RMmissing.���п�ȱ���ж�ɾ����
%         5��Merge, getting Final data.�ֱ���������Ϊ��Year,Month,Season,Heating,Winter,Week
%         6�������������ݺ�BC����
%         7������Angstromָ��

%�������:1)�����BCСʱƽ�����ݣ���BC_3_��
%         2)��������ϵ�BCСʱƽ�����ݣ���BC_4_Merge��
%         3)���Ϻõ�BC��Meteo��ƽ�����ݣ��Լ��ϲ���ʱ�����BC_5_Meteo��
%         4)Angstromָ������������BC_6_Angstrom�С�



clear all;close all;clc;
dbstop if error;
%addpath(D:\BC_Figures\prog\mFunctions����һ�δ������ݵ�ʱ����Ҫ����һ����һ�У����ǰ��Զ��庯����ӽ�Ĭ�ϵ�����·��
%cd D:\BC_Figures\prog\mFunctions ����Ҫ����Ϊ��һ��֮���Ѿ���ӵ�·����


%[Labelcell]=createLabelcell();

%==========================================================================
%1��Fulltime.��ȫʱ���
[whether]=mkdirDetectLimit();
[struct_Fulltime]=Processing_Fulltime();
    %------restruct Fulltime------
    [struct_Fulltime]=Restruct_Fulltime();
    %-----------------------------
%ͳ�����������ȣ��۲�ʱ�θ��ǵ�Сʱ��
    [struct_RE]=Missing_Statistic(struct_Fulltime);
    
%==========================================================================
%2) Separation.�ֳ�Traffic��spike�źź������Baseline
%2017.12�Ŀ�������:struct_Fulltime(23).Timetable = removevars(struct_Fulltime(23).Timetable, 'Var70');
[whether]=mkdirSeparation();
[struct_Separated]=Processing_Separation(struct_Fulltime);
%ע��:�����fulltime�ģ���Ϊֻ��fulltime��������separate��
    %=------restruct Separated------
    [struct_Separated]=Restruct_Separated();
    %-------------------------------
    
%==========================================================================
%3) Detection limit, and Hourmean���������߲��޳����ݡ�Сʱƽ������һ��ɸѡ��
[whether]=mkdirDetectLimit();
[struct_Detected]=Processing_DetectLimit(struct_Separated);
%��һ���õ���fulltime��RMmissing��,�����ļ��С�
    %-----=restruct Detected------
    [struct_Detected]=Restruct_Detected();
    %Ŀǰ�ع�����RMmissing��,��ҪFullttime�Ļ���������������е�һ�У�������������ĺ�����
        [struct_Detected_1]=Restruct_Detected_Fulltime();
    %��֮����������ݺϲ����õ���һ���ع���struct��
    %-----------------------------

%==========================================================================
%4) Merge to get final data�����ϲ�ͬ���͵����ݣ��õ����ڷ��������ݱ�
[whether]=mkdirMergeData();
%%i)����һ��õ���[Year],[Month]
[lalala]=Processing_MergeAndSort();
     %[struct_Week struct_Year]=Processing_MergeAndSort(struct_Detected);
%ii)����һ���Ժ��ֶ��ֳ�Temp_Season,Ȼ������һ��õ�Season:��fulltime)
[aaa]=MergeSeason();
%iii)�ֶ��ֳ�Winter������(fulltime)

%iv)�ֶ��õ�Heating_2016��Ԫ�ĵ����Ž�Heating�ļ�����
%�ٷ���Ž�Temp_Heating���в������µ�Merge,�õ�[Heating]:��fulltime)
[aaa]=MergeHeating();

%�Ȱ�Month�е�all������copy��\Fulltime�£��ٰ�Month�����м���ճ�����½����ļ���\Fulltime_sorted��
%ͨ������Year,Month,Season,Winter,Heating,�������ڴ����õ�[Week]
[aaa]=MergeWeek();

%���ֶ�����һ�£�ʹÿ�����ݶ�����6������ļ����µ�\Fulltime��

%==========================================================================
%5) Daily BC, Meteo data�������������ݺ�BC���ݣ���ƽ����
[whether]=mkdirMeteoData();
%�Ȱ��������ݷָ�һ��
Meteo_data_path='D:\BC_Figures\data\Meteorology_data';
[meteo]=splitMeteoData(Meteo_data_path);
%���߲���Ҫ�����������ļ�����BC��ƥ���
move=1;
Meteo_Month_path='D:\BC_Figures\data\Meteorology_data\Meteo_Month';
if move~=1
[move]=moveNowantFile(Meteo_Month_path);
end
%Ȼ����BC���ݽ������ϣ��õ�daily����
[struct_Daily]=Processing_DailyMerge(struct_Detected);
%����ΪYear����
[aaa]=MergeMeteoDailytoYear()

%=========================================================================
%6)����õ�Angstromָ���Ľ��
[~]=mkdirAngstrom();
[aaa]=GetAngstrom();

%=========================================================================
%7)��ͼ
[~]=mkdirOutput();
[struct_BCcategory]=Output_All_New();
[~]=Output_Traffic_New();
%�ֶ���\BC Merge�н���һ��Comparison�ļ��У��Լ����ļ���
[~]=mkdirComparison();
    %��ɸѡһ��'\Comparison\Years',�ֶ���Data�����������ɾ����
%Ȼ����ÿ���ļ�����������źã�Ҫcompare�ļ�����������������һ�еĻ�ͼ����
[~]=Compare_Figures();

