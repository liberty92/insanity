package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.PriceBoard;

public interface PriceBoardDAO {
	

    public void addPriceBoard(PriceBoard u);
    public void updatePriceBoard(PriceBoard u);
    public List<PriceBoard> listPriceBoard();
    public PriceBoard getPriceBoardById(int id);
    public void removePriceBoard(int id);

}
