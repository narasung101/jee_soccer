
--1.전체 축구팀 목록. 이름 오름차순

SELECT TEAM_NAME "전체 축구팀 목록"
FROM TEAM
ORDER BY TEAM_NAME;


--2.포지션 종류(중복제거,없으면 빈공간)

SELECT DISTINCT POSITION
FROM PLAYER
;

--3.포지션 종류(중복제거,없으면 신입으로 기재) nvl2()사용

SELECT DISTINCT (NVL(POSITION,'신입')) 포지션
FROM PLAYER;


--4.수원팀(ID: K02)골키퍼

SELECT PLAYER_NAME 이름
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
    AND POSITION LIKE 'GK'
ORDER BY PLAYER_NAME
;

--5. 수원팀(ID: K02)키가 170 이상 선수 이면서 성이 고씨인 선수

SELECT POSITION 포지션, PLAYER_NAME 이름
FROM TEAM T JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE T.TEAM_ID LIKE 'K02'
    AND PLAYER_NAME LIKE '고%'
    AND HEIGHT >= 170
;

--6. -수원팀(ID: K02) 선수들 이름, 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시 키 내림차순

SELECT PLAYER_NAME || '선수'이름, NVL(HEIGHT,0) ||'CM,'키, NVL(WEIGHT,0)||'kg,'몸무게
FROM PLAYER 
WHERE TEAM_ID LIKE 'K02'
ORDER BY HEIGHT DESC
;

--7 수원팀(ID: K02) 선수들 이름, 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시, BMI지수, 키 내림차순

SELECT PLAYER_NAME || '선수' 이름, NVL(HEIGHT,0) ||'CM'키, NVL(WEIGHT,0)||'kg' 몸무게,
    ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)),2) BMI비만지수
FROM TEAM T JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID LIKE 'K02'
ORDER BY HEIGHT DESC
;

--8. 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 포지션이 GK 인  선수
-- 팀명, 사람명 오름차순

SELECT TEAM_NAME, POSITION 포지션, PLAYER_NAME
FROM TEAM T JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID IN ('K02','K10')
    AND POSITION LIKE 'GK'
ORDER BY P.TEAM_ID, PLAYER_NAME
;

--9. 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 키가 180 이상 183 이하인 선수들
-- 키, 팀명, 사람명 오름차순

SELECT HEIGHT 키, TEAM_NAME 팀명, PLAYER_NAME 이름
FROM TEAM T JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.TEAM_ID IN ('K02', 'K10')
    AND HEIGHT BETWEEN 180 AND 183
ORDER BY 1,2,3
;

--10. 모든 선수들 중 포지션을 배정받지 못한 선수들의 팀과 이름 팀명, 사람명 오름차순

SELECT TEAM_NAME 팀명, PLAYER_NAME 이름
FROM TEAM T JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE POSITION IS NULL
ORDER BY 1,2
;

--11.팀과 스타디움을 조인하여 팀이름, 스타디움 이름 출력

SELECT T.TEAM_NAME 팀명, S.STADIUM_NAME 스타디움
FROM TEAM T JOIN STADIUM S
    ON T.STADIUM_ID LIKE S.STADIUM_ID
ORDER BY 1 
;

--12. 팀과 스타디움, 스케줄을 조인하여 2012년 3월 17일에 열린 각 경기의 
-- 팀이름, 스타디움, 어웨이팀 이름 출력 다중테이블 join 을 찾아서 해결하시오.

SELECT TEAM_NAME 팀명, STADIUM_NAME 스타디움, AWAYTEAM_ID 원정팀ID, SCHE_DATE 스케줄날짜
FROM TEAM T JOIN STADIUM S
    ON T.STADIUM_ID LIKE S.STADIUM_ID
    JOIN SCHEDULE SC
    ON SC.STADIUM_ID LIKE S.STADIUM_ID
WHERE SCHE_DATE LIKE '20120317'
ORDER BY 1
;

--13. 2012년 3월 17일 경기에 포항 스틸러스 소속 골키퍼(GK) 선수, 포지션,팀명 (연고지포함), 
-- 스타디움, 경기날짜를 구하시오 연고지와 팀이름은 간격을 띄우시오

SELECT PLAYER_NAME 선수명, POSITION 포지션, REGION_NAME||' '||TEAM_NAME 팀명, 
    STADIUM_NAME 스타디움, SCHE_DATE 스케줄날짜
FROM PLAYER P JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID 
    JOIN STADIUM S
    ON T.STADIUM_ID LIKE S.STADIUM_ID
    JOIN SCHEDULE SC
    ON SC.STADIUM_ID LIKE S.STADIUM_ID
WHERE SCHE_DATE LIKE '20120317'
    AND POSITION LIKE 'GK'
    AND T.TEAM_NAME LIKE '스틸러스'
ORDER BY 1
;

--14. 홈팀이 3점이상 차이로 승리한 경기의 경기장 이름, 경기 일정 홈팀 이름과 원정팀 이름을
-- 구하시오

SELECT ST.STADIUM_NAME 스타디움, SC.SCHE_DATE 경기날짜, HT.TEAM_NAME 홈팀, AT.TEAM_NAME 어웨이팀,
    HOME_SCORE 홈팀스코어, AWAY_SCORE 어웨이스코어
FROM SCHEDULE SC JOIN STADIUM ST
    ON SC.STADIUM_ID LIKE ST.STADIUM_ID
    JOIN TEAM HT
    ON SC.HOMETEAM_ID LIKE HT.TEAM_ID
    JOIN TEAM AT
    ON SC.AWAYTEAM_ID LIKE AT.TEAM_ID
        
WHERE HOME_SCORE - AWAY_SCORE >= 3
;

SELECT
    ST.STADIUM_NAME 경기장, 
    SC.SCHE_DATE 경기일정, 
    
    CONCAT(CONCAT(HT.REGION_NAME,' '), HT.TEAM_NAME) 홈팀,
    CONCAT(CONCAT(AT.REGION_NAME,' '), AT.TEAM_NAME) 원정팀
FROM (SELECT STADIUM_ID,
             SCHE_DATE,
             HOMETEAM_ID,
             AWAYTEAM_ID
      FROM SCHEDULE
      WHERE (HOME_SCORE - AWAY_SCORE) >= 3) SC
    JOIN STADIUM ST
        USING (STADIUM_ID)
    JOIN TEAM HT
        ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
    JOIN TEAM AT
        ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
;


--15. STADIUM 에 등록된 운동장 중에서 홈팀이 없는 경기장까지 전부 나오도록 카운트 값은 20

SELECT STADIUM_NAME, S.STADIUM_ID, SEAT_COUNT, HOMETEAM_ID, E_TEAM_NAME
FROM STADIUM S LEFT JOIN TEAM T
    ON T.STADIUM_ID LIKE S.STADIUM_ID
ORDER BY 4
;

--16. 평균키가 인천 유나이티스팀의 평균키 보다 작은 팀의 팀ID, 팀명, 평균키 추출

SELECT T.TEAM_ID 팀아이디, T.TEAM_NAME 팀명, ROUND(AVG(HEIGHT),2) 평균키
FROM PLAYER P JOIN TEAM T
    ON P.TEAM_ID LIKE T.TEAM_ID
GROUP BY T.TEAM_ID, T.TEAM_NAME
HAVING AVG(P.HEIGHT) < (SELECT AVG(HEIGHT)
FROM PLAYER
WHERE TEAM_ID LIKE 'K04')
ORDER BY 3
;

--17. 포지션이 MF 인 선수들의 소속팀명 및 선수명, 백넘버 출력

SELECT TEAM_NAME 팀명, PLAYER_NAME 선수명, BACK_NO 백넘버
FROM PLAYER P JOIN TEAM T
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE POSITION LIKE 'MF'
;
SELECT T.TEAM_NAME 팀명, P.PLAYER_NAME 선수명, BACK_NO 백넘버
FROM PLAYER P JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE POSITION LIKE 'MF'
ORDER BY 2
; 

-- SOCCER_SQL_017
-- 포지션이 MF 인 선수들의 소속팀명 및 선수명, 백넘버 출력

SELECT 
    TEAM_NAME 팀명, 
    PLAYER_NAME 선수명, 
    BACK_NO 백넘버
FROM (SELECT PLAYER_NAME ,BACK_NO ,TEAM_ID
      FROM PLAYER
      WHERE POSITION LIKE 'MF') P
        JOIN TEAM T
        USING(TEAM_ID)
;

(SELECT PLAYER_NAME ,BACK_NO ,TEAM_ID
      FROM PLAYER
      WHERE POSITION LIKE 'MF')
      ;


SELECT T.TEAM_NAME 팀명, P.PLAYER_NAME 선수명, BACK_NO 백넘버
FROM PLAYER P JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE POSITION LIKE 'MF'
ORDER BY 2
; 

--18. 가장 키 큰 선수 5 추출, 오라클, 단 키 값이 없으면 제외
 
SELECT PLAYER_NAME 선수명, BACK_NO 백넘버, POSITION 포지션, HEIGHT 키

FROM(SELECT PLAYER_NAME, BACK_NO, POSITION, HEIGHT
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC)
WHERE ROWNUM <= 5
;

--19. 선수 자신이 속한 팀의 평균키보다 작은 선수 정보 출력

SELECT TEAM_NAME 팀명, PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER P JOIN TEAM T
    ON T.TEAM_ID LIKE P.TEAM_ID
    AND HEIGHT < (SELECT AVG(HEIGHT)
    FROM PLAYER
    WHERE TEAM_ID LIKE P.TEAM_ID
    GROUP BY TEAM_ID)
ORDER BY 2
;

--20. 2012년 5월 한달간 경기가 있는 경기장 조회 EXISTS 쿼리는 항상 연관쿼리로 사용한다.
-- 또한 아무리 조건을 만족하는 건이 여러 건이라도
-- 조건을 만족하는 1건만 찾으면 추가적인 검색을 진행하지 않는다.

SELECT DISTINCT STADIUM_ID ID, STADIUM_NAME 경기장명
FROM SCHEDULE SC 
    JOIN STADIUM S
        USING(STADIUM_ID)
WHERE SCHE_DATE LIKE '201205%'
;

--21. 이현 선수 소속팀의 선수명단 출력

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM PLAYER P
WHERE TEAM_ID LIKE (SELECT TEAM_ID
                    FROM PLAYER
                    WHERE PLAYER_NAME LIKE '이현')
ORDER BY 1;

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM PLAYER
WHERE PLAYER P JOIN (
    SELECT P.TEAM_ID
        
);

--22. NULL 처리에 있어 SUM(NVL(SAL,0))로 하지말고 NVL(SUM(SAL),0) 으로 해야
-- 자원낭비가 줄어든다 팀별 포지션별 인원수와 팀별 전체 인원수 출력 
--Oracle, Simple Case Expr 

SELECT TEAM_ID,
NVL(SUM(CASE WHEN POSITION LIKE 'FW' THEN 1 END),0) FW,
NVL(SUM(CASE WHEN POSITION LIKE 'MF' THEN 1 END),0) MF,
NVL(SUM(CASE WHEN POSITION LIKE 'DF' THEN 1 END),0) DF,
NVL(SUM(CASE WHEN POSITION LIKE 'GK' THEN 1 END),0) GK,
COUNT(*) SUM
FROM PLAYER
GROUP BY TEAM_ID

;
--23. GROUP BY 절 없이 전체 선수들의 포지션별 평균 키 및 전체 평균 키 출력

SELECT
ROUND(AVG(CASE WHEN POSITION LIKE 'FW' THEN HEIGHT END),2) 포워드,
ROUND(AVG(CASE WHEN POSITION LIKE 'MF' THEN HEIGHT END),2) 미드필더,
ROUND(AVG(CASE WHEN POSITION LIKE 'DF' THEN HEIGHT END),2) 디펜더,
ROUND(AVG(CASE WHEN POSITION LIKE 'GK' THEN HEIGHT END),2) 골키퍼
FROM PLAYER
;

--24. 소속팀별 키가 가장 작은 사람들의 정보

SELECT TEAM_ID 팀아이디, T.TEAM_NAME 팀이름, P.PLAYER_NAME 선수,
P.POSITION 포지션, P.BACK_NO 백넘버, P.HEIGHT 키
FROM PLAYER P JOIN TEAM T
USING (TEAM_ID)
WHERE (TEAM_ID, P.HEIGHT) IN (SELECT TEAM_ID, MIN(HEIGHT)
FROM PLAYER
GROUP BY TEAM_ID)       
;

--25. K-리그 2012년 8월 경기결과와 두 팀간의 점수차를 ABS 함수를 사용하여 
-- 절대값으로 출력하기

SELECT SCHE_DATE 날짜,
    CONCAT(CONCAT(T.TEAM_NAME,' - '),T2.TEAM_NAME)팀들,
    CONCAT(CONCAT(HOME_SCORE, ' - '),AWAY_SCORE) 점수,
    ABS(HOME_SCORE-AWAY_SCORE)
    
FROM (SELECT SCHE_DATE, 
             HOME_SCORE, 
             AWAY_SCORE, 
             HOMETEAM_ID, 
             AWAYTEAM_ID
       FROM SCHEDULE
       WHERE SCHE_DATE BETWEEN 20120801 AND 20120831
       ) S 
    JOIN (SELECT TEAM_ID, TEAM_NAME
           FROM TEAM) T
        ON S.HOMETEAM_ID LIKE T.TEAM_ID
    JOIN (SELECT TEAM_ID, TEAM_NAME
           FROM TEAM) T2
        ON S.AWAYTEAM_ID LIKE T2.TEAM_ID
;

--26. 20120501 부터 20120602 사이에 경기가 있는 경기장 조회

SELECT DISTINCT S.STADIUM_ID, S.STADIUM_NAME
FROM STADIUM S JOIN SCHEDULE SC
ON SC.STADIUM_ID LIKE S.STADIUM_ID
WHERE SC.SCHE_DATE BETWEEN '20120501' AND '20120602'
;

--27. 선수정보와 해당 선수가 속한 팀의 평균키 조회 단, 정렬시 평균키 내림차순

SELECT TEAM_NAME 팀명, PLAYER_NAME 선수명, HEIGHT 키,
(SELECT ROUND (AVG(HEIGHT),2)
        FROM PLAYER P2
        WHERE P2.TEAM_ID LIKE P.TEAM_ID) 평균키
FROM PLAYER P
        JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
ORDER BY 4 DESC
;

-- SOCCER_SQL_028 -- 평균키가 삼성 블루윙즈 팀이 평균키보다 작은 팀의
-- 이름과 해당 팀의 평균키
SELECT 
    T.TEAM_NAME 팀이름,
    ROUND(AVG(P.HEIGHT),2) 평균키
FROM (SELECT TEAM_ID, HEIGHT
      FROM PLAYER) P
      JOIN (SELECT TEAM_ID, TEAM_NAME
      FROM TEAM) T
    ON P.TEAM_ID LIKE T.TEAM_ID
GROUP BY T.TEAM_NAME
HAVING AVG(P.HEIGHT) <
        (SELECT AVG(HEIGHT)
        FROM (SELECT TEAM_ID, HEIGHT
             FROM PLAYER)
        JOIN (SELECT TEAM_ID, TEAM_NAME
             FROM TEAM
             WHERE TEAM_NAME LIKE '삼성블루윙즈')
        USING(TEAM_ID))
;

-- SOCCER_SQL_029
-- 드래곤즈 K07,FC서울 K09,일화천마 K08 각각의 팀 소속의 GK, MF 선수 정보
SELECT *
FROM (SELECT TEAM_ID ,TEAM_NAME
      FROM TEAM
      WHERE TEAM_ID IN('K07','K09','K08')) T 
      JOIN(SELECT *
           FROM PLAYER
           WHERE POSITION IN('GK','MF')) P
        ON T.TEAM_ID LIKE P.TEAM_ID
; -- COUNT 67

SELECT P.*, (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID LIKE P.TEAM_ID )
FROM (SELECT *
           FROM PLAYER
           WHERE POSITION IN('GK','MF')
            AND TEAM_ID IN('K07','K09','K08')) P
; -- COUNT 67

-- SOCCER_SQL_030
-- 29번에서 제시한 팀과 포지션이 아닌 선수들의 수

SELECT COUNT(*) 선수들의수
FROM PLAYER P 
    JOIN TEAM T
    USING(TEAM_ID)
WHERE TEAM_NAME NOT IN('드래곤즈','FC서울','일화천마')
            AND POSITION NOT IN('GK','MF')
;