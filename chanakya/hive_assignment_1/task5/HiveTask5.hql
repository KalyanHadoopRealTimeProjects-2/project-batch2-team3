


CREATE TABLE IF NOT EXISTS kalyan.employee
( name string, id int , course string, year int ) STORED AS PARQUET location '/usr/task';

select * from kalyan.employee;

drop table if exists kalyan.student_parquet;

CREATE TABLE IF NOT EXISTS kalyan.student_parquet
( name string, id int , course string, year int )
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS 
INPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat';


INSERT OVERWRITE TABLE kalyan.student_parquet SELECT * from kalyan.employee;

select * from kalyan.student_parquet;

drop table if exists kalyan.student_parquet_op;

create table if not exists kalyan.student_parquet_op as select * from kalyan.student_parquet where id>2 and course='spark';

select * from kalyan.student_parquet_op;



