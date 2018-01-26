//Task6_ avro data

put the data in hdfs
hdfs dfs -put /home/orienit/Downloads/student.avro /user/orienit/pig/student.avro

// then register jar piggbank 
REGISTER '/home/orienit/Downloads/avro-1.4.0.jar'

//student_avro = LOAD '/user/orienit/pig/student.avro' USING storage.avro.AvroStorage();

student_avro = LOAD '/user/orienit/pig/student.avro' USING AvroStorage ();

student_avro_op = filter employee_xml by empid > 2 and dept == 'dev';

store student_avro_op into 'hdfs://quickstart.cloudera:8020/user/orienit/pig/student_avro_op

