libname project 'D:\courses\summer courses for sas\project';
run;
proc format;
value  Genderfmt   1 = 'male' 
                   2 = 'female';
value  Maritalfmt  1 = 'never married'
                   2 = 'married'
                   3 = 'divorced'    
                   4 = 'separated'
                   5 = 'widowed';
value edufmt       1 = 'less than high school'
                   2 = 'some high school '
                   3 = 'finish high school'
				   4 = 'some college'
                   5 = 'finished bachelor degree'
                   6 = 'finished master degree'
                   7 = 'finished doctorate';
value employfmt    1 = 'full time'
                   2 =' part time '
                   3 = 'unemployed'
                   4 = 'retired'
                   5 =' house-person'
                   6 = 'in school'
                   7 = 'other';
value relfmt       1 = 'Protestant'
                   2 = 'Catholic'
                   3 = 'Jewish'
                   4 = 'none'
                   5,6 = 'other';
value yesnofmt     1 = 'yes'
                   2 =' no';
value ynfmt        0= 'no'
                   1='yes';
value healthfmt    1 = 'excellent'
                   2 = 'good'
                   3 = 'fair'
                   4 = 'poor'; 
value depress      1='depress'
                   2='non-depress';
run;

/*proc contents data=project.project;
run;*/
*import the data first and create the sas data file, since it was space delimited, we just put the variable in we don't need postion controller;

data project.project;
infile 'D:\courses\summer courses for sas\project\project.txt';
input  id gender age martial education employment income religion statement1-statement20   
       drink health regdoctor treat beddays acuteill chronicill/*(*/;
CSED=sum(of statement1-statement20)/*use of statement without it will go to the difference*/;
if csed ge 16 then depress_stat=1;
else if csed lt 16 then depress_stat=2;
run;
*run a proc contents to see how the data coded;
proc contents data=project.project;
run;

* In this one, to run proc freq for categorical variable to see if there is missing values also help us to know how many subjects and its frequecy;
proc freq data=project.project;
table    gender martial education employment religion statement1-statement20   
         drink health regdoctor treat beddays acuteill chronicill;
run;

*run a proc univariate for continuous to see if there is a missing value and its distribution also help us to know the mean value of age
and mean value of income;

proc univariate data=project.project;
var age income;
run;

*set another data set so if we change something we can change only temporary data;
data project;
set project.project;
*use format statement to format variables;
format depress_stat depress.    gender genderfmt. 
       health healthfmt.  drink regdoctor treat  yesnofmt.  
       beddays acuteill chronicill ynfmt. education edufmt.
      employment employfmt. religion relfmt. martial Maritalfmt.;

*label some variables so we can see clearly;

label csed=depress status
      regdoctor=have regular doctor
      beddays=spend entire days in the bed
	  acuteill= acute illness
	  chronicill=chronic illness;

* drop the statement1-20 since there is no need to use then;
drop statement1-statement20 ;
run;

*for continuous variable like age, usually it was normally distributed we process proc t-test;

proc ttest data=project;
class depress_stat;
var age;
run;

* for variable like income, it was normally distributed, we usually use nonparamatric one way and from this step we
can get the p-value;
proc npar1way data=project wilcoxon;
class depress_stat;
var  income;
run;
* run proc means step help us get the mean value for depress and non-depress;
proc means data=project;
class depress_stat;
var income;
run;

*use proc freq for chi-square test;
proc freq data=project;
/*table  gender*depress_stat martial*depress_stat education*depress_stat employment*depress_stat  religion*depress_stat  drink*depress_stat
        health*depress_stat regdoctor*depress_stat treat*depress_stat beddays*depress_stat acuteill*depress_stat chronicill*depress_stat /chisq;
run;*/
*a shortcut for running multiple tables;
table (gender age martial education employment religion drink health regdoctor treat beddays acuteill  chronicill)*depress_stat/chisq; 
run;
