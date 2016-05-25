package com.liberation.lab.controller;

public class TransactionTimeoutCanceller implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Cancelling all waiting transactions !!!");
		OrdersController oc = new OrdersController();
		oc.timeoutCancelAllWaitingOrders();
		
	}

}
