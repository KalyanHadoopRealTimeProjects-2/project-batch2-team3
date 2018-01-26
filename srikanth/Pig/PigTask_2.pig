//Task2_ Xml data

put the data in hdfs
hdfs dfs -put /home/orienit/Downloads/employee2.xml /user/orienit/pig/employee2.xml

// then register jar piggbank 
REGISTER '/home/orienit/Downloads/piggybank-0.15.0.jar'

DEFINE XPath org.apache.pig.piggybank.evaluation.xml.XPath();

//load the xml file

emp_record = LOAD '/user/orienit/pig/employee2.xml' using org.apache.pig.piggybank.storage.XMLLoader('employee') as (employee:chararray);

B_xml = FOREACH emp_record GENERATE XPath(employee,'employee/empid'),XPath(employee,'employee/name'),XPath(employee,'employee/salary'),XPath(employee,'employee/dept');

employee_xml = foreach B_xml generate (int)$0 as empid, (chararray)$1 as name, (int)$2 as salary, (chararray)$3 as dept;

emp_xml = filter employee_xml by empid > 2 and dept == 'dev';

store emp_xml into 'hdfs://quickstart.cloudera:8020/user/orienit/pig/employee2Xml_op';



// Task2_Json data

