

-----------------------------------------
create database if not exists kalyan;

select * from kalyan.student_avro;

drop table if exists kalyan.student_avro_op;

create table if not exists kalyan.student_avro_op as select * from kalyan.student_avro where id>2 and course='spark';

select * from kalyan.student_avro_op;
 
// hadoop terinal 

----->to find schema and store into sch directory as avrost.avsc

avro-tools getschema hdfs://quickstart.cloudera:8020/usr/task1/student.avro > avrost.avsc
hdfs dfs -put avrost.avsc /usr/sch

-----------------------------------------------------------
create database if not exists kalyan;
drop table if exists kalyan.student_avro;
add jar /usr/lib/hive/lib/hive-serde-1.1.0-cdh5.12.0.jar;
CREATE external TABLE kalyan.student_avro
  ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
  STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
  OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
  location '/usr/task1'
  TBLPROPERTIES ('avro.schema.url'='/usr/sch/avrost.avsc');
describe formatted kalyan.student_avro;
select * from kalyan.student_avro;



-----> output


drop table if exists kalyan.student_avro_op;
create table if not exists kalyan.student_avro_op as select * from kalyan.student_avro where id>2 and course='spark';
select * from kalyan.student_avro_op;

	



	
	
	
	
	



