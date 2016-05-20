package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.Stock;

public class StockDAOImpl implements StockDAO {

    private static final Logger logger = LoggerFactory.getLogger(StockDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addStock(Stock u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(u);
        logger.info("Stock saved successfully, Stock Details="+u);
    }
 
    @Override
    public void updateStock(Stock u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("Stock updated successfully, Stock Details="+u);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<Stock> listStock() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Stock> stockList = session.createQuery("from Stock").list();
        for(Stock u : stockList){
            logger.info("Stock List::"+u);
        }
        return stockList;
    }
 
    @Override
    public Stock getStockById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        Stock u = (Stock) session.get(Stock.class, new Integer(id));
        logger.info("Stock loaded successfully, Stock details="+u);
        return u;
    }
 
    @Override
    public void removeStock(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Stock u = (Stock) session.load(Stock.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("Stock deleted successfully, person details="+u);
    }
}
