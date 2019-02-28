package com.wws.chart.vo;

import lombok.Data;

@Data
public class ChartVO {

//private String  areaCd;
private String areaNm;
private String nm;
private String regionArea;
private String col0;
private String col1;
private String col2;
private String col3;
private String col4;
private String col5;
private String col6;
private String col7;
private String col8;
private String col9;
private String tot;


/**
 * 
 * @Data : 모든 필드에 getter, setter를 생성하고 toString, equals, hashCode 메서드도 추가
         final로 지정된 필드가 있으면 생성자를 통해 데이터를 받을 수 있게 생성자를 생성하고
         이때 setter를 생성하지 않음
	@Getter/@Setter : getter, setter를 생성할 수 있고 접근지정자를 명시할 수 있음.
                    예) @Getter(AccessLevel.PUBLIC)
	@ToString : toString()를 재정의할 수 있음. 특정 필드를 제외할 수 있음
             예) @ToString(exclue={"name"})
	@AllArgsConstructor : 모든 필드 값을 인자로 받는 생성자 생성, 접근지정자 명시 가능
                          예) @AllArgsConstructor(access=AccessLevel.PUBLIC)
	@EqualsAndHashCode : equals, hashCode 메서드 생성, 특정 필드를 제외할 수 있음
                            예) @EqualsAndHashCode(exclude={"name"})
	@Log : Log4j사용. private static final Logger logger 추가	
	@Slf4j : Slf4j사용. private static final Logger logger 추가
	출처: https://mobilenweb.tistory.com/172 [모바일앤웹]
 * 
 */
}
