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
WHERE ENAME RLIKE '[0-9]+';