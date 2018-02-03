#Configuration file for twitter data
TwitterAgent.sources = Twitter 
TwitterAgent.channels = MemChannel 
TwitterAgent.sinks = HDFS
  
# Describing/Configuring the source 
TwitterAgent.sources.Twitter.type = org.apache.flume.source.twitter.TwitterSource
TwitterAgent.sources.Twitter.consumerKey=jC3EnPGMtIpWivwt0wXDTBbzT
TwitterAgent.sources.Twitter.consumerSecret=ThHTvV2RlZ9yNCvZcs6kRvAZTkYD0ehSsns1BdzV91DwnNHFpS
TwitterAgent.sources.Twitter.accessToken=959444587033931776-yYo5Ba8a9Rj5O1SM6rD2aT6OhAsJVAu
TwitterAgent.sources.Twitter.accessTokenSecret=mYcIdbNKnlXGoFirYt0I1CFLWTVZw0Aw9sbu5b5ycfc0R
TwitterAgent.sources.Twitter.maxBatchSize = 50000
TwitterAgent.sources.Twitter.maxBatchDurationMillis = 100000
TwitterAgent.sources.Twitter.keywords=hadoop, bigdata, mapreduce, mahout, hbase, nosql
# Describing/Configuring the sink 

TwitterAgent.sinks.HDFS.channel=MemChannel
TwitterAgent.sinks.HDFS.type=hdfs
TwitterAgent.sinks.HDFS.hdfs.path=hdfs://localhost:8020/home/orienit/tweets
TwitterAgent.sinks.HDFS.hdfs.fileType=DataStream
TwitterAgent.sinks.HDFS.hdfs.writeformat=avro
TwitterAgent.sinks.HDFS.hdfs.batchSize=1000
TwitterAgent.sinks.HDFS.hdfs.rollSize=0
TwitterAgent.sinks.HDFS.hdfs.rollCount=10000
TwitterAgent.sinks.HDFS.hdfs.rollInterval=600

TwitterAgent.channels.MemChannel.type=memory
TwitterAgent.channels.MemChannel.capacity=10000
TwitterAgent.channels.MemChannel.transactionCapacity=1000

TwitterAgent.sources.Twitter.channels = MemChannel
TwitterAgent.sinks.HDFS.channel = MemChannel

#Create directory to store tweets
hadoop fs -mkdir /home/orienit/tweets

# Below command to fetch the twitter tweet data into the HDFS cluster path.
flume-ng agent -n TwitterAgent -f /home/orienit/apache-flume-1.6.0-bin/conf/twitter-flume.conf

#To check content of the data
 hadoop fs -ls /home/orienit/tweets
 
 #To view the content of the file
 hadoop fs -cat /home/orienit/tweets/FlumeData.1517593939707
