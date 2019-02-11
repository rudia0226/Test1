package com.wws.chart.aop;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

	@Component
	@Aspect
	public class LoggingAspect {
	   /* @Before("execution(* com.chart.service.*.*(..))")
	   public void before(JoinPoint joinPoint) {
	      String signatureString = joinPoint.getSignature().getName();   
	      System.out.println("@Before [ " + signatureString + " ] �޼��� ���� ��ó�� ����");      
	      for (Object arg : joinPoint.getArgs()) {
	         System.out.println("@Before [ " + signatureString + " ] �ƱԸ�Ʈ " + arg);         
	      }      
	   }*/
	    @AfterReturning(pointcut="execution(* com.chart.serivce.*.*(..))", returning="ret")
	   public void afterReturning(JoinPoint joinPoint, Object ret) {
	      String signatureString = joinPoint.getSignature().getName();      
	      System.out.println("@AfterReturing [ " + signatureString + " ] �޼��� ���� ��ó�� ����");
	      System.out.println("@AfterReturing [ " + signatureString + " ] ���ϰ�=" + ret);

	   }
	    /*
	    @AfterThrowing(pointcut="execution(* com.chart.service.*.*(..))", 
	          throwing="ex")
	   public void afterThrowing(JoinPoint joinPoint, Throwable ex) {
	      String signatureString = joinPoint.getSignature().getName();   
	      System.out.println("@AfterThrowing [ " + signatureString + " ] �޼��� ���� �� ���� �߻�");
	      System.out.println("@AfterThrowing [ " + signatureString + " ] ����=" + ex.getMessage());
	   }
	    */
	    @After("execution(* com.chart.service.*.searchChart(..))")
	   public void afterFinally(JoinPoint joinPoint) {
	      String signatureString = joinPoint.getSignature().getName();
	      System.out.println("@After [ " + signatureString + " ] �޼��� ���� �Ϸ�");
	  }
}
