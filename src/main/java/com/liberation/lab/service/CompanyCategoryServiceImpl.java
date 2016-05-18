package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.CompanyCategoryDAO;
import com.liberation.lab.model.CompanyCategory;

public class CompanyCategoryServiceImpl implements CompanyCategoryService{

    private CompanyCategoryDAO companyCategoryDAO;
    
    public void setCompanyCategoryDAO(CompanyCategoryDAO companyCategoryDAO) {
        this.companyCategoryDAO = companyCategoryDAO;
    }
 
    @Override
    @Transactional
    public void addCompanyCategory(CompanyCategory u) {
        this.companyCategoryDAO.addCompanyCategory(u);
    }
 
    @Override
    @Transactional
    public void updateCompanyCategory(CompanyCategory u) {
        this.companyCategoryDAO.updateCompanyCategory(u);
    }
 
    @Override
    @Transactional
    public List<CompanyCategory> listCompanyCategory() {
        return this.companyCategoryDAO.listCompanyCategory();
    }
 
    @Override
    @Transactional
    public CompanyCategory getCompanyCategoryById(String id) {
        return this.companyCategoryDAO.getCompanyCategoryById(id);
    }
 
    @Override
    @Transactional
    public void removeCompanyCategory(String id) {
        this.companyCategoryDAO.removeCompanyCategory(id);
    }
 
}
