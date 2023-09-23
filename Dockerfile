# Use a base image with Java JDK for Spark and Java compilation
FROM bde2020/spark-python-template:1.5.1-hadoop2.6

# # Environment variables
ENV SPARK_HOME=/spark/
ENV PATH=$PATH:${SPARK_HOME}/bin
ENV PYSPARK_PYTHON=/usr/bin/python


# ENV SPARK_APPLICATION_PYTHON_LOCATION=wordcount.py
# ENV SPARK_APPLICATION_ARGS "spark-submit --master local[*] wordcount.py movies.csv output"

COPY data/movies.csv ./data/movies.csv
# RUN chmod a+x ./movies.csv
COPY data/wordcount.py ./data/wordcount.py
# RUN chmod a+x ./wordcount.py