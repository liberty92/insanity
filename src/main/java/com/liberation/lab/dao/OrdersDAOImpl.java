package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.Orders;

public class OrdersDAOImpl implements OrdersDAO {

    private static final Logger logger = LoggerFactory.getLogger(OrdersDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addOrders(Orders b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(b);
        logger.info("Orders saved successfully, Orders Details="+b);
    }
 
    @Override
    public void updateOrders(Orders b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(b);
        logger.info("Orders updated successfully, Orders Details="+b);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<Orders> listOrders() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Orders> ordersList = session.createQuery("from Orders").list();
        for(Orders b : ordersList){
            logger.info("Orders List::"+b);
        }
        return ordersList;
    }
 
    @Override
    public Orders getOrdersById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        Orders b = (Orders) session.get(Orders.class, new Integer(id));
        logger.info("Orders loaded successfully, Orders details="+b);
        return b;
    }
    @Override
    public List<Orders> getOrdersByBalanceId(int balanceId) {
        Session session = this.sessionFactory.getCurrentSession();  
        List <Orders> listOrdersByBalanceId = session.createQuery("from Orders where balanceId =:balanceId order by createdTime desc").setParameter("balanceId", balanceId).list();
		for (Orders b : listOrdersByBalanceId) {
			logger.info("Orders List::" + b);
		}
        return listOrdersByBalanceId;
    }
    @Override
    public List<Orders> getOrdersByBalanceIdToday(int balanceId) {
        Session session = this.sessionFactory.getCurrentSession();  
        List <Orders> listOrdersByBalanceId = session.createQuery("from Orders o where o.balanceId =:balanceId and o.createdTime > CURRENT_DATE() order by createdTime desc").setParameter("balanceId", balanceId).list();
		for (Orders b : listOrdersByBalanceId) {
			logger.info("Orders List::" + b);
		}
        return listOrdersByBalanceId;
    }
 
    @Override
    public void removeOrders(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Orders u = (Orders) session.load(Orders.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("Orders deleted successfully, person details="+u);
    }
}
