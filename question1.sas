libname homework 'D:\courses\summer courses for sas\homework8\Data for class 8(1)\Data for class 8';
run;
proc sort data=homework.class_list;
by id;
run;
proc sort data=homework.test_scores;
by id;
run;
proc contents data=homework.test_scores;
run;
data class_test;
merge homework.class_list homework.test_scores;
by id;
run;
proc print data=class_test(obs=5);
var name;
run;

