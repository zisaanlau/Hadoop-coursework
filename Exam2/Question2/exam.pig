register 'hdfs:///tmp/Exams/liuz6UDF.jar';
DEFINE Concatenate edu.rosehulman.liuz6.Concatenate();
DEFINE Convert edu.rosehulman.liuz6.Convert();

grades = LOAD '$gradeInput' using PigStorage(',') AS (fName:chararray, lName:chararray, courseNum:chararray, score:double);
courses = LOAD '$courseInput' using PigStorage(',') AS (courseNum:chararray, courseName:chararray);
fgrades = FILTER grades by score<=90;

temp = JOIN fgrades by courseNum, courses by courseNum;
result = FOREACH temp GENERATE Concatenate(fgrades::fName, fgrades::lName), courses::courseNum, courses::courseName, Convert(fgrades::score);
STORE result into '$pigOutput/$username' using PigStorage('\t');