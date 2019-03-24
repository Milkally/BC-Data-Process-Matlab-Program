function[aaa]=GetAngstrom()
str1={'Year','Month','Season','Winter','Heating','Week\All'};
%computeAngstrom(str,q),这个q的区别其实就是st2的Year目录下没有再Fulltime了，而str1有
%所以区分一下读取路径（aastr->read_data_name)要怎么写
str1={'Week\All'};
[c1]=computeAngstrom(str1,1);
str1={'Week\Plus'};
[c1]=computeAngstrom(str1,1);
%str2={'Week\Fulltime\Year','Week\Fulltime\Month',...
%    'Week\Fulltime\Season','Week\Fulltime\Winter','Week\Fulltime\Heating'};
%[c2]=computeAngstrom(str2,2);

aaa=1;
end