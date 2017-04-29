Data hw3_1;
	infile 'D:\courses\summer courses for sas\lectures\Lecture 3\Data for class 3\Data for class 3\bands.csv' dlm=',' dsd missover;
	informat band $ 30. tp mmddyy8.;
	INPUT   band $ TP  numa numb numc  numd;
	format tp mmddyy8.;
run;
proc print data=hw3_1;
sum numa;
run;
