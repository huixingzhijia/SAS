libname homework 'D:\courses\summer courses for sas\homework8\Data for class 8(1)\Data for class 8';
run;
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
proc print data=plangymmoney;
run;
data male female;
set plangymmoney;
average=mean(vault,floor,p_bar);
drop average;
if gender = 'M' then output male;
if gender='F' then output female;
run;
proc print data=male;
run;
proc print data=female;
run;
