
create database if not exists kalyan;
use kalyan;

add jar /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar;

create table if not exists kalyan.employee1_json (empid int, name string, salary string, dept string)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/hive/tasks/task1_json';

//file LOCATION must be represents in the form of FOLDER not a file in HDFS

create table kalyan.employee1_op as select * from kalyan.employee1_json where empid>2 and dept='dev';
select * from kalyan.employee1_op;


 
create table employee1xml(line string)
LOCATION '/hive/tasks/task1_xml';

select * from employee1xml;
 
create table employee1_xml(empid int, name string, salary string, dept string)
row format delimited 
fields terminated by '\t';
 
insert into table employee1_xml
select xpath_int(line,'employee/empid'),xpath_string(line,'employee/name'),xpath_string(line,'employee/salary'),xpath_string(line,'employee/dept')from employee1xml;
select * from employee1_xml;

create table kalyan.employee1_op2 as select * from kalyan.employee1_xml where empid>2 and dept='dev';
select * from kalyan.employee1_op2;
 
