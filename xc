https://drive.google.com/file/d/0Bxr27gVaXO5sUjd2RWFQS3hQQUE/view

agent1.sources = mysrc
agent1.sinks = hdfsdest
agent1.channels = mychannel

                                                                                                                                                                                                             
agent1.sources.mysrc.type = exec
agent1.sources.mysrc.command = hadoop dfs -put /home/acadgild/StatewiseDistrictwisePhysicalProgress.xml /flume_import

                                                                                                                                                                                                                             
agent1.sinks.hdfsdest.type = hdfs
agent1.sinks.hdfsdest.hdfs.path = hdfs://localhost:9000/flume_import
                                                                                                                                                                                         
agent1.channels.mychannel.type = memory                                                                                                                                        
                                                                                                                                                                                              
agent1.sources.mysrc.channels = mychannel
agent1.sinks.hdfsdest.channel = mychannel
