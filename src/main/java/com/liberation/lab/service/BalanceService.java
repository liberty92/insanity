package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.Balance;

public interface BalanceService {

    public void addBalance(Balance u);
    public void updateBalance(Balance u);
    public List<Balance> listBalances();
    public Balance getBalanceById(int id);
    public List<Balance> getBalanceByUserId(int userId);
    public void removeBalance(int id);
}
