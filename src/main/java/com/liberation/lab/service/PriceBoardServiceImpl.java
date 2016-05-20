package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.PriceBoardDAO;
import com.liberation.lab.model.PriceBoard;

public class PriceBoardServiceImpl implements PriceBoardService{

    private PriceBoardDAO priceBoardDAO;
    
    public void setPriceBoardDAO(PriceBoardDAO priceBoardDAO) {
        this.priceBoardDAO = priceBoardDAO;
    }
 
    @Override
    @Transactional
    public void addPriceBoard(PriceBoard u) {
        this.priceBoardDAO.addPriceBoard(u);
    }
 
    @Override
    @Transactional
    public void updatePriceBoard(PriceBoard u) {
        this.priceBoardDAO.updatePriceBoard(u);
    }
 
    @Override
    @Transactional
    public List<PriceBoard> listPriceBoard() {
        return this.priceBoardDAO.listPriceBoard();
    }
 
    @Override
    @Transactional
    public PriceBoard getPriceBoardById(int id) {
        return this.priceBoardDAO.getPriceBoardById(id);
    }
 
    @Override
    @Transactional
    public void removePriceBoard(int id) {
        this.priceBoardDAO.removePriceBoard(id);
    }
 
}
