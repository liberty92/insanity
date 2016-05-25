package com.liberation.lab.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.liberation.lab.model.Orders;
import com.liberation.lab.service.OrdersService;

public class TransactionUpdater implements Runnable{

	private OrdersService ordersService;

	@Autowired(required = true)
	@Qualifier(value = "ordersService")
	public void setOrdersService(OrdersService us) {
		this.ordersService = us;
	}
	
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
		
		List<Orders> list = this.ordersService.listOrders();
		
		System.out.println(list.get(0).toString());
		
	}

}
