package com.liberation.lab.controller;

import org.springframework.stereotype.Component;

@Component("myBean")
public class Dump implements Runnable{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("RUNNING");
	}

}
