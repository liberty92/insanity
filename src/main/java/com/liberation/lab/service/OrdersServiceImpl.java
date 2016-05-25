package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.OrdersDAO;
import com.liberation.lab.model.Orders;

public class OrdersServiceImpl implements OrdersService{

    private OrdersDAO ordersDAO;
    
    public void setOrdersDAO(OrdersDAO ordersDAO) {
        this.ordersDAO = ordersDAO;
    }
 
    @Override
    @Transactional
    public void addOrders(Orders u) {
        this.ordersDAO.addOrders(u);
    }
 
    @Override
    @Transactional
    public void updateOrders(Orders u) {
        this.ordersDAO.updateOrders(u);
    }
 
    @Override
    @Transactional
    public List<Orders> listOrders() {
        return this.ordersDAO.listOrders();
    }
 
    @Override
    @Transactional
    public Orders getOrdersById(int id) {
        return this.ordersDAO.getOrdersById(id);
    }
 
    @Override
    @Transactional
    public void removeOrders(int id) {
        this.ordersDAO.removeOrders(id);
    }

	@Override
	@Transactional
	public List<Orders> getOrdersByBalanceId(int balanceId) {
		return this.ordersDAO.getOrdersByBalanceId(balanceId);
	}

	@Override
	@Transactional
	public List<Orders> getOrdersByBalanceIdToday(int balanceId) {
		return this.ordersDAO.getOrdersByBalanceIdToday(balanceId);
	}
}
