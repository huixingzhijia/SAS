libname homework 'D:\courses\summer courses for sas\lectures\lecture 9\data for class 9\data for class 9';
run;
proc sort data=homework.ques;
by id;
run;
proc format ;
value $measurement reason1= 'first measurement'
                   reason2='second measurement'
                   reason3='third measurement'
                   reason4='fourth measurement';
run;
proc transpose data=homework.ques
                 out=questran
                 name=time;
by id;  
format time $measurement.;
run;

