package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.CompanyDAO;
import com.liberation.lab.model.Company;

public class CompanyServiceImpl implements CompanyService{

    private CompanyDAO companyDAO;
    
    public void setCompanyDAO(CompanyDAO companyDAO) {
        this.companyDAO = companyDAO;
    }
 
    @Override
    @Transactional
    public void addCompany(Company u) {
        this.companyDAO.addCompany(u);
    }
 
    @Override
    @Transactional
    public void updateCompany(Company u) {
        this.companyDAO.updateCompany(u);
    }
 
    @Override
    @Transactional
    public List<Company> listCompany() {
        return this.companyDAO.listCompany();
    }
 
    @Override
    @Transactional
    public Company getCompanyById(int id) {
        return this.companyDAO.getCompanyById(id);
    }
 
    @Override
    @Transactional
    public void removeCompany(int id) {
        this.companyDAO.removeCompany(id);
    }
 
}
