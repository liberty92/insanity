package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.TradingFee;

public interface TradingFeeDAO {

    public void addTradingFee(TradingFee u);
    public void updateTradingFee(TradingFee u);
    public List<TradingFee> listTradingFees();
    public TradingFee getTradingFeeById(int id);
    public void removeTradingFee(int id);
}
