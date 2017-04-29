libname ORES555 'D:\courses\summer courses for sas\final';
proc format;
value $genderfmt  '1'='male'
                 '2'='female'
                 '0'='unknown';
value $racefmt   '1'= 'Caucasian'
                 '2' = 'African American'
                 '5' =' Asian'
                 'U '= 'Unknown';
run;
data demo;
infile 'D:\courses\summer courses for sas\final\demo.dat';
input id gender$  race$;
if race = '5' or race = 'U' then race= 'other';
format gender genderfmt. race  $racefmt.;
run;
proc sort data=total_paid;
by id;
run;
proc sort data=tonsil;
by id;
run;
proc sort data=notosil;
by id;
run;
proc sort data=demo;
by id;
run;

data patient_claimsa;
merge tonsil notonsil;
by id;
run;
data patient_claimsb;
set demo total_paid;
by id;
run;
data patient_claims;
merge patient_claimsa patient_claimsb;
by id;
run;
proc means data=patient_claims;
class tonsil;
var age amt_paid;
run;
