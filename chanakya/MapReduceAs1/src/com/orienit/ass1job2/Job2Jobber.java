package com.orienit.ass1job2;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;



public class Job2Jobber implements Tool{
	 private Configuration conf;
	 
	
	@Override
	public Configuration getConf() {
		// TODO Auto-generated method stub
		return conf;
	}

	@Override
	public void setConf(Configuration conf) {
		// TODO Auto-generated method stub
		this.conf=conf;
	}

	@Override
	public int run(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Job Top10 = new Job(getConf());

		// setting the job name
		Top10.setJobName("TOP 10 success");

		// to call this as a jar
		Top10.setJarByClass(this.getClass());

		// setting custom mapper class
		Top10.setMapperClass(Job2Mapper.class);

		// setting custom reducer class
		Top10.setReducerClass(Job2Reducer.class);

		// setting custom combiner class
		// wordCountJob.setCombinerClass(WordCountReducer.class);

		// setting no of reducers
		//Top10.setNumReduceTasks(0);

		// setting custom partitioner class
		// wordCountJob.setPartitionerClass(WordCountPartitioner.class);

		// setting mapper output key class: K2
		Top10.setMapOutputKeyClass(Text.class);

		// setting mapper output value class: V2
		Top10.setMapOutputValueClass(IntWritable.class);

		// setting final output key class: K3
		Top10.setOutputKeyClass(Text.class);

		// setting final output value class: V3
		Top10.setOutputValueClass(IntWritable.class);

		// setting the input format class ,i.e for K1, V1
		Top10.setInputFormatClass(TextInputFormat.class);

		// setting the output format class
		Top10.setOutputFormatClass(TextOutputFormat.class);

		// setting the input file path
		FileInputFormat.addInputPath(Top10, new Path(args[0]));

		// setting the output folder path
		FileOutputFormat.setOutputPath(Top10, new Path(args[1]));

		Path outputpath = new Path(args[1]);
		// delete the output folder if exists
		outputpath.getFileSystem(conf).delete(outputpath, true);

		// to execute the job and return the status
		return Top10.waitForCompletion(true) ? 0 : -1;

	}

	public static void main(String[] args) throws Exception{
		int status = ToolRunner.run(new Configuration(), new Job2Jobber(), args);

		System.out.println("My Status: " + status);
	}

}
