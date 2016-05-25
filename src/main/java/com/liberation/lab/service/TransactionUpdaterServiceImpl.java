package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.TransactionUpdaterDAO;
import com.liberation.lab.model.TransactionUpdater;

public class TransactionUpdaterServiceImpl implements TransactionUpdaterService{

    private TransactionUpdaterDAO balanceDAO;
    
    public void setTransactionUpdaterDAO(TransactionUpdaterDAO balanceDAO) {
        this.balanceDAO = balanceDAO;
    }
 
    @Override
    @Transactional
    public void addTransactionUpdater(TransactionUpdater u) {
        this.balanceDAO.addTransactionUpdater(u);
    }
 
    @Override
    @Transactional
    public void updateTransactionUpdater(TransactionUpdater u) {
        this.balanceDAO.updateTransactionUpdater(u);
    }
 
    @Override
    @Transactional
    public List<TransactionUpdater> listTransactionUpdaters() {
        return this.balanceDAO.listTransactionUpdaters();
    }
 
    @Override
    @Transactional
    public TransactionUpdater getTransactionUpdaterById(int id) {
        return this.balanceDAO.getTransactionUpdaterById(id);
    }
 
    @Override
    @Transactional
    public void removeTransactionUpdater(int id) {
        this.balanceDAO.removeTransactionUpdater(id);
    } 
}
