package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.Orders;

public interface OrdersDAO {

    public void addOrders(Orders u);
    public void updateOrders(Orders u);
    public List<Orders> listOrders();
    public Orders getOrdersById(int id);
    public List<Orders> getOrdersByBalanceId(int balanceId);
    public void removeOrders(int id);
}
