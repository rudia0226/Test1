

SELECT * FROM DIA_TBL;


SELECT 
   --SYS_CONNECT_BY_PATH(NID, '§§') PATH
   LPAD(' ', (LEVEL-1)*5) || '§§' || NID   
  , NID
  , PID 
  , NAME 
FROM DIA_TBL
CONNECT BY PRIOR NID = PID 
START WITH NID = 1
;



-- 81∆‰¿Ã¡ˆ 

SELECT 
		LTRIM(MAX(SYS_CONNECT_BY_PATH(NID, '+')), '+') || ' = ' ||  SUM(NID) SSS
FROM 
(
SELECT ROWNUM + :ST -1 NID 
        , ROWNUM + :ST PID 
FROM DUAL 
CONNECT BY LEVEL <= :ED - :ST + 1 
)
CONNECT BY PRIOR NID = PID
START WITH NID = :ED
;




