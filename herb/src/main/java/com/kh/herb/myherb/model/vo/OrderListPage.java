package com.kh.herb.myherb.model.vo;

public class OrderListPage {
	
	private String orderUserId;
	private int start;
	private int end;
	
	
	public OrderListPage() {}
	
	public OrderListPage(String orderUserId, int start, int end) {
		super();
		this.orderUserId = orderUserId;
		this.start = start;
		this.end = end;
	}
	
	
	public void setOrderUserId(String orderUserId) {
		this.orderUserId = orderUserId;
	}
	
	public String getOrderUserId() {
		return orderUserId;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
}