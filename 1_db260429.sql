-- 1-1
SELECT bookname FROM Book WHERE bookid = 1;

-- 1-2
SELECT bookname FROM Book WHERE price >= 20000;

-- 1-3
SELECT SUM(orders.saleprice) AS "총구매액" 
FROM Customer, Orders 
WHERE customer.custid = orders.custid 
  AND customer.name = '박지성';

-- 1-4
SELECT COUNT(*) AS "구매한 도서의 수" 
FROM Customer, Orders 
WHERE customer.custid = orders.custid 
  AND customer.name = '박지성';


-- 2-1
SELECT COUNT(*) AS "도서의 총수" FROM Book;

-- 2-2
SELECT COUNT(DISTINCT publisher) AS "출판사의 총수" FROM Book;

-- 2-3
SELECT name, address FROM Customer;

-- 2-4
SELECT orderid 
FROM Orders 
WHERE orderdate BETWEEN TO_DATE('2025-07-04', 'yyyy-mm-dd') 
                  AND TO_DATE('2025-07-07', 'yyyy-mm-dd');

-- 2-5
SELECT orderid 
FROM Orders 
WHERE orderid NOT IN (
    SELECT orderid 
    FROM Orders 
    WHERE orderdate BETWEEN TO_DATE('2025-07-04', 'yyyy-mm-dd') 
                      AND TO_DATE('2025-07-07', 'yyyy-mm-dd')
);

-- 2-6
SELECT name, address FROM Customer WHERE name LIKE '김%';

-- 2-7
SELECT name, address FROM Customer WHERE name LIKE '김%아';