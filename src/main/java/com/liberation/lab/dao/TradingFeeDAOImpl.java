package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.TradingFee;

public class TradingFeeDAOImpl implements TradingFeeDAO {

    private static final Logger logger = LoggerFactory.getLogger(TradingFeeDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addTradingFee(TradingFee u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(u);
        logger.info("TradingFee saved successfully, TradingFee Details="+u);
    }
 
    @Override
    public void updateTradingFee(TradingFee u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("TradingFee updated successfully, TradingFee Details="+u);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<TradingFee> listTradingFees() {
        Session session = this.sessionFactory.getCurrentSession();
        List<TradingFee> tradingFeesList = session.createQuery("from TradingFee").list();
        for(TradingFee u : tradingFeesList){
            logger.info("TradingFee List::"+u);
        }
        return tradingFeesList;
    }
 
    @Override
    public TradingFee getTradingFeeById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        TradingFee u = (TradingFee) session.get(TradingFee.class, new Integer(id));
        logger.info("TradingFee loaded successfully, TradingFee details="+u);
        return u;
    } 
 
    @Override
    public void removeTradingFee(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        TradingFee u = (TradingFee) session.load(TradingFee.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("TradingFee deleted successfully, person details="+u);
    }
}
