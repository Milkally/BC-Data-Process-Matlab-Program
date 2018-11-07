function[aa]=diffstr(YearSeason_str,num_uni_ys)
total_length=length(YearSeason_str);

aa=zeros(num_uni_ys,1);
final_str=cell(1,num_uni_ys);
final_str(1)=cellstr(YearSeason_str(1));

tmp_str=YearSeason_str(1);
k=1;
for i=1:total_length
    current_str=YearSeason_str(i);
    TF=strcmp(tmp_str,current_str);
if TF~=1
    if i~=total_length
    tmp_str=current_str;
    end
    aa(k+1)=i;
    final_str(k+1)=cellstr(current_str);
    k=k+1;
end
end

end
