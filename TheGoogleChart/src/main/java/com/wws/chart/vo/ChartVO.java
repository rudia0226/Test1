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
 * @Data : ��� �ʵ忡 getter, setter�� �����ϰ� toString, equals, hashCode �޼��嵵 �߰�
         final�� ������ �ʵ尡 ������ �����ڸ� ���� �����͸� ���� �� �ְ� �����ڸ� �����ϰ�
         �̶� setter�� �������� ����
	@Getter/@Setter : getter, setter�� ������ �� �ְ� ���������ڸ� ����� �� ����.
                    ��) @Getter(AccessLevel.PUBLIC)
	@ToString : toString()�� �������� �� ����. Ư�� �ʵ带 ������ �� ����
             ��) @ToString(exclue={"name"})
	@AllArgsConstructor : ��� �ʵ� ���� ���ڷ� �޴� ������ ����, ���������� ��� ����
                          ��) @AllArgsConstructor(access=AccessLevel.PUBLIC)
	@EqualsAndHashCode : equals, hashCode �޼��� ����, Ư�� �ʵ带 ������ �� ����
                            ��) @EqualsAndHashCode(exclude={"name"})
	@Log : Log4j���. private static final Logger logger �߰�	
	@Slf4j : Slf4j���. private static final Logger logger �߰�
	��ó: https://mobilenweb.tistory.com/172 [����Ͼ���]
 * 
 */
}
