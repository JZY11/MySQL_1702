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

SELECT *       -- 通配符%   _
FROM scott.emp
WHERE ENAME LIKE 'a%';-- like像   模糊匹配   'a%'匹配以字母a开头   ‘%a%’含有a   %匹配任意长度

SELECT *
FROM scott.emp
WHERE ENAME LIKE '_DAMS';-- _匹配一个字符，字符任意   与%有区别

INSERT INTO scott.emp (EMPNO,ENAME) VALUE (222,'A_ADAMS');
SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE ENAME RLIKE '[a-f]+';-- 正则匹配的关键字可以为RLIKE 或 REGEXP    ^取反 [^a-f]表示匹配不包含a-f之外的任一字母

SELECT *
FROM scott.emp
WHERE HIREDATE REGEXP '-02$';-- -02- 匹配2月份  $结尾

SELECT *
FROM scott.emp
WHERE DEPTNO = 10 OR DEPTNO = 20;

SELECT *
FROM scott.emp
WHERE DEPTNO NOT IN (10,20); -- IN  排除10与20的部门

SELECT *
FROM scott.emp
WHERE SAL NOT BETWEEN 2000 AND 3000; -- [min, max]    BETWEEN  AND

SELECT *
FROM scott.emp
WHERE JOB IN ('manager', 'clerk');

SELECT *
FROM scott.emp
WHERE SAL >= 2000 AND SAL<= 3000;

SELECT ENAME '姓名',SAL '基本工资'  -- 别名alias  给字段起别名
FROM scott.emp;

SELECT *
FROM scott.emp AS e ;-- 为表起别名

SELECT e.ENAME
FROM scott.emp 'e';

SELECT *
FROM scott.emp
WHERE DEPTNO IS NOT NULL ; -- 检索null

