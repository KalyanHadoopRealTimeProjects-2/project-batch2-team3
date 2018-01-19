
//HADOOP TERMINAL

parquet-tools schema /home/orienit/Desktop/hive/student.parquet

//OUTPUT CONSOLE FOR PARQUET FILE SCHEMA EVOLUTION

message hive_schema {
  optional binary name (UTF8);
  optional int32 id;
  optional binary course (UTF8);
  optional int32 year;

  
//HIVE TERMINAL

DROP TABLE IF EXISTS kalyan.student_parquet;

CREATE TABLE kalyan.student_parquet(name STRING, id INT, course STRING, year INT)
ROW FORMAT SERDE 'parquet.hive.serde.ParquetHiveSerDe'
STORED AS
INPUTFORMAT 'parquet.hive.DeprecatedParquetInputFormat'
OUTPUTFORMAT 'parquet.hive.DeprecatedParquetOutputFormat';


LOAD DATA LOCAL INPATH "/home/orienit/Desktop/hive/student.parquet" OVERWRITE INTO TABLE kalyan.student_parquet;

SELECT * FROM kalyan.student_parquet;

DROP TABLE IF EXISTS kalyan.student_parquet_op;
CREATE TABLE kalyan.student_parquet_op AS SELECT * FROM kalyan.student_parquet WHERE id>2 AND course = "spark";

SELECT * FROM kalyan.student_parquet_op;



