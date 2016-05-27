package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.SystemConfig;

public class SystemConfigDAOImpl implements SystemConfigDAO {

    private static final Logger logger = LoggerFactory.getLogger(SystemConfigDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addSystemConfig(SystemConfig u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(u);
        logger.info("SystemConfig saved successfully, SystemConfig Details="+u);
    }
 
    @Override
    public void updateSystemConfig(SystemConfig u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("SystemConfig updated successfully, SystemConfig Details="+u);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<SystemConfig> listSystemConfigs() {
        Session session = this.sessionFactory.getCurrentSession();
        List<SystemConfig> systemConfigsList = session.createQuery("from SystemConfig").list();
        for(SystemConfig u : systemConfigsList){
            logger.info("SystemConfig List::"+u);
        }
        return systemConfigsList;
    }
 
    @Override
    public SystemConfig getSystemConfigById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        SystemConfig u = (SystemConfig) session.get(SystemConfig.class, new Integer(id));
        logger.info("SystemConfig loaded successfully, SystemConfig details="+u);
        return u;
    } 
 
    @Override
    public void removeSystemConfig(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        SystemConfig u = (SystemConfig) session.load(SystemConfig.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("SystemConfig deleted successfully, person details="+u);
    }
}
