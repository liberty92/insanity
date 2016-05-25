package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.Orders;

public interface OrdersService {

    public void addOrders(Orders u);
    public void updateOrders(Orders u);
    public List<Orders> listOrders();
    public Orders getOrdersById(int id);
    public List<Orders> getOrdersByBalanceId(int balanceId);
    public List<Orders> getOrdersByBalanceIdToday(int balanceId);
    public void removeOrders(int id);
}
