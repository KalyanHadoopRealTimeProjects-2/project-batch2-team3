create database if not exists kalyan;

add jar /home/orienit/work/apache-hive-1.2.1-bin/hcatalog/share/hcatalog/hive-hcatalog-core-1.2.1.jar;

create table if not exists kalyan.employee1_json(empid int,name string,salary int,dept string) row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' stored as textfile;

LOAD DATA LOCAL INPATH '/media/orienit/NewVolume/project/project-batch2-kalyan.git/trunk/hive/employee1.json' INTO TABLE kalyan.employee1_json;

create table kalyan.employee1_op as select * from kalyan.employee1_json where empid>2 and dept='dev';



