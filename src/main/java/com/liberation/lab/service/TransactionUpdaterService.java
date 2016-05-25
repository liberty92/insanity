package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.TransactionUpdater;

public interface TransactionUpdaterService {

    public void addTransactionUpdater(TransactionUpdater u);
    public void updateTransactionUpdater(TransactionUpdater u);
    public List<TransactionUpdater> listTransactionUpdaters();
    public TransactionUpdater getTransactionUpdaterById(int id); 
    public void removeTransactionUpdater(int id);
}
