libname ORES555 'D:\courses\summer courses for sas\final';
data clamis;
*2.a Create a SAS data set called claims;
set ores555.claims;
*2.2 proc= '42820' or proc ='42821' or proc='42825' or proc='42826';
if  proc= '42820' or proc ='42821' or proc='42825' or proc='42826' then  tonsil='1';
else if proc^= '42820' or proc ^='42821' or proc^='42825' or proc^='42826' then tonsil='0';
label proc=procedure code;
run;

proc means data=clamis mean;
class id;
var amt_paid;
output out=total_paid(drop=_type_ _freq_) mean=amtpaid_mean;
run; 
proc sort data=clamis
     out=clamis_sort;
by id tonsil;
run;
data tonsil notosil;
set  clamis_sort;
by id tonsil;
if not last.id then delete;
if tonsil='1'  then output tonsil;
if tonsil='0' then output notosil;
keep id tonsil;
run;
      
