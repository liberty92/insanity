package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.CompanyCategory;

public interface CompanyCategoryDAO {

    public void addCompanyCategory(CompanyCategory u);
    public void updateCompanyCategory(CompanyCategory u);
    public List<CompanyCategory> listCompanyCategory();
    public CompanyCategory getCompanyCategoryById(int id);
    public void removeCompanyCategory(int id);
}
