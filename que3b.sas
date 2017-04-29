libname ores 'D:\courses\summer courses for sas\lectures\lecture 5\Data for class 5\Data for class 5';
run;
data ores.lucky;
set ores.westrates2;
run;
proc means data=ores.lucky mean std maxdec=2;
var housing crime;
class state;
run;
