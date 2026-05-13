-- 2,29,34번이상함


-- 1
SELECT 극장이름, 위치 FROM 극장;

-- 2
SELECT 극장이름 
FROM 극장 
WHERE 위치 IN ('강남', '강동');

-- 3
SELECT 극장번호, 상영관번호, 영화제목 FROM 상영관 WHERE 가격 >= 10000;

-- 4
SELECT 영화제목, COUNT(*) FROM 상영관 GROUP BY 영화제목;


--5
SELECT * FROM 예약 WHERE 날짜 = TO_DATE('2024-10-01', 'YYYY-MM-DD');

-- 6
SELECT 주소, COUNT(*) FROM 고객 GROUP BY 주소;

-- 7
SELECT 극장번호, 상영관번호 FROM 상영관 
WHERE 좌석수 = (SELECT MAX(좌석수) FROM 상영관);

--8
SELECT 고객번호, COUNT(*) FROM 예약 GROUP BY 고객번호;

-- 9
SELECT 극장번호, AVG(가격) FROM 상영관 GROUP BY 극장번호;

-- 10
SELECT 이름, 주소 FROM 고객 WHERE 이름 LIKE '김%';

-- 11
SELECT t.극장이름, s.영화제목
FROM 극장 t, 상영관 s
WHERE t.극장번호 = s.극장번호;

-- 12
SELECT t.극장이름, s.영화제목, r.날짜
FROM 극장 t, 상영관 s, 예약 r
WHERE t.극장번호 = s.극장번호 
  AND s.극장번호 = r.극장번호 
  AND s.상영관번호 = r.상영관번호;

--13
SELECT c.이름, r.날짜
FROM 고객 c, 예약 r
WHERE c.고객번호 = r.고객번호;

--14
SELECT t.극장이름, s.영화제목, c.이름, r.좌석번호
FROM 극장 t, 상영관 s, 예약 r, 고객 c
WHERE t.극장번호 = s.극장번호 
  AND s.극장번호 = r.극장번호 
  AND s.상영관번호 = r.상영관번호
  AND r.고객번호 = c.고객번호;

--15
SELECT s.영화제목, COUNT(*)
FROM 상영관 s, 예약 r
WHERE s.극장번호 = r.극장번호 AND s.상영관번호 = r.상영관번호
GROUP BY s.영화제목;

--16
SELECT s.영화제목, s.가격
FROM 극장 t, 상영관 s
WHERE t.극장번호 = s.극장번호 AND t.위치 = '강남';

--17
SELECT c.이름
FROM 고객 c LEFT OUTER JOIN 예약 r ON c.고객번호 = r.고객번호
WHERE r.고객번호 IS NULL;

--18
SELECT t.극장이름, COUNT(*)
FROM 극장 t, 예약 r
WHERE t.극장번호 = r.극장번호
GROUP BY t.극장이름;

--19
SELECT r.고객번호, s.영화제목
FROM 상영관 s, 예약 r
WHERE s.극장번호 = r.극장번호 
  AND s.상영관번호 = r.상영관번호
  AND s.가격 >= 12000;

--20
SELECT c.이름, COUNT(*)
FROM 고객 c, 예약 r
WHERE c.고객번호 = r.고객번호
GROUP BY c.이름;

--21
SELECT t.극장이름, r.극장번호, r.상영관번호, r.날짜
FROM 극장 t, 예약 r
WHERE t.극장번호 = r.극장번호;

--22
SELECT DISTINCT c.이름, c.주소
FROM 고객 c, 예약 r
WHERE c.고객번호 = r.고객번호;

--23
SELECT t.극장이름, s.영화제목
FROM 극장 t, 상영관 s
WHERE t.극장번호 = s.극장번호;

--24
SELECT t.극장이름, s.영화제목, s.가격
FROM 극장 t, 상영관 s
WHERE t.극장번호 = s.극장번호;

--25
SELECT c.이름 
FROM 고객 c 
WHERE NOT EXISTS (
    SELECT c2.고객번호 FROM 고객 c2 WHERE c2.고객번호 = c.고객번호
    INTERSECT
    SELECT r.고객번호 FROM 예약 r
);
--26 
SELECT 극장이름 FROM 극장
MINUS
SELECT t.극장이름 FROM 극장 t, 예약 r WHERE t.극장번호 = r.극장번호;

--27
SELECT c.이름, r.극장번호, r.날짜
FROM 고객 c, 예약 r
WHERE c.고객번호 = r.고객번호;

--28
SELECT t.극장이름
FROM 극장 t, 상영관 s
WHERE t.극장번호 = s.극장번호
  AND s.좌석수 = (SELECT MIN(좌석수) FROM 상영관);

--29
SELECT s.영화제목
FROM 상영관 s, 예약 r
WHERE s.극장번호 = r.극장번호 
  AND s.상영관번호 = r.상영관번호
  AND r.날짜 = TO_DATE('2024-01-01', 'yyyy-mm-dd');

--30
SELECT c.이름
FROM 고객 c, 예약 r
WHERE c.고객번호 = r.고객번호
GROUP BY c.이름
HAVING COUNT(*) >= 2;

--31
SELECT 이름
FROM 고객
WHERE 고객번호 IN (SELECT 고객번호 FROM 예약);

--32
SELECT s1.영화제목, s1.가격
FROM 상영관 s1
WHERE s1.가격 > (SELECT AVG(s2.가격) FROM 상영관 s2 WHERE s2.극장번호 = s1.극장번호);

--33
SELECT t.극장이름
FROM 극장 t, 예약 r
WHERE t.극장번호 = r.극장번호
GROUP BY t.극장이름
HAVING COUNT(*) >= 5;

--34
SELECT 이름
FROM 고객
WHERE 고객번호 IN (SELECT 고객번호 FROM 예약 WHERE 좌석번호 = 'A1');

--35
SELECT 영화제목
FROM 상영관
WHERE 상영관번호 NOT IN (SELECT 상영관번호 FROM 예약);

--36
SELECT 고객번호, 날짜
FROM 예약
GROUP BY 고객번호, 날짜
HAVING COUNT(*) >= 2;

--37
SELECT 극장이름
FROM 극장
WHERE 극장번호 NOT IN (SELECT 극장번호 FROM 상영관 WHERE 가격 < 10000);

--38
SELECT c.이름
FROM 고객 c, 예약 r
WHERE c.고객번호 = r.고객번호
GROUP BY c.이름
HAVING COUNT(DISTINCT r.극장번호) >= 2;

--39
SELECT s1.영화제목
FROM 상영관 s1
WHERE s1.좌석수 = (SELECT MAX(s2.좌석수) FROM 상영관 s2 WHERE s2.극장번호 = s1.극장번호);

--40
SELECT c.이름
FROM 고객 c, 예약 r
WHERE c.고객번호 = r.고객번호
  AND r.날짜 = (SELECT MAX(날짜) FROM 예약);