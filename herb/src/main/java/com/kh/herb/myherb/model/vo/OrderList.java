package com.kh.herb.myherb.model.vo;

import java.sql.Date;

public class OrderList {
	
	private int rNum;
	private int orderNum;
	private Date orderDate;
	private String orderStatus;
	private int orderAmount;
	private String orderRecvName;
	private String orderRecvAddress1;
	private String orderRecvAddress2;
	private String orderRecvAddress3;
	
	public OrderList() {}
	
	public OrderList(int rNum, int orderNum, Date orderDate, String orderStatus, int orderAmount,
			String orderRecvName, String orderRecvAddress1, String orderRecvAddress2, String orderRecvAddress3) {
		super();
		this.rNum = rNum;
		this.orderNum = orderNum;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.orderAmount = orderAmount;
		this.orderRecvName = orderRecvName;
		this.orderRecvAddress1 = orderRecvAddress1;
		this.orderRecvAddress2 = orderRecvAddress2;
		this.orderRecvAddress3 = orderRecvAddress3;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderRecvName() {
		return orderRecvName;
	}

	public void setOrderRecvName(String orderRecvName) {
		this.orderRecvName = orderRecvName;
	}

	public String getOrderRecvAddress1() {
		return orderRecvAddress1;
	}

	public void setOrderRecvAddress1(String orderRecvAddress1) {
		this.orderRecvAddress1 = orderRecvAddress1;
	}

	public String getOrderRecvAddress2() {
		return orderRecvAddress2;
	}

	public void setOrderRecvAddress2(String orderRecvAddress2) {
		this.orderRecvAddress2 = orderRecvAddress2;
	}

	public String getOrderRecvAddress3() {
		return orderRecvAddress3;
	}

	public void setOrderRecvAddress3(String orderRecvAddress3) {
		this.orderRecvAddress3 = orderRecvAddress3;
	}
	
	
	
	
}
