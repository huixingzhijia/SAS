libname homework 'D:\courses\summer courses for sas\homework10\Data for class 10\Data for class 10';
run;
data US_converted;
set homework.US_newhire;
*remove the dash and convert it to numeric variable;
ID=compress(ID,'-');
newID=input(ID,12.);
phone=compress(telephone);
first=substr(phone,1,3);
last=substr(phone,4,4);
phone=compress(first||'-'||last);
birthdate=input(birthday,date9.);
keep newID birthdate phone;
run;
proc print data=US_converted noobs;
run;
proc contents data=US_converted;
run;

