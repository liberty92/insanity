package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.Balance;

public class BalanceDAOImpl implements BalanceDAO {

    private static final Logger logger = LoggerFactory.getLogger(BalanceDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addBalance(Balance b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(b);
        logger.info("Balance saved successfully, Balance Details="+b);
    }
 
    @Override
    public void updateBalance(Balance b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(b);
        logger.info("Balance updated successfully, Balance Details="+b);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<Balance> listBalances() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Balance> balancesList = session.createQuery("from Balance").list();
        for(Balance b : balancesList){
            logger.info("Balance List::"+b);
        }
        return balancesList;
    }
 
    @Override
    public Balance getBalanceById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        Balance b = (Balance) session.get(Balance.class, new Integer(id));
        logger.info("Balance loaded successfully, Balance details="+b);
        return b;
    }
    @Override
    public List<Balance> getBalanceByUserId(int userId) {
        Session session = this.sessionFactory.getCurrentSession();  
        List <Balance> listBalanceByUserId = session.createQuery("from Balance where userId =:userId").setParameter("userId", userId).list();
		for (Balance b : listBalanceByUserId) {
			logger.info("Balance List::" + b);
		}
        return listBalanceByUserId;
    }
 
    @Override
    public void removeBalance(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Balance u = (Balance) session.load(Balance.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("Balance deleted successfully, person details="+u);
    }
}
