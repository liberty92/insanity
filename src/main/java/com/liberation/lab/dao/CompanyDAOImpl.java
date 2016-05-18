package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.Company;

public class CompanyDAOImpl implements CompanyDAO {

    private static final Logger logger = LoggerFactory.getLogger(CompanyDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addCompany(Company u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(u);
        logger.info("Company saved successfully, Company Details="+u);
    }
 
    @Override
    public void updateCompany(Company u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("Company updated successfully, Company Details="+u);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<Company> listCompany() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Company> companyList = session.createQuery("from Company").list();
        for(Company u : companyList){
            logger.info("Company List::"+u);
        }
        return companyList;
    }
 
    @Override
    public Company getCompanyById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        Company u = (Company) session.get(Company.class, new Integer(id));
        logger.info("Company loaded successfully, Company details="+u);
        return u;
    }
 
    @Override
    public void removeCompany(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Company u = (Company) session.load(Company.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("Company deleted successfully, person details="+u);
    }
}
