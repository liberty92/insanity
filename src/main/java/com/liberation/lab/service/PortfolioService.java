package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.Portfolio;

public interface PortfolioService {

    public void addPortfolio(Portfolio u);
    public void updatePortfolio(Portfolio u);
    public List<Portfolio> listPortfolios();
    public Portfolio getPortfolioById(int id);
    public List<Portfolio> getPortfolioByBalanceId(int balanceId);
    public List<Portfolio> getPortfolioHistoryByBalanceId(int balanceId);
    public void removePortfolio(int id);
}
