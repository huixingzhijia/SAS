*Write the code so open and view the dataset within SAS,using a libaname statement to import the sas file;
libname lucky  'D:\courses\summer courses for sas\homework6\data for class 6';
proc format;
	value yn 0 = 'no'
	    	 1 = 'yes';
	value race 1 = 'black'
	           2 = 'other'
			   3 = 'white';
	value rage -1 = 'age unknown'
	            1 = '0-17 years'
				2 = '18-30 years'
				3 = '31-45 years'
				4 = '46-60 years'
				5 = '>60 years';
	value bt -1 = 'Unknown'
			  1 = 'A'
			  2 = 'B'
			  3 = 'AB'
			  4 = 'O';
	value pmt -1 = 'Unknown'
			   1 = 'private'
			   2 = 'public';
	value dage  1 = '0-17 years'
				2 = '18-39 years'
				3 = '40-49 years'
				4 = '50-59 years'
				5 = '60-69 years'
				6 = '>=70 years';
	run;

data kidney;
	set lucky.kidney_tx;
	format d_bt bt bt. d_race race race. d_age_cat dage. pay pmt. age_cat rage. 
	 ANGINA male college working diabetes copd htn cvd pvd bmi_miss und_wt nl_wt 
	 over_wt obes_wt live_donor d_male d_htn d_diabetes d_tatt retx caus_pkd caus_dm1
	 caus_dm2 caus_h caus_ukn caus_other dead gr_fail yn.;
run;
*Run a chi-square test on the variables race and male;
proc freq data=kidney;
table race*male/chisq;
run;
*Run a t-test on dialysis durations (dial_dur) by gender (male).  ;
proc ttest data=kidney;
class male;
var dial_dur;
run;
*Run a t-test on dialysis durations (dial_dur) by transplant failure (gr_fail). ;
proc ttest data=kidney;
class gr_fail;
var dial_dur;
run;
*7.	Run a non-parametric test on length of stay (LOS) by gender (male)
Wilcoxon 2 sample test: P = 0.6926;
proc npar1way data = kidney wilcoxon;
	class male;
	var los;
run;

*Is the mean number of days spent on the wait list (wl_days) equal to 1.5 years;
proc univariate data=kidney mu0=547.5;
var wl_days;
run;
*median number of days spent on the wait list (wl_days) equal to 1.5 years, 
The student's t test is parametric analysis. 
The signed ranks and sign test are both non-parametric test;
proc univariate data=kidney mu0=547.5;
var wl_days;
run;
*Run a proc ANOVA to test if there is a difference in waitlist time (wl_days) by race;
proc anova data=kidney;
class race;
model wl_days=race;
run;
*So we run levene's test and Bonferroni post-hoc test. There is a a difference in waitlist time (wl_days) by race.;
proc anova data=kidney;
class race;
model wl_days=race;
means race/bon hovtest;
run;
*Use Proc REG to see we can predict time to graft failure (gf_time) 
from wait list days (wl_days),  male, retransplant (retx), donor age (d_age) and recipient age (age).  ;
proc corr data=kidney;
 var wl_days  gf_time;
run;

*Use Proc REG to see we can predict time to
graft failure (gf_time) from wait list days (wl_days),  male, retransplant (retx), donor age (d_age) and recipient age (age);
proc reg data=kidney;
model gf_time=wl_days male retx d_age age;
run;
*Use PROC GLM to run the same analysis you did for question 12;
proc glm data=kidney;
	class male retx;
	MODEL gf_time = wl_days male retx d_age age;
run;
*Use PROC GLM to run a two way anova using the variables time on the waitlist (wl_days), race, and male.  Include the interaction term;
proc glm data=kidney;
class   male race;
model wl_days= race male
               race*male;
run;








