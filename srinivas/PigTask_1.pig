Task_1:
***********
hdfs dfs -mkdir -p pig;
hdfs dfs -put /home/orienit/pig/employee1.json /user/orienit/pig/employee1.json

EmpRecords = LOAD '/user/orienit/pig/employee1.json' using JsonLoader ('empid:int, name:chararray, salary:int, dept:chararray');
describe EmpRecords;
dump EmpRecords;

employee_op = filter EmpRecords BY empid > 2 AND dept == 'dev';
describe employee1_op;
dump employee_op;

employee1_op = foreach employee_op generate name;

STORE employee1_op INTO 'hdfs://quickstart.cloudera:8020/user/orienit/pig/employee1_op'