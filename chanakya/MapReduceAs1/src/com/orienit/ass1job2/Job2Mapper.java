package com.orienit.ass1job2;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class Job2Mapper extends Mapper<LongWritable, Text, Text, IntWritable> {

	@Override
	protected void map(LongWritable key, Text value,
			Context context)
			throws IOException, InterruptedException {
		String line = value.toString();
		System.out.println("Line: " + line);
		String[] words = line.split("\\t");
		Text country = new Text(words[0]);
		int status = Integer.parseInt(words[1]);
		IntWritable st = new IntWritable(Integer.valueOf(status));
		
		context.write(country, st);
	}

}
