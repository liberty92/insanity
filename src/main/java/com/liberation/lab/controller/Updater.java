//package com.liberation.lab.controller;
//
//import java.util.concurrent.ScheduledExecutorService;
//import java.util.concurrent.TimeUnit;
//
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//
//@WebListener
//public class Updater implements ServletContextListener {
//
//	private ScheduledExecutorService scheduler;
//	
//	@Override
//	public void contextInitialized(ServletContextEvent sce) {
//		// TODO Auto-generated method stub
//		scheduler.scheduleAtFixedRate(new Dump(), 0, 2, TimeUnit.MINUTES);
//	}
//
//	@Override
//	public void contextDestroyed(ServletContextEvent sce) {
//		// TODO Auto-generated method stub
//		try {
//			scheduler.awaitTermination(2, TimeUnit.MINUTES);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//}
