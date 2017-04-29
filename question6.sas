libname homework 'D:\courses\summer courses for sas\lectures\lecture 9\data for class 9\data for class 9';
run;
proc sort data=homework.thin;
by id;
run;
proc transpose data=homework.thin   out=thin_trans;
by id;    
var x; 
run;
