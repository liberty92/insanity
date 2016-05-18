package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.CompanyCategory;

public class CompanyCategoryDAOImpl implements CompanyCategoryDAO {

    private static final Logger logger = LoggerFactory.getLogger(CompanyCategoryDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addCompanyCategory(CompanyCategory u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.saveOrUpdate(u);
        logger.info("CompanyCategory saved successfully, CompanyCategory Details="+u);
    }
 
    @Override
    public void updateCompanyCategory(CompanyCategory u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("CompanyCategory updated successfully, CompanyCategory Details="+u);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<CompanyCategory> listCompanyCategory() {
        Session session = this.sessionFactory.getCurrentSession();
        List<CompanyCategory> companyCategoryList = session.createQuery("from CompanyCategory").list();
        for(CompanyCategory u : companyCategoryList){
            logger.info("CompanyCategory List::"+u);
        }
        return companyCategoryList;
    }
 
    @Override
    public CompanyCategory getCompanyCategoryById(String id) {
        Session session = this.sessionFactory.getCurrentSession();      
        CompanyCategory u = (CompanyCategory) session.get(CompanyCategory.class, (id));
        logger.info("CompanyCategory loaded successfully, CompanyCategory details="+u);
        return u;
    }
 
    @Override
    public void removeCompanyCategory(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        CompanyCategory u = (CompanyCategory) session.load(CompanyCategory.class, (id));
        if(null != u){
            session.delete(u);
        }
        logger.info("CompanyCategory deleted successfully, person details="+u);
    }
}
