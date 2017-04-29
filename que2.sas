libname homework 'D:\courses\summer courses for sas\homework8\Data for class 8(1)\Data for class 8';
run;
proc sort data=homework.gym_scores
            out=gym_sort;
by id;
run;
proc sort data=homework.money
           out=money_sort;
by id;
run;
data gym_money;
merge gym_sort(in=ingym) money_sort;
by id;
if ingym=1;
run;
data year9697;
set homework.year96 homework.year97;
run;
proc sort data=year9697
           out=year_sort;
by id;
run;
proc sort data=gym_money
           out=gymmoney_sort;
by id;
run;
data yeargymmoney;
merge year_sort(in=inyear) gymmoney_sort(in=ingym);
by id;
if inyear=1 and ingym=1;
run;
*we need to merge by unique variable that can represent this data, such as id but if we 
only use gender it didn't work, in this case we use gender and income because they are unique;
proc sort data=homework.plan
            out=plan_sort;
by income_range gender;
run;
proc sort data=gym_money
           out=gymmoney_sort2;
by income gender;
run;
data plangymmoney;
merge plan_sort(rename=(income_range=income)) gymmoney_sort2;
by income gender;
run;
data male female;
set plangymmoney;
average=mean(vault,floor,p_bar);
drop vault floor p_var;
if gender = 'M' then output male;
if gender='F' then output female;
run;




