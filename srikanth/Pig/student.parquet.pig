//Task5 student parquet data

put the data in hdfs
hdfs dfs -put /home/orienit/Downloads/student.parquet /user/orienit/pig/student.parquet

//load the parquet file

student_parquet = LOAD '/user/orienit/pig/student.parquet' USING parquet.pig.ParquetLoader(); 

student_parquet_op = filter employee_xml by empid > 2 and dept == 'dev';

store student_parquet_op into 'hdfs://quickstart.cloudera:8020/user/orienit/pig/student_parquet_op';

