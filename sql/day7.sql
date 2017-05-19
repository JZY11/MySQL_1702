SELECT *
FROM scott.emp
LIMIT 3;

SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
LIMIT 3,4;

SELECT *
FROM scott.emp -- limit关键字配合offset
LIMIT 4 OFFSET 3; -- 偏移量3即表示从第4行开始显示4条数据   分页查询的话  offset前数字不变，后面的数字乘1加前面的数字

SELECT *
FROM scott.emp
ORDER BY ENAME
LIMIT 3 OFFSET 0;-- limit 位于order by 之后