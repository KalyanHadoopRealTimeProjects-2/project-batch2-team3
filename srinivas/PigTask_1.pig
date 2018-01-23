******************************
Task_1: Solution For JSON Data
******************************
hdfs dfs -mkdir -p pig;
hdfs dfs -put /home/orienit/pig/employee1.json /user/orienit/pig/employee1.json

EmpRecords = LOAD '/user/orienit/pig/employee1.json' using JsonLoader ('empid:int, name:chararray, salary:int, dept:chararray');
describe EmpRecords;
dump EmpRecords;

employee_op = filter EmpRecords BY empid > 2 AND dept == 'dev';
describe employee1_op;
dump employee_op;

employee1_op = foreach employee_op generate name;

STORE employee1_op INTO 'hdfs://quickstart.cloudera:8020/user/orienit/pig/employee1JSON_op'

*****************************
Task_1: Solution For XML Data
*****************************

hdfs dfs -mkdir -p pig
hdfs dfs -put /home/orienit/pig/employee1.xml /user/orienit/pig/employee1.xml

REGISTER /home/orienit/pig/piggybank-0.15.0.jar;
DEFINE XPath org.apache.pig.piggybank.evaluation.xml.XPath();

A = load '/user/orienit/pig/employee1.xml' using org.apache.pig.piggybank.storage.XMLLoader('employee') as (employee:chararray);

B = FOREACH A GENERATE XPath(employee, 'employee/empid'), XPath(employee, 'employee/name'),XPath(employee, 'employee/salary'),XPath(employee, 'employee/dept');

C = FOREACH B GENERATE (int)$0 as empid, (chararray)$1 as name, (int)$2 as salary, (chararray)$3 as dept ;

employee_op = filter C BY empid > 2 AND dept == 'dev';
employee1_op = foreach employee_op generate name;

STORE employee1_op INTO 'hdfs://quickstart.cloudera:8020/user/orienit/pig/employee1XML_op';

