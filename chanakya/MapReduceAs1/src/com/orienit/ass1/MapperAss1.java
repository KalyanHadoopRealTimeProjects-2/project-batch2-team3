package com.orienit.ass1;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class MapperAss1 extends Mapper<LongWritable, Text, Text, Text>{

	@Override
	protected void map(LongWritable key, Text value,
			Context context)
			throws IOException, InterruptedException {
	 String line = value.toString();
	 String[] words = line.split("|");
	 Text country = new Text(words[2]);
	 Text status = new Text(words[3]);
	 context.write(country, status);
		
	} 

}
