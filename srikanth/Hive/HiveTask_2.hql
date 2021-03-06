//Task2_ Xml data

create table if not exists kalyan.employee2_xml(empid int,name string,salary int,dept string)
row format serde 'com.ibm.spss.hive.serde2.xml.XmlSerDe'
WITH SERDEPROPERTIES (
"column.xpath.empid"="/employee/empid/text()",
"column.xpath.name"="/employee/name/text()",
"column.xpath.salary"="/employee/salary/text()",
"column.xpath.dept"="/employee/dept/text()"
)
STORED AS
INPUTFORMAT 'com.ibm.spss.hive.serde2.xml.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
TBLPROPERTIES (
"xmlinput.start"="<employee>",
"xmlinput.end"="</employee>"
);

load data local inpath '/home/orienit/Downloads/hive/employee2.xml' into table employee2_xml;

select *from employee2_xml where empid > 2 and dept ="dev";

load data local inpath '/home/orienit/Downloads/hive/employee1.xml' into table employee1_xml;

create table if not exists kalyan.employee2_op as select *from employee2_xml where empid > 2 and dept = "dev";


