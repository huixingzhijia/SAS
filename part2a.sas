libname ORES555 'D:\courses\summer courses for sas\final';
proc format;
value  $yesno 'No'=0
              'Yes'=1;
*Plasma glucose concentration should be dichotomized, such that a value of 140 or more is abnormal;
value $glufmt   '1'='abnormal'
                '0'='normal';
value $dbpfmt    0='normal'
                 1='pre-hypertension'
			     2='hypertension';
value $bmifmt    '0'='normal'
                 '1'='obese';
run;
data ores555.pima_diabetes;
*part2 1.a Call it pima_diabetes and store it in a permanent library called ORES555 and import it in sas;
infile 'D:\courses\summer courses for sas\final\pima-indians-diabetes.csv' dsd missover dlm=',';
input PT PGC DBP TSFT SI BMI DIPF age Test$;
run;
data pima_diabetes;
* 1c An age, glucose, DBP, triceps, insulin, or BMI value of zero isn’t a valid value;
set ores555.pima_diabetes;
where age and dbp and pgc and tsft and si and bmi ^= 0 ;
length glucose $10.  bp $18.;
*1.e1 Plasma glucose concentration should be dichotomized, such that a value of 140 or more is abnormal;
if  pgc ge 140 then glucose='1';
else if pgc lt 140 then glucose='0'; 

*1.e2 Diastolic blood pressure should be categorized;
if dbp lt 80 then bp='0';
if dbp ge 80 and dbp le 89 then bp='1';
if dbp ge 90 then bp='2'; 

*1.e3 Body mass index should also be dichotomized ;
if bmi ge 30 then bmi_sta='1';
else if bmi lt 30 then bmi_sta='0';

*part  1.b Use the above information and add labels for the variables;
label pt=Number of times pregnant
      pgc=Plasma glucose concentration 
      dbp=Diastolic blood pressure (mm Hg)
      tsft=Triceps skin fold thickness (mm)
      si=two Hours serum insulin (mu U/ml)
      bmi=Body mass index 
      dipf=Diabetes genetic pedigree function
      test=Tested positive for diabetes ;

*1d Change diabetes so that it is a numeric 0/1 variable ;
 test=propcase(test);
format   test  $yesno.  glucose  $glufmt.  bp $dbpfmt.  bmi_sta $bmifmt.;


*1f  writ code to conduct testWrite code to conduct t-tests between th
ose with diabetes and those without diabetes on Diastolic blood press
ure and Plasma glucose concentration; 
proc ttest data=pima_diabetes;
class test;
var pgc dbp;
run;
*Write code to conduct chi-square tests between t
hose with diabetes and those without diabetes on obese status and Diastolic blood pressure category.;
proc freq data=pima_diabetes;
tables bmi_sta dbp bmi_sta*dbp/chisq;
run;

