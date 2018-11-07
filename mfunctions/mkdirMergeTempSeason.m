function[bbb]=mkdirMergeTempSeason(struct_Vamos)
mon_num=length(struct_Vamos);
YearSeasonList=cell(1,mon_num);
for q=1:mon_num
    if str2num(struct_Vamos(q).Month)==12||str2num(struct_Vamos(q).Month)==1||str2num(struct_Vamos(q).Month)==2
    struct_Vamos(q).Season='Winter';
    else if str2num(struct_Vamos(q).Month)==3||str2num(struct_Vamos(q).Month)==4||str2num(struct_Vamos(q).Month)==5
    struct_Vamos(q).Season='Spring';
    else if str2num(struct_Vamos(q).Month)==6||str2num(struct_Vamos(q).Month)==7||str2num(struct_Vamos(q).Month)==8
    struct_Vamos(q).Season='Summer';
    else    struct_Vamos(q).Season='Fall';
        end;end;end
struct_Vamos(q).Year_Season=strcat(struct_Vamos(q).Year,struct_Vamos(q).Season);
YearSeasonList(q)=cellstr(struct_Vamos(q).Year_Season);
end
UniYearSeason=unique(YearSeasonList);
prename={'all_Spring','all_Fall','all_Summer', 'all_Winter'};
prename=[UniYearSeason prename];

for u=1:length(prename)
mkdir('D:\BC_Figures\data\BC_4_merge\Temp_Season',char(prename(u)));
end
bbb=1;
end