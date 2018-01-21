
create database if not exists kalyan;

drop table if exists kalyan.RiskFactor;


create table if not exists kalyan.RiskFactor(YearStart int,YearEnd int,LocationAbbr string,LocationDesc string,Datasource string,Class string,Topic string,Question string,Data_Value_Unit string,Data_Value_Type string,Data_Value float,Data_Value_Alt float,Data_Value_Footnote_Symbol string,Data_Value_Footnote string,Low_Confidence_Limit float,High_Confidence_Limit float,Sample_Size int,Total int,Age string comment 'age in years',Education string,Gender string,Income string,Race_or_Ethnicity string,GeoLocation string,ClassID string,TopicID string,QuestionID string,DataValueTypeID string,LocationID int,StratificationCategory1 string,Stratification1 string,StratificationCategoryid1 string,StratificationID1 string)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as Textfile;


load data local inpath '/home/orienit/hive_task/Behavioral_Risk_Factor_Surveillance_System.csv' overwrite into table kalyan.RiskFactor;

select * from kalyan.RiskFactor limit 2;




set hive.exec.dynamic.partition=true;

set hive.exec.dynamic.partition.mode=nonstrict;

set hive.exec.max.dynamic.partitions=100000;
set hive.exec.max.dynamic.partitions.pernode=100000;

create table if not exists kalyan.RiskFactorPartition(YearStart int,LocationAbbr string,Datasource string,Class string,Topic string,Question string,Data_Value_Unit string,Data_Value_Type string,Data_Value float,Data_Value_Alt float,Data_Value_Footnote_Symbol string,Data_Value_Footnote string,Low_Confidence_Limit float,High_Confidence_Limit float,Sample_Size int,Total int,Age string comment 'age in years',Education string,Gender string,Income string,Race_or_Ethnicity string,ClassID string,TopicID string,QuestionID string,DataValueTypeID string,LocationID int,StratificationCategory1 string,Stratification1 string,StratificationCategoryid1 string,StratificationID1 string) partitioned by ( YearEnd int,LocationDesc string,GeoLocation string)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as Textfile;


insert overwrite table kalyan.RiskFactorPartition partition(YearEnd,LocationDesc,GeoLocation) select * from kalyan.RiskFactor;


select * from kalyan.RiskFactorPartition limit 3;

























































