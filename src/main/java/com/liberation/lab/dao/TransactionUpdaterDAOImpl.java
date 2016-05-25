package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.TransactionUpdater;

public class TransactionUpdaterDAOImpl implements TransactionUpdaterDAO {

    private static final Logger logger = LoggerFactory.getLogger(TransactionUpdaterDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addTransactionUpdater(TransactionUpdater b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(b);
        logger.info("TransactionUpdater saved successfully, TransactionUpdater Details="+b);
    }
 
    @Override
    public void updateTransactionUpdater(TransactionUpdater b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(b);
        logger.info("TransactionUpdater updated successfully, TransactionUpdater Details="+b);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<TransactionUpdater> listTransactionUpdaters() {
        Session session = this.sessionFactory.getCurrentSession();
        List<TransactionUpdater> balancesList = session.createQuery("from TransactionUpdater").list();
        for(TransactionUpdater b : balancesList){
            logger.info("TransactionUpdater List::"+b);
        }
        return balancesList;
    }
 
    @Override
    public TransactionUpdater getTransactionUpdaterById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        TransactionUpdater b = (TransactionUpdater) session.get(TransactionUpdater.class, new Integer(id));
        logger.info("TransactionUpdater loaded successfully, TransactionUpdater details="+b);
        return b;
    } 
 
    @Override
    public void removeTransactionUpdater(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        TransactionUpdater u = (TransactionUpdater) session.load(TransactionUpdater.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("TransactionUpdater deleted successfully, person details="+u);
    }
}
