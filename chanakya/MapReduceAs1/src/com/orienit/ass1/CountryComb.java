package com.orienit.ass1;
import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

import com.orienit.ass1.CountryS.TopCountriesMapper;
public class CountryComb {

	
	public static void main(String[] args) throws Exception{
		Configuration c=new Configuration();
		String[] files=new GenericOptionsParser(c,args).getRemainingArgs();
		Path input=new Path(files[0]);
		Path output=new Path(files[1]);
		Job j=new Job(c,"TopCountries");
		j.setJarByClass(CountryS.class);
		j.setMapperClass(TopCountriesMapper.class);
		//j.setReducerClass(ReduceForWordCount.class);
		j.setOutputKeyClass(Text.class);
		j.setOutputValueClass(Text.class);
		j.setNumReduceTasks(0);
		FileInputFormat.addInputPath(j, input);
		FileOutputFormat.setOutputPath(j, output);
		System.exit(j.waitForCompletion(true)?0:1);
		}
	
	public static class SuccessMapper extends Mapper<Text, Text,Text , Text>{

		@Override
		protected void map(Text key, Text value, Context context)
				throws IOException, InterruptedException {
		
		String line = value.toString();
		String[] words=line.split("\t");
		
		if(words[1].equals("SUCCESS"));
		{
			Text country = new Text(words[0]);
			context.write(country, new Text(words[1]));
		}
		}
	}
	
	public static class SuccessReducer extends Reducer<Text, Text, Text, Text>{

		@Override
		protected void reduce(Text country, Iterable<Text> cnt,
				Context context)
				throws IOException, InterruptedException {
			
		}
}
}
