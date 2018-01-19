//HADOOP TERMINAL

hadoop fs -mkdir /hive/tasks/inputavro
hadoop fs -put /home/orienit/Desktop/hive/student.avro /hive/tasks/inputavro
hadoop fs -text /hive/tasks/inputavro/student.avro

//HIVE TERMINAL

DROP TABLE IF EXISTS kalyan.student_avro;
CREATE TABLE IF NOT EXISTS kalyan.student_avro(name string, id int, course string, year int) STORED AS avro;

LOAD DATA INPATH '/hive/tasks/inputavro/student.avro' OVERWRITE INTO TABLE kalyan.student_avro;
SELECT * FROM kalyan.student_avro;

DROP TABLE IF EXISTS kalyan.student_avro_op;
CREATE TABLE kalyan.student_avro_op AS SELECT * FROM kalyan.student_avro WHERE id>2 AND course ="spark";
SELECT * FROM kalyan.student_avro_op;
 
 
 
 
 
