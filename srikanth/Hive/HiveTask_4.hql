//Task4_ Xml data

ADD JAR /home/orienit/Downloads/hivexmlserde-1.0.0.0.jar

use kalyan;

create table if not exists kalyan.employee4_xml(empid int,name string,salary int,dept string ,address string,pincode bigint,address2 string,pincode2 bigint )
row format serde 'com.ibm.spss.hive.serde2.xml.XmlSerDe'
WITH SERDEPROPERTIES (
"column.xpath.empid"="/employee/empid/text()",
"column.xpath.name"="/employee/name/text()",
"column.xpath.salary"="/employee/salary/text()",
"column.xpath.dept"="/employee/dept/text()",
"column.xpath.address"="/employee/details[1]/address[1]/text()",
"column.xpath.pincode"="/employee/details[1]/pincode[1]/text()",
"column.xpath.address2"="/employee/details[2]/address[1]/text()",
"column.xpath.pincode2"="/employee/details[2]/pincode[1]/text()"
)
STORED AS
INPUTFORMAT 'com.ibm.spss.hive.serde2.xml.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
TBLPROPERTIES (
"xmlinput.start"="<employee>",
"xmlinput.end"="</employee>"
);

load data local inpath '/home/orienit/Downloads/hive/employee4.xml' into table kalyan.employee4_xml;

select *from employee4_xml where empid > 2 and (address ="hyderabad" or address = "banglore");

create table if not exists kalyan.employee4_op as select *from employee3_xml where empid > 2 and dept = "dev";


