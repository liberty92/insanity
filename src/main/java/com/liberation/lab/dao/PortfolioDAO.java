package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.Portfolio;

public interface PortfolioDAO {

    public void addPortfolio(Portfolio u);
    public void updatePortfolio(Portfolio u);
    public List<Portfolio> listPortfolios();
    public Portfolio getPortfolioById(int id);
    public List<Portfolio> getPortfolioByBalanceId(int balanceId);
    public void removePortfolio(int id);
}
