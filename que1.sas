libname homework 'D:\courses\summer courses for sas\homework10\Data for class 10\Data for class 10';
run;
data bodyfat;
set homework.bodyfat2;
sample=rannor(50);
if sample le 0.0139855;
density_round=round(density,0.01);
weight_round=floor(weight);
height_round=ceil(height);
fatpermeth1=int(mean(fatpct1));
fatpermeth2=int(mean(fatpct1));
run;
proc freq data=bodyfat;
table sample;
run;
proc univariate data=bodyfat;
var sample;
run;
