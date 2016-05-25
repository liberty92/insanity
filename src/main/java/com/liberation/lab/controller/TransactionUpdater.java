package com.liberation.lab.controller;

public class TransactionUpdater implements Runnable{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Updating transactions");
		OrdersController oc = new OrdersController();
		oc.hehe();
		/*try {
			oc.checkTransactionAllWaitingOrders();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}

}
