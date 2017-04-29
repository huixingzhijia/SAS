libname homework 'D:\courses\summer courses for sas\lectures\lecture 9\data for class 9\data for class 9';
run;
data temperature;
input TF1-TF10;
datalines;
32 212 -40 10 20 30 40 50 60 70
-10  0  10 20 30 40 50 60 70 80
;
run;
data tem;
set temperature;
array tc{10} tf1-tf10;
    do i=1 to 10;
      tc{i}=5/9*(tc{i}-32);
    end;
	drop i;
run;
proc print data=tem noobs;
title 'listing of data set temperature';
run;
