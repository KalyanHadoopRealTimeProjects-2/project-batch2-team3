***************
Task1:
***************
hdfs dfs -mkdir -p nosql;
hdfs dfs -put /home/orienit/NOSQL/Inputs/employee1.tsv /user/orienit/nosql/employee1.tsv

create 'employee1_tsv', 'cf'

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.columns=HBASE_ROW_KEY,cf:name,cf:salary,cf:dept 'employee1da_tsv' /user/orienit/nosql/employee1da.tsv

scan 'employee1da_tsv' ,{ FILTER => \"(SingleColumnValueFilter('Details','dept',!=, 'binary:testing'))} AND (QualifierFilter (=, 'binary:salary'))\"}" |hbase shell |grep 25000 |awk '{print $1}'

import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter. Filter;

scan 'employee1da_tsv', {FILTER => "SingleColumnValueFilter('cf', 'dept', =, 'binary:dev') AND (PrefixFilter('4')) AND ColumnPrefixFilter('name')"}

--------scanning emp > 2 is pending----------------