package com.planb_jeju.config;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class AopLogConfig {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Around("within(com.planb_jeju.controller.*)")
    public Object logBefore(ProceedingJoinPoint point) throws Throwable {

        // Before Doing..
        long start = System.currentTimeMillis();

        Object retVal = point.proceed();

        // After Doing..
        long processTime = System.currentTimeMillis() - start;

        StringBuffer sb = new StringBuffer();
        Object[] params = point.getArgs();

        int i=0;
        for(Object param : params) {
            if(param != null) {
                if(i > 0)	sb.append(", ");
                sb.append(param.toString());
                i++;
            }
        }

        logger.info("");
        logger.info("---------------------------------------------------------------------------------------------------------------------------");
        logger.info("Processing Time ( " + point.getSignature().toShortString() +" ) : " + processTime + " ms");
        logger.info("Request  Params : " + sb.toString());
        logger.info("Response Return : " + retVal.toString());
        logger.info("---------------------------------------------------------------------------------------------------------------------------");
        logger.info("");

        return retVal;
    }
}
