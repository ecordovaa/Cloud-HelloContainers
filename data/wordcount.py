import sys
 
from pyspark import SparkContext, SparkConf
 
if __name__ == "__main__":
	
	# create Spark context with necessary configuration
	sc = SparkContext("local","PySpark Word Count Exmaple")
	inputFile = sys.argv[1]
	
	# read data from text file and split each line into words
	words = sc.textFile("{}".format(inputFile)).flatMap(lambda line: line.split(" "))
	
	# count the occurrence of each word
	wordCounts = words.map(lambda word: (word, 1)).reduceByKey(lambda a,b:a +b)

	sortedWordCounts = wordCounts.sortBy(lambda wordCount: wordCount[1], ascending=False)
	
	# save the counts to output
	sortedWordCounts.saveAsTextFile("app/output")
