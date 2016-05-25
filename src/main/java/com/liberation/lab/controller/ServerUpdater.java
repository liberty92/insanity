package com.liberation.lab.controller;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ServerUpdater implements ServletContextListener{

	private ScheduledExecutorService scheduler;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		scheduler = Executors.newSingleThreadScheduledExecutor();
       /* scheduler.scheduleAtFixedRate(new SomeDailyJob(), 0, 1, TimeUnit.DAYS);
        scheduler.scheduleAtFixedRate(new SomeHourlyJob(), 0, 1, TimeUnit.HOURS);
        scheduler.scheduleAtFixedRate(new SomeQuarterlyJob(), 0, 15, TimeUnit.MINUTES);*/
//		scheduler.scheduleAtFixedRate(new TransactionTimeoutCanceller(), 0, 2, TimeUnit.MINUTES);
		scheduler.scheduleAtFixedRate(new TransactionUpdater(), 0, 2, TimeUnit.MINUTES);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		scheduler.shutdownNow();
	}

}
