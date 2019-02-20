CREATE OR REPLACE FUNCTION  F_GEN_CHTML( V_COL IN VARCHAR)
RETURN VARCHAR2 
IS 
   V_RET_STR VARCHAR2(1000);    
   V_TOP_COLOR  VARCHAR2(50);
   V_LAST_COLOR    VARCHAR2(50);
   
BEGIN  

SELECT  MAX(DECODE(CD_ID,'TOP_COLOR',CMT)) TOP_COLOR
           ,MAX(DECODE(CD_ID,'LAST_COLOR',CMT)) LAST_COLOR
           INTO V_TOP_COLOR,V_LAST_COLOR
FROM CD_TBL
WHERE CD_ID IN ('TOP_COLOR','LAST_COLOR') ;

  CASE WHEN INSTR(V_COL,'¡ã') > 0 THEN 
             V_RET_STR := q'[<td style="color: ]'||V_TOP_COLOR||q'[;">]'||V_COL||'</td>';
       WHEN INSTR(V_COL,'¡å') > 0 THEN 
             V_RET_STR := q'[<td style="color: ]'||V_LAST_COLOR||q'[;">]'||V_COL||'</td>';
        ELSE
              V_RET_STR := '<td>'||V_COL||'</td>';
    END CASE ;
    
    RETURN V_RET_STR ;
END ;
