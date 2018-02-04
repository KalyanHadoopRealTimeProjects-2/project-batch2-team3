
create database if not exists kalyan;


add jar /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core-1.1.0-cdh5.12.0.jar;

add jar /home/orienit/Desktop/kalyan_jar/kalyan-bigdata-utils.jar;


drop table if exists kalyan.employee2_json;

create table if not exists kalyan.employee2_json(empid int,name string,salary int,dept string) row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' STORED AS
INPUTFORMAT 'com.orienit.kalyan.mapred.multiline.KalyanMultiLineInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
;

LOAD DATA LOCAL INPATH '/home/orienit/hive_task/employee2.json' INTO TABLE kalyan.employee2_json;

select * from kalyan.employee2_json;

drop table if exists kalyan.employee2_op;

create table kalyan.employee2_op as select * from kalyan.employee2_json where empid>2 and dept='dev';

select * from kalyan.employee2_op;





