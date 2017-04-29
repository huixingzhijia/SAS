libname homework 'D:\courses\summer courses for sas\homework8\Data for class 8(1)\Data for class 8';
run;

data year9697;
set homework.year96 homework.year97;
run;
proc print data=year9697;
run;
