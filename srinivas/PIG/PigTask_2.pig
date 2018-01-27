*****************************
Task_2: Solution For XML Data
*****************************
hdfs dfs -mkdir -p pig;
hdfs dfs -put /home/orienit/pig/employee2.xml /user/orienit/pig/employee2.xml

REGISTER /home/orienit/pig/piggybank-0.15.0.jar;
DEFINE XPath org.apache.pig.piggybank.evaluation.xml.XPath();

A = load '/user/orienit/pig/employee2.xml' using org.apache.pig.piggybank.storage.XMLLoader('employee') as (employee:chararray);

B = FOREACH A GENERATE XPath(employee, 'employee/empid'), XPath(employee, 'employee/name'),XPath(employee, 'employee/salary'),XPath(employee, 'employee/dept');

C = FOREACH B GENERATE (int)$0 as empid, (chararray)$1 as name, (int)$2 as salary, (chararray)$3 as dept ;

employee_op = filter C BY empid > 2 OR dept == 'dev';
employee2_op = foreach employee_op generate name;

STORE employee2_op INTO 'hdfs://quickstart.cloudera:8020/user/orienit/pig/employee2XML_op';