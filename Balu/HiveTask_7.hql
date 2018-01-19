//RiskFactor TABLE Creation and LOAD DATA

DROP TABLE IF EXISTS kalyan.RiskFactor;

CREATE TABLE IF NOT EXISTS kalyan.RiskFactor 
(
YearStart INT,	
YearEnd INT,
LocAbbr STRING comment 'LocationAbbr',
LocDesc STRING comment 'LocationDesc',	
Datasource STRING,
Class STRING,
Topic STRING,
Question STRING,	
Data_Value_Unit STRING,	
Data_Value_Type	 STRING,
Data_Value FLOAT,
Data_Value_Alt  FLOAT,
Data_Value_Footnote_Symbol STRING,
Data_Value_Footnote STRING,
Low_Confidence_Limit FLOAT,
High_Confidence_Limit FLOAT,	
Sample_Size INT,
Total STRING,
Age STRING comment 'AGE in Years',
Education STRING,
Gender STRING,
Income STRING,
Race_or_Ethnicity STRING,
GeoLoc STRING comment 'GeoLocation',
ClassID  STRING,
TopicID  STRING,
QuestionID STRING,
DataValueTypeID STRING,
LocID INT comment 'LocationID',
StratificationCategory1 STRING,
Stratification1 STRING,
StratificationCategoryId1 STRING,
StratificationID1 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH "/home/orienit/Desktop/hive/Behavioral_Risk_Factor_Surveillance_System.csv" OVERWRITE INTO TABLE kalyan.RiskFactor;

SELECT * FROM kalyan.RiskFactor LIMIT 5;






//PARTITIONING

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

DROP TABLE IF EXISTS kalyan.RiskFactorPartition;

CREATE TABLE IF NOT EXISTS kalyan.RiskFactorPartition 
(
YearStart INT,	
LocAbbr STRING comment 'LocationAbbr',	
Datasource STRING,
Class STRING,
Topic STRING,
Question STRING,	
Data_Value_Unit STRING,	
Data_Value_Type	 STRING,
Data_Value FLOAT,
Data_Value_Alt  FLOAT,
Data_Value_Footnote_Symbol STRING,
Data_Value_Footnote STRING,
Low_Confidence_Limit FLOAT,
High_Confidence_Limit FLOAT,	
Sample_Size INT,
Total STRING,
Age STRING comment 'AGE in Years',
Education STRING,
Gender STRING,
Income STRING,
Race_or_Ethnicity STRING,
ClassID  STRING,
TopicID  STRING,
QuestionID STRING,
DataValueTypeID STRING,
LocID INT comment 'LocationID',
StratificationCategory1 STRING,
Stratification1 STRING,
StratificationCategoryId1 STRING,
StratificationID1 STRING
)
PARTITIONED BY
(YearEnd INT, LocDesc STRING comment 'LocationDesc', GeoLoc STRING comment 'GeoLocation')
STORED AS TEXTFILE;



INSERT OVERWRITE TABLE kalyan.RiskFactorPartition PARTITION (YearEnd, LocDesc, GeoLoc) 
SELECT * FROM kalyan.RiskFactor;



//FILTER RECORDS Sample_Size>1000

DROP TABLE IF EXISTS kalyan.RiskFactorFilter1;
CREATE TABLE IF NOT EXISTS kalyan.RiskFactorFilter1 AS SELECT * FROM kalyan.RiskFactor WHERE Sample_Size>1000;

SELECT * FROM kalyan.RiskFactorFilter1 LIMIT 5;





