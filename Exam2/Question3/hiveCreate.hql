create database IF NOT EXISTS ${hivevar:databaseName};
USE ${hivevar:databaseName};
Create TABLE IF NOT EXISTS ${hivevar:tempTableName}(name string, cno string, cname string, grade string) Partitioned by (userName string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS TEXTFILE;
Create TABLE IF NOT EXISTS ${hivevar:tableName}(name string, cno string, cname string, grade string) Partitioned by (userName string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS orc;

