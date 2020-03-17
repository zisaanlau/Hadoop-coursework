USE ${hivevar:databaseName};

LOAD DATA INPATH '/tmp/pigOutput/liuz6/part-r-00000' overwrite INTO Table ${hivevar:tempTableName} Partition(userName = 'liuz6');

Set hive.exec.dynamic.partition.mode=nonstrict;
insert into table ${hivevar:tableName} partition(userName) select name, cno, cname, grade, userName from ${hivevar:tempTableName};

