package com.orienit.ass1job2;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class Job2Reducer extends Reducer<Text, IntWritable, Text, IntWritable> {

	@Override
	protected void reduce(Text key, Iterable<IntWritable> value,
			Context context)
			throws IOException, InterruptedException {
		int sum = 0;
		   for(IntWritable stat : value)
		   {
		   sum += stat.get();
		   }
		context.write(new Text(key), new IntWritable(sum));
	}

}
