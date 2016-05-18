package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.BalanceDAO;
import com.liberation.lab.model.Balance;

public class BalanceServiceImpl implements BalanceService{

    private BalanceDAO balanceDAO;
    
    public void setBalanceDAO(BalanceDAO balanceDAO) {
        this.balanceDAO = balanceDAO;
    }
 
    @Override
    @Transactional
    public void addBalance(Balance u) {
        this.balanceDAO.addBalance(u);
    }
 
    @Override
    @Transactional
    public void updateBalance(Balance u) {
        this.balanceDAO.updateBalance(u);
    }
 
    @Override
    @Transactional
    public List<Balance> listBalances() {
        return this.balanceDAO.listBalances();
    }
 
    @Override
    @Transactional
    public Balance getBalanceById(int id) {
        return this.balanceDAO.getBalanceById(id);
    }
 
    @Override
    @Transactional
    public void removeBalance(int id) {
        this.balanceDAO.removeBalance(id);
    }

	@Override
	@Transactional
	public List<Balance> getBalanceByUserId(int userId) {
		return this.balanceDAO.getBalanceByUserId(userId);
	}
}
