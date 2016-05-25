package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.TransactionUpdater;

public interface TransactionUpdaterDAO {

    public void addTransactionUpdater(TransactionUpdater u);
    public void updateTransactionUpdater(TransactionUpdater u);
    public List<TransactionUpdater> listTransactionUpdaters();
    public TransactionUpdater getTransactionUpdaterById(int id); 
    public void removeTransactionUpdater(int id);
}
