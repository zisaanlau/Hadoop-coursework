sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --table Employees --split-by eid --target-dir /tmp/sqoopOutput -P

sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --table Employees -m 1 --split-by eid --target-dir /tmp/sqoopMapOutput -P

sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --table Employees -m 2 --target-dir /tmp/sqoopSeqOutput --as-sequencefile -P

sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --table Employees -m 2 --warehouse-dir /tmp/sqoop/Employees -P

sqoop import --connect jdbc:mysql://$1/sqooptest --username hive --delete-target-dir -m 2 --table Employees --warehouse-dir /tmp/sqoop/Employees --fields-terminated-by '\t' --null-string 'This is a Null String' --null-non-string '\\N' -P

hive -e 'Create DataBase IF NOT EXISTS sqooptest';

sqoop import --connect jdbc:mysql://$1/sqooptest --username hive -m 2 --table Employees --hive-import --create-hive-table --hive-table sqooptest.Employees -P

sqoop import --connect jdbc:mysql://$1/sqooptest --username hive -m 2 --table Employees --hive-import --create-hive-table --hive-table sqooptest.Employees --fields-terminated-by '\t' --null-string 'This is a Null String' --null-non-string '\\N' -P

sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username hive -m 1 --warehouse-dir /tmp/sqoopAll/ -P