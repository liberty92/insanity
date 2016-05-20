package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.StockDAO;
import com.liberation.lab.model.Stock;

public class StockServiceImpl implements StockService{

    private StockDAO stockDAO;
    
    public void setStockDAO(StockDAO stockDAO) {
        this.stockDAO = stockDAO;
    }
 
    @Override
    @Transactional
    public void addStock(Stock u) {
        this.stockDAO.addStock(u);
    }
 
    @Override
    @Transactional
    public void updateStock(Stock u) {
        this.stockDAO.updateStock(u);
    }
 
    @Override
    @Transactional
    public List<Stock> listStock() {
        return this.stockDAO.listStock();
    }
 
    @Override
    @Transactional
    public Stock getStockById(int id) {
        return this.stockDAO.getStockById(id);
    }
 
    @Override
    @Transactional
    public void removeStock(int id) {
        this.stockDAO.removeStock(id);
    }
 
}
