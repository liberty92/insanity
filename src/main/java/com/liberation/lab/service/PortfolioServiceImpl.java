package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.PortfolioDAO;
import com.liberation.lab.model.Portfolio;

public class PortfolioServiceImpl implements PortfolioService{

    private PortfolioDAO portfolioDAO;
    
    public void setPortfolioDAO(PortfolioDAO portfolioDAO) {
        this.portfolioDAO = portfolioDAO;
    }
 
    @Override
    @Transactional
    public void addPortfolio(Portfolio u) {
        this.portfolioDAO.addPortfolio(u);
    }
 
    @Override
    @Transactional
    public void updatePortfolio(Portfolio u) {
        this.portfolioDAO.updatePortfolio(u);
    }
 
    @Override
    @Transactional
    public List<Portfolio> listPortfolios() {
        return this.portfolioDAO.listPortfolios();
    }
 
    @Override
    @Transactional
    public Portfolio getPortfolioById(int id) {
        return this.portfolioDAO.getPortfolioById(id);
    }
 
    @Override
    @Transactional
    public void removePortfolio(int id) {
        this.portfolioDAO.removePortfolio(id);
    }

	@Override
	@Transactional
	public List<Portfolio> getPortfolioByBalanceId(int balanceId) {
		return this.portfolioDAO.getPortfolioByBalanceId(balanceId);
	}
}
