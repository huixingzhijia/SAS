libname ores 'D:\courses\summer courses for sas\lectures\lecture 5\Data for class 5\Data for class 5';
run;
data ores.lucky;
set ores.westrates2;
run;
proc means data=ores.lucky;
var housing crime;
run;
/*proc print data=ores.lucky_sort label;
var city state housing crime;
title1 ' Western Cities and Their Scores';
title2 'Housing and crime';
footnote1 'Lower Scores are Better';
label housing=housing score
      crime=crime score;
run;*/
