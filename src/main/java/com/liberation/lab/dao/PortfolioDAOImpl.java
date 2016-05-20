package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.Portfolio;

public class PortfolioDAOImpl implements PortfolioDAO {

    private static final Logger logger = LoggerFactory.getLogger(PortfolioDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addPortfolio(Portfolio b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(b);
        logger.info("Portfolio saved successfully, Portfolio Details="+b);
    }
 
    @Override
    public void updatePortfolio(Portfolio b) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(b);
        logger.info("Portfolio updated successfully, Portfolio Details="+b);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<Portfolio> listPortfolios() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Portfolio> portfoliosList = session.createQuery("from Portfolio").list();
        for(Portfolio b : portfoliosList){
            logger.info("Portfolio List::"+b);
        }
        return portfoliosList;
    }
 
    @Override
    public Portfolio getPortfolioById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        Portfolio b = (Portfolio) session.get(Portfolio.class, new Integer(id));
        logger.info("Portfolio loaded successfully, Portfolio details="+b);
        return b;
    }
    @Override
    public List<Portfolio> getPortfolioByBalanceId(int balanceId) {
        Session session = this.sessionFactory.getCurrentSession();  
        List <Portfolio> listPortfolioByBalanceId = session.createQuery("from Portfolio where balanceId =:balanceId").setParameter("balanceId", balanceId).list();
		for (Portfolio b : listPortfolioByBalanceId) {
			logger.info("Portfolio List::" + b);
		}
        return listPortfolioByBalanceId;
    }
 
    @Override
    public void removePortfolio(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Portfolio u = (Portfolio) session.load(Portfolio.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("Portfolio deleted successfully, person details="+u);
    }
}
