package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.Stock;

public interface StockDAO {
	

    public void addStock(Stock u);
    public void updateStock(Stock u);
    public List<Stock> listStock();
    public Stock getStockById(int id);
    public void removeStock(int id);

}
