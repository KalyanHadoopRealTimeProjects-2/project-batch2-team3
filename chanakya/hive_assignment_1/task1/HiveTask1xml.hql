create database if not exists kalyan;

create table if not exists kalyan.employee1xml(line string) location '/home/orienit/hive_task;

select * from kalyan.employee1xml;
 
drop table if exists kalyan.employee1_xml;
 
create table if not exists kalyan.employee1_xml(empid int,name string,salary string,dept string)
row format delimited 
fields terminated by '\t';
 
insert into table kalyan.employee1_xml
select xpath_int(line,'employee/empid/text()'),xpath_string(line,'employee/name/text()'),xpath_int(line,'employee/salary/text()'),xpath_string(line,'employee/dept/text()') from kalyan.employee1xml;

select * from kalyan.employee1_xml;

drop table if exists kalyan.employee1_op2;

create table if not exists kalyan.employee1_op2 as select * from kalyan.employee1_xml where empid>2 and dept='dev';

select * from kalyan.employee1_op2;


