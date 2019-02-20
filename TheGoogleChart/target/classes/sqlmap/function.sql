-- Used Index
CREATE INDEX IDX_SALE_TBL ON SALE_TBL 
(AREA_CD);


-- Used Function


CREATE OR REPLACE FUNCTION           F_GEN_CHTMLN( V_COL IN VARCHAR, V_GR IN VARCHAR2,V_COLPOS IN VARCHAR2 := ' ' )
RETURN VARCHAR2 
IS 
   V_RET_STR          VARCHAR2(1000);    
   V_TOP_COLOR     VARCHAR2(50);
   V_LAST_COLOR    VARCHAR2(50);
   V_D_BK_COLOR    VARCHAR2(50);
   V_M_BK_COLOR    VARCHAR2(50);
   V_T_BK_COLOR     VARCHAR2(50);                 
   V_TR_HTML          VARCHAR2(1000) ;
   
BEGIN  

    SELECT  MAX(DECODE(CD_ID,'TOP_COLOR',CMT)) TOP_COLOR
               ,MAX(DECODE(CD_ID,'LAST_COLOR',CMT)) LAST_COLOR
               ,MAX(DECODE(CD_ID,'D_BK_COLOR',CMT)) D_BK_COLOR
               ,MAX(DECODE(CD_ID,'M_BK_COLOR',CMT)) M_BK_COLOR
               ,MAX(DECODE(CD_ID,'T_BK_COLOR',CMT))  T_BK_COLOR         
               INTO V_TOP_COLOR,V_LAST_COLOR, V_D_BK_COLOR
                       , V_M_BK_COLOR, V_T_BK_COLOR
     FROM CD_TBL
     WHERE CD_ID IN ('TOP_COLOR','LAST_COLOR','D_BK_COLOR','M_BK_COLOR','T_BK_COLOR') ;   
        
       CASE WHEN INSTR(V_COL,'¡ã') > 0 THEN 
                 V_RET_STR := q'[<td style="color: ]'||V_TOP_COLOR||q'[;">]'||V_COL||'</td>';
           WHEN INSTR(V_COL,'¡å') > 0 THEN 
                 V_RET_STR := q'[<td style="color: ]'||V_LAST_COLOR||q'[;">]'||V_COL||'</td>';
            ELSE
                  V_RET_STR := '<td>'||V_COL||'</td>';
        END CASE ;

      
        CASE WHEN  V_COLPOS = 'FIRST'  THEN
                        BEGIN
                                   IF V_GR = '00' THEN                      
                                       V_TR_HTML := q'[<tr style="background: ]'||V_D_BK_COLOR||q'[;"> ]' ;                            
                                    ELSIF  V_GR = '01' THEN                      
                                        V_TR_HTML := q'[<tr style="background: ]'||V_M_BK_COLOR||q'[; font-weight: bold;"> ]' ;                        
                                    ELSE                      
                                        V_TR_HTML := q'[<tr style="background: ]'||V_T_BK_COLOR||q'[; font-weight: bold;"> ]' ;                                
                                    END IF  ;     
                                                                                   
                                    V_RET_STR := V_TR_HTML || V_RET_STR  ;
                          END ;                                
               WHEN  V_COLPOS = 'LAST'  THEN                         
                          V_RET_STR := V_RET_STR || '</TR>' ;
                ELSE   
                        V_RET_STR :=  V_RET_STR ;                                 
        END CASE ;            
        
        RETURN V_RET_STR ;
END ;
