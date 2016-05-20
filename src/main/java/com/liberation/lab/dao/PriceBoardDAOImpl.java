package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.PriceBoard;

public class PriceBoardDAOImpl implements PriceBoardDAO {

    private static final Logger logger = LoggerFactory.getLogger(PriceBoardDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addPriceBoard(PriceBoard u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.saveOrUpdate(u);
        logger.info("PriceBoard saved successfully, PriceBoard Details="+u);
    }
 
    @Override
    public void updatePriceBoard(PriceBoard u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("PriceBoard updated successfully, PriceBoard Details="+u);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<PriceBoard> listPriceBoard() {
        Session session = this.sessionFactory.getCurrentSession();
        List<PriceBoard> priceBoardList = session.createQuery("from PriceBoard").list();
        for(PriceBoard u : priceBoardList){
            logger.info("PriceBoard List::"+u);
        }
        return priceBoardList;
    }
 
    @Override
    public PriceBoard getPriceBoardById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        PriceBoard u = (PriceBoard) session.get(PriceBoard.class, new Integer(id));
        logger.info("PriceBoard loaded successfully, PriceBoard details="+u);
        return u;
    }
 
    @Override
    public void removePriceBoard(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        PriceBoard u = (PriceBoard) session.load(PriceBoard.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("PriceBoard deleted successfully, person details="+u);
    }
}
