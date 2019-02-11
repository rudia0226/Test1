package com.wws.chart.aop;

import org.aspectj.lang.ProceedingJoinPoint;

public class PerfomTraceAdvice {
	
	public Object trace(ProceedingJoinPoint joinPoint) throws Throwable {
		//ProceedingJoinPoint �� �� ù��° �Ķ���ͷ� �;���
		//Ÿ�� �޼����� signature ����
		String signatureString = joinPoint.getSignature().toShortString();		
		System.out.println(signatureString + " ����");
		//Ÿ���� �޼��尡 ȣ��Ǳ� ���� �ð� 
		long start = System.currentTimeMillis();		
		try {
		//Ÿ���� �޼��� ȣ��
		Object result = joinPoint.proceed();
		return result;
		} finally {
		//Ÿ���� �޼��尡 ȣ��� ���� �ð�
		long finish = System.currentTimeMillis();
		System.out.println(signatureString + " ����");
		System.out.println(signatureString + " ���� �ð� : " + 
		   (finish - start) + " ms");
		}
	}
}
