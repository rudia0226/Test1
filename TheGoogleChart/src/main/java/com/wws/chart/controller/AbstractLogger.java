package com.wws.chart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// for using logger.info in other controller classes
public class AbstractLogger {
	  protected Logger logger = LoggerFactory.getLogger(getClass());
}
