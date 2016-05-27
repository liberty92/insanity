package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.TradingFeeDAO;
import com.liberation.lab.model.TradingFee;

public class TradingFeeServiceImpl implements TradingFeeService{

    private TradingFeeDAO tradingFeeDAO;
    
    public void setTradingFeeDAO(TradingFeeDAO tradingFeeDAO) {
        this.tradingFeeDAO = tradingFeeDAO;
    }
 
    @Override
    @Transactional
    public void addTradingFee(TradingFee u) {
        this.tradingFeeDAO.addTradingFee(u);
    }
 
    @Override
    @Transactional
    public void updateTradingFee(TradingFee u) {
        this.tradingFeeDAO.updateTradingFee(u);
    }
 
    @Override
    @Transactional
    public List<TradingFee> listTradingFees() {
        return this.tradingFeeDAO.listTradingFees();
    }
 
    @Override
    @Transactional
    public TradingFee getTradingFeeById(int id) {
        return this.tradingFeeDAO.getTradingFeeById(id);
    }
 
    @Override
    @Transactional
    public void removeTradingFee(int id) {
        this.tradingFeeDAO.removeTradingFee(id);
    } 
}
