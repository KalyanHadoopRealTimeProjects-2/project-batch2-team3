


//impala shell

drop table if exists kalyan.student_parquet;
CREATE external TABLE kalyan.student_parquet LIKE PARQUET '/usr/task/student.parquet' STORED AS PARQUET location '/usr/task/' ;
describe kalyan.student_parquet;
select * from kalyan.student_parquet;
---------------------------------------------
// hive shell

select * from kalyan.student_parquet;
drop table if exists kalyan.student_parquet_op;
create table if not exists kalyan.student_parquet_op as select * from kalyan.student_parquet where id>2 and course='spark';
select * from kalyan.student_parquet_op;



