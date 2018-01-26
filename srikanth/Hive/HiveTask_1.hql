//Task1_ Xml data

ADD JAR /home/orienit/Downloads/hivexmlserde-1.0.0.0.jar

create table if not exists kalyan.employee1_xml(empid int,name string,salary int,dept string)
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

load data local inpath '/home/orienit/Downloads/hive/employee1.xml' into table kalyan.employee1_xml;

select *from  kalyan.employee1_xml where empid > 2 and dept = "dev";



//Task1_Json data

create database if not exists kalyan;

add jar /home/orienit/Downloads/hive-hcatalog-core-1.2.1.jar /home/orienit/spark/apache-hive-1.2.1-bin/hcatalog/share/hcatalog/hive-hcatalog-core-1.2.1.jar;

create table if not exists kalyan.employee1_json (empid int,name string,salary int,dept string)
Row Format SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
stored as textfile;

load data local inpath '/home/orienit/spark/input/hive_inputs/employee1.json' overwrite into table kalyan.employee1_json;

select *from employee1_json where empid > 2 and dept = "dev";

create table if not exists kalyan.employee1_op as select *from employee1_json where empid > 2 and dept = "dev";
