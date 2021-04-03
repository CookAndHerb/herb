package com.kh.herb.order.model.vo;

public class OrderDetail {
	public int orderDetailNum;
	public int orderDetailStock;
	public int orderNum;
	public int orderDetailPNum;
	public String userId;
	
	public OrderDetail() {}
	
	public OrderDetail(int orderDetailNum, int orderDetailStock, int orderNum, int orderDetailPNum, String userId) {
		super();
		this.orderDetailNum = orderDetailNum;
		this.orderDetailStock = orderDetailStock;
		this.orderNum = orderNum;
		this.orderDetailPNum = orderDetailPNum;
		this.userId = userId;
	}

	public int getOrderDetailNum() {
		return orderDetailNum;
	}

	public void setOrderDetailNum(int orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}

	public int getOrderDetailStock() {
		return orderDetailStock;
	}

	public void setOrderDetailStock(int orderDetailStock) {
		this.orderDetailStock = orderDetailStock;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getOrderDetailPNum() {
		return orderDetailPNum;
	}

	public void setOrderDetailPNum(int orderDetailPNum) {
		this.orderDetailPNum = orderDetailPNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
}
