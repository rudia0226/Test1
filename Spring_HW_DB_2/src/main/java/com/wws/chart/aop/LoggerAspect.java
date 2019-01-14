package com.wws.chart.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggerAspect {
	/*
	protected Log log = LogFactory.getLog(LoggerAspect.class);
    static String name = "";
    static String type = "";
*/
    
    @Around("execution(public * com.wws.chart.service.*Impl.*(..))")
    public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
    	
    	System.out.println("aspect part");
    	
    	/*
    	type = joinPoint.getSignature().getDeclaringTypeName();
        
        if (type.indexOf("Controller") > -1) {
            name = "Controller  \t:  ";
        }
        else if (type.indexOf("Service") > -1) {
            name = "ServiceImpl  \t:  "; 
        }
        else if (type.indexOf("DAO") > -1) {
            name = "DAO  \t\t:  ";
        }
        log.debug(name + type + "." + joinPoint.getSignature().getName() + "()");
    	*/
    	return joinPoint.proceed();
    }


}
