libname homework 'D:\courses\summer courses for sas\lectures\lecture 9\data for class 9\data for class 9';
run;
data speed2;
set homework.speed;
array contrib{5} x1-x5;
array lx{5};
do i=1 to 5;
   lx{i}=LOG(contrib{i});
   output;
end;
drop i ;
array y{3} y1-y3;
array sy{3};
do i=1 to 3;
   sy{i}=(y{i})**0.5;
   output;
   drop i ;
   end;
run;
