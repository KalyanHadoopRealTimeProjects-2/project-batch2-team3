create database if not exists kalyan;

add jar /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar;

create table if not exists kalyan.employee1_json(empid int,name string,salary int,dept string) row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' stored as textfile;

LOAD DATA LOCAL INPATH '/home/orienit/input/employee1.json' INTO TABLE kalyan.employee1_json;

select * from kalyan.employee1_json;

create table kalyan.employee1_op as select * from kalyan.employee1_json where empid>2 and dept='dev';

select * from kalyan.employee1_op;




