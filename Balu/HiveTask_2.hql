
//Task2_json not working

USE kalyan;
ADD JAR /home/orienit/Desktop/hive/jsonserde.jar;

DROP TABLE IF EXISTS kalyan.employee2_json;
CREATE TABLE IF NOT EXISTS kalyan.employee2_json (empid INT, name STRING, salary INT, dept STRING)
ROW FORMAT SERDE 'com.amazon.elasticmapreduce.JsonSerde'
WITH SERDEPROPERTIES ( 'paths'='empid, name, salary, dept' )
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH "/home/orienit/Desktop/hive/employee2.json" OVERWRITE INTO TABLE kalyan.employee2_json;

SELECT * FROM kalyan.employee2_json;


//Task2_xml

ADD JAR /home/orienit/Desktop/hive/hivexmlserde-1.0.0.0.jar;

DROP TABLE IF EXISTS kalyan.employee2_xml;
CREATE TABLE IF NOT EXISTS kalyan.employee2_xml (empid INT, name STRING, salary INT, dept STRING)
ROW FORMAT SERDE 'com.ibm.spss.hive.serde2.xml.XmlSerDe'
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


LOAD DATA LOCAL INPATH "/home/orienit/Desktop/hive/employee2.xml" OVERWRITE INTO TABLE kalyan.employee2_xml;
SELECT * FROM kalyan.employee2_xml;

SELECT * FROM employee2_xml WHERE empid > 2 AND dept = "dev";
