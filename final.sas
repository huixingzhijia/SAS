data a ;
input id age;
datalines;
15 68 
98 60 
20 72 
28 75 
13 63 
;
run;
data b;
input id age gender$;
datalines;
15 18 M
98 60 F
20 72 M
80 75 M
13 63 F
;
run;
proc sort data=a;
by id;
run;
proc sort data=b;
by id;
run;
data c;
set a b;
by id;
run;



