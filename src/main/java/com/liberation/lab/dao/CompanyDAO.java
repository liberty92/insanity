package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.Company;

public interface CompanyDAO {

    public void addCompany(Company u);
    public void updateCompany(Company u);
    public List<Company> listCompany();
    public Company getCompanyById(int id);
    public void removeCompany(int id);
}
