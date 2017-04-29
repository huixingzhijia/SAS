PROC IMPORT OUT= ORES555.SURVEY 
            DATAFILE= "D:\courses\summer courses for sas\homework1\sas.x
lsx" 
            DBMS=EXCELCS REPLACE;
     RANGE="Sheet1$"; 
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
