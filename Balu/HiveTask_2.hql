
DROP TABLE IF EXISTS jsonRaw;
CREATE TABLE jsonRaw (raw_data string);

LOAD DATA LOCAL INPATH "/home/orienit/Desktop/hive/employee2.json" OVERWRITE INTO TABLE jsonRaw;


DROP TABLE IF EXISTS employee2_jsononeline;
CREATE TABLE employee2_jsononeline (json_body string)
STORED AS TEXTFILE LOCATION '/hive/tasks/employee2json';


INSERT OVERWRITE TABLE employee2_jsononeline
SELECT CONCAT_WS('',COLLECT_LIST(raw_data)) AS singlelineJSON
      FROM jsonRaw;
SELECT * FROM employee2_jsononeline;



###########incomplete task2_json
we finished just flatten the input data like below


{     "empid":1,   "name":"kalyan",   "salary":10000,   "dept":"dev"}{     "empid":2,   "name":"anvith",   "salary":15000,   "dept":"testing"}{     "empid":3,   "name":"raj",   "salary":5000,   "dept":"testing"}{     "empid":4,   "name":"venkat",   "salary":20000,   "dept":"dev"}{     "empid":5,   "name":"soni",   "salary":5000,   "dept":"testing"}{     "empid":6,   "name":"rajesh",   "salary":25000,   "dept":"dev"}











  > SELECT split('oneAtwoBthreeC', '[ABC]') FROM src LIMIT 1;
  ["one", "two", "three"]
Time taken: 0.224 seconds, Fetched: 4 row(s)

add jar /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar;

CREATE TABLE IF NOT EXISTS kalyan.employee2_json (empid string, name string, salary string, dept string)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe';

INSERT OVERWRITE TABLE kalyan.employee2_json
SELECT * FROM employee2_jsononeline;





