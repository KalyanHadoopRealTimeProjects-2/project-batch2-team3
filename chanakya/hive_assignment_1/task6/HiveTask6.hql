create database if not exists kalyan;


CREATE TABLE IF NOT EXISTS kalyan.student1
( name string, id int , course string, year int ) STORED AS AVRO location '/usr/task1';

select * from kalyan.student1;

drop table if exists kalyan.student_avro;

CREATE TABLE IF NOT EXISTS kalyan.student_avro
( name string, id int , course string, year int )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED AS 
INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat';



INSERT OVERWRITE TABLE kalyan.student_avro SELECT * from kalyan.student1;

select * from kalyan.student_avro;

drop table if exists kalyan.student_avro_op;

create table if not exists kalyan.student_avro_op as select * from kalyan.student_avro where id>2 and course='spark';

select * from kalyan.student_avro_op;


