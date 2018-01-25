ADD JAR /home/orienit/Desktop/hive/hivexmlserde-1.0.0.0.jar;

USE kalyan;

DROP TABLE IF EXISTS kalyan.employee4_xml;
CREATE TABLE IF NOT EXISTS kalyan.employee4_xml(empid INT, name STRING, salary INT, dept STRING, address STRING, pincode BIGINT, address2 STRING, pincode2 BIGINT)
ROW FORMAT SERDE 'com.ibm.spss.hive.serde2.xml.XmlSerDe'
WITH SERDEPROPERTIES (
"column.xpath.empid"="/employee/empid/text()",
"column.xpath.name"="/employee/name/text()",
"column.xpath.salary"="/employee/salary/text()",
"column.xpath.dept"="/employee/dept/text()",
"column.xpath.address"="/employee/details[1]/address/text()",
"column.xpath.pincode"="/employee/details[1]/pincode/text()",
"column.xpath.address2"="/employee/details[2]/address/text()",
"column.xpath.pincode2"="/employee/details[2]/pincode/text()"
)
STORED AS
INPUTFORMAT 'com.ibm.spss.hive.serde2.xml.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
TBLPROPERTIES (
"xmlinput.start"="<employee>",
"xmlinput.end"="</employee>"
);

LOAD DATA LOCAL INPATH "/home/orienit/Desktop/hive/employee4.xml" OVERWRITE INTO TABLE kalyan.employee4_xml;

SELECT * FROM kalyan.employee4_xml;

SELECT * FROM employee4_xml WHERE empid =1 AND address ="hyderabad";