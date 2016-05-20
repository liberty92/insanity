package com.liberation.lab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "priceboard")
public class PriceBoard {

	@Id
	@Column(name = "priceBoardId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int priceBoardId;

	@Column(name = "stockId")
	private int stockId;

	@Column(name = "price")
	private Double price;

	@Column(name = "ceil")
	private Double ceil;

	@Column(name = "floor")
	private Double floor;

	@Column(name = "tradedQuantity")
	private Double tradedQuantity;

	@Column(name = "buy1")
	private Double buy1;

	@Column(name = "buy1Quantity")
	private Double buy1Quantity;

	@Column(name = "buy2")
	private Double buy2;

	@Column(name = "buy2Quantity")
	private Double buy2Quantity;

	@Column(name = "buy3")
	private Double buy3;

	@Column(name = "buy3Quantity")
	private Double buy3Quantity;

	@Column(name = "matchPrice")
	private Double matchPrice;

	@Column(name = "matchQuantity")
	private Double matchQuantity;

	@Column(name = "sell1")
	private Double sell1;

	@Column(name = "sell1Quantity")
	private Double sell1Quantity;

	@Column(name = "sell2")
	private Double sell2;

	@Column(name = "sell2Quantity")
	private Double sell2Quantity;

	@Column(name = "sell3")
	private Double sell3;

	@Column(name = "sell3Quantity")
	private Double sell3Quantity;
	
    @Column(name = "overbuy")
	private Double overbuy;
	
    @Column(name = "oversold")
	private Double oversold;
	
    @Column(name = "lowest")
	private Double lowest;
	
    @Column(name = "highest")
	private Double highest;

	
	
	
	
	public Double getOverbuy() {
		return overbuy;
	}

	public void setOverbuy(Double overbuy) {
		this.overbuy = overbuy;
	}

	public Double getOversold() {
		return oversold;
	}

	public void setOversold(Double oversold) {
		this.oversold = oversold;
	}

	public Double getLowest() {
		return lowest;
	}

	public void setLowest(Double lowest) {
		this.lowest = lowest;
	}

	public Double getHighest() {
		return highest;
	}

	public void setHighest(Double highest) {
		this.highest = highest;
	}

	public Double getMatchPrice() {
		return matchPrice;
	}

	public void setMatchPrice(Double matchPrice) {
		this.matchPrice = matchPrice;
	}

	public Double getMatchQuantity() {
		return matchQuantity;
	}

	public void setMatchQuantity(Double matchQuantity) {
		this.matchQuantity = matchQuantity;
	}

	public Double getSell1() {
		return sell1;
	}

	public void setSell1(Double sell1) {
		this.sell1 = sell1;
	}

	public Double getSell1Quantity() {
		return sell1Quantity;
	}

	public void setSell1Quantity(Double sell1Quantity) {
		this.sell1Quantity = sell1Quantity;
	}

	public Double getSell2() {
		return sell2;
	}

	public void setSell2(Double sell2) {
		this.sell2 = sell2;
	}

	public Double getSell2Quantity() {
		return sell2Quantity;
	}

	public void setSell2Quantity(Double sell2Quantity) {
		this.sell2Quantity = sell2Quantity;
	}

	public Double getSell3() {
		return sell3;
	}

	public void setSell3(Double sell3) {
		this.sell3 = sell3;
	}

	public Double getSell3Quantity() {
		return sell3Quantity;
	}

	public void setSell3Quantity(Double sell3Quantity) {
		this.sell3Quantity = sell3Quantity;
	}

	public Double getBuy1() {
		return buy1;
	}

	public void setBuy1(Double buy1) {
		this.buy1 = buy1;
	}

	public Double getBuy1Quantity() {
		return buy1Quantity;
	}

	public void setBuy1Quantity(Double buy1Quantity) {
		this.buy1Quantity = buy1Quantity;
	}

	public Double getBuy2() {
		return buy2;
	}

	public void setBuy2(Double buy2) {
		this.buy2 = buy2;
	}

	public Double getBuy2Quantity() {
		return buy2Quantity;
	}

	public void setBuy2Quantity(Double buy2Quantity) {
		this.buy2Quantity = buy2Quantity;
	}

	public Double getBuy3() {
		return buy3;
	}

	public void setBuy3(Double buy3) {
		this.buy3 = buy3;
	}

	public Double getBuy3Quantity() {
		return buy3Quantity;
	}

	public void setBuy3Quantity(Double buy3Quantity) {
		this.buy3Quantity = buy3Quantity;
	}

	public Double getCeil() {
		return ceil;
	}

	public void setCeil(Double ceil) {
		this.ceil = ceil;
	}

	public Double getFloor() {
		return floor;
	}

	public void setFloor(Double floor) {
		this.floor = floor;
	}

	public Double getTradedQuantity() {
		return tradedQuantity;
	}

	public void setTradedQuantity(Double tradedQuantity) {
		this.tradedQuantity = tradedQuantity;
	}

	public int getPriceBoardId() {
		return priceBoardId;
	}

	public void setPriceBoardId(int priceBoardId) {
		this.priceBoardId = priceBoardId;
	}

	public int getStockId() {
		return stockId;
	}

	public void setStockId(int stockId) {
		this.stockId = stockId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "priceBoardId=" + priceBoardId + ", stockId=" + stockId;
	}

}
