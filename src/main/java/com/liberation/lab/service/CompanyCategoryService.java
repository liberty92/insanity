package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.CompanyCategory;

public interface CompanyCategoryService {

    public void addCompanyCategory(CompanyCategory u);
    public void updateCompanyCategory(CompanyCategory u);
    public List<CompanyCategory> listCompanyCategory();
    public CompanyCategory getCompanyCategoryById(String id);
    public void removeCompanyCategory(String id);
}
