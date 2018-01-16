
create database if not exists kalyan;
use kalyan;

add jar /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar;

create table if not exists kalyan.employee1_json ( empid int, name string, salary string, dept string )
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe' 
LOCATION '/hive/task1_json'
Stored as textfile;

//file LOCATION must be represents in the form of FOLDER not a file in HDFS

create external table kalyan.employee1_op as select * from kalyan.employee1_json where empid>2 and dept='dev';
select * from kalyan.employee1_op;



