use exam;

select * from (select cno as cno, COUNT(cno) as count from examData where grade != 'D' GROUP BY cno) temp where temp.count >=2;