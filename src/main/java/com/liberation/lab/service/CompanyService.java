package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.Company;

public interface CompanyService {

    public void addCompany(Company u);
    public void updateCompany(Company u);
    public List<Company> listCompany();
    public Company getCompanyById(int id);
    public void removeCompany(int id);
}
