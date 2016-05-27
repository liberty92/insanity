package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.TradingFee;

public interface TradingFeeService {

    public void addTradingFee(TradingFee u);
    public void updateTradingFee(TradingFee u);
    public List<TradingFee> listTradingFees();
    public TradingFee getTradingFeeById(int id);
    public void removeTradingFee(int id);
}
