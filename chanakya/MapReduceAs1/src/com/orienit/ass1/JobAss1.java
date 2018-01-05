package com.orienit.ass1;



import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

public class JobAss1 implements Tool{

	private Configuration conf;
	
	@Override
	public Configuration getConf() {
		// TODO Auto-generated method stub
		return conf;
	}

	@Override
	public void setConf(Configuration conf) {
		this.conf=conf;
	}

	@Override
	public int run(String[] args) throws Exception {
		Job CountryStatus = new Job(getConf());

		// setting the job name
		CountryStatus.setJobName("Country Status Job");

		// to call this as a jar
		CountryStatus.setJarByClass(this.getClass());

		// setting custom mapper class
		CountryStatus.setMapperClass(MapperAss1.class);

		// setting custom reducer class
		//.setReducerClass(WordCountReducer1.class);

		// setting custom combiner class
		// wordCountJob.setCombinerClass(WordCountReducer.class);

		// setting no of reducers
		CountryStatus.setNumReduceTasks(0);

		// setting custom partitioner class
		// wordCountJob.setPartitionerClass(WordCountPartitioner.class);

		// setting mapper output key class: K2
		CountryStatus.setMapOutputKeyClass(Text.class);

		// setting mapper output value class: V2
		CountryStatus.setMapOutputValueClass(Text.class);

		// setting final output key class: K3
		//CountryStatus.setOutputKeyClass(Text.class);

		// setting final output value class: V3
		//CountryStatus.setOutputValueClass(LongWritable.class);

		// setting the input format class ,i.e for K1, V1
		CountryStatus.setInputFormatClass(TextInputFormat.class);

		// setting the output format class
		CountryStatus.setOutputFormatClass(TextOutputFormat.class);

		// setting the input file path
		FileInputFormat.addInputPath(CountryStatus, new Path(args[0]));

		// setting the output folder path
		FileOutputFormat.setOutputPath(CountryStatus, new Path(args[1]));

		Path outputpath = new Path(args[1]);
		// delete the output folder if exists
		outputpath.getFileSystem(conf).delete(outputpath, true);

		// to execute the job and return the status
		return CountryStatus.waitForCompletion(true) ? 0 : -1;


	}

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
				int status = ToolRunner.run(new Configuration(), new JobAss1(), args);

				System.out.println("My Status: " + status);
	}

}
