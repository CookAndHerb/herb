package com.kh.herb.myherb.model.vo;

import java.sql.Date;

public class OrderDetailList {
	
	private int orderNum;
	private String orderRecvName;
	private String orderRecvAddress1;
	private String orderRecvAddress2;
	private String orderRecvAddress3;
	private String orderRecvPhone;
	private Date orderDate;
	private String orderDel;
	private int orderAmount;
	private String orderMessage;
	private String orderStatus;
	private String orderUserId;
	private int orderDetailNumber;
	private int orderDetailStock;
	private int orderDetailPnum;
	private String pName;
	private String pImageName;
	private int pCost;
	
	public OrderDetailList() {}
	
	public OrderDetailList(int orderNum, String orderRecvName, String orderRecvAddress1, String orderRecvAddress2,
			String orderRecvAddress3, String orderRecvPhone, Date orderDate, String orderDel, int orderAmount,
			String orderMessage, String orderStatus, String orderUserId, int orderDetailNumber, int orderDetailStock,
			int orderDetailPnum, String pName, String pImageName, int pCost) {
		super();
		this.orderNum = orderNum;
		this.orderRecvName = orderRecvName;
		this.orderRecvAddress1 = orderRecvAddress1;
		this.orderRecvAddress2 = orderRecvAddress2;
		this.orderRecvAddress3 = orderRecvAddress3;
		this.orderRecvPhone = orderRecvPhone;
		this.orderDate = orderDate;
		this.orderDel = orderDel;
		this.orderAmount = orderAmount;
		this.orderMessage = orderMessage;
		this.orderStatus = orderStatus;
		this.orderUserId = orderUserId;
		this.orderDetailNumber = orderDetailNumber;
		this.orderDetailStock = orderDetailStock;
		this.orderDetailPnum = orderDetailPnum;
		this.pName = pName;
		this.pImageName = pImageName;
		this.pCost = pCost;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
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

	public String getOrderRecvPhone() {
		return orderRecvPhone;
	}

	public void setOrderRecvPhone(String orderRecvPhone) {
		this.orderRecvPhone = orderRecvPhone;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderDel() {
		return orderDel;
	}

	public void setOrderDel(String orderDel) {
		this.orderDel = orderDel;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderMessage() {
		return orderMessage;
	}

	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderUserId() {
		return orderUserId;
	}

	public void setOrderUserId(String orderUserId) {
		this.orderUserId = orderUserId;
	}

	public int getOrderDetailNumber() {
		return orderDetailNumber;
	}

	public void setOrderDetailNumber(int orderDetailNumber) {
		this.orderDetailNumber = orderDetailNumber;
	}

	public int getOrderDetailStock() {
		return orderDetailStock;
	}

	public void setOrderDetailStock(int orderDetailStock) {
		this.orderDetailStock = orderDetailStock;
	}

	public int getOrderDetailPnum() {
		return orderDetailPnum;
	}

	public void setOrderDetailPnum(int orderDetailPnum) {
		this.orderDetailPnum = orderDetailPnum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpImageName() {
		return pImageName;
	}

	public void setpImageName(String pImageName) {
		this.pImageName = pImageName;
	}

	public int getpCost() {
		return pCost;
	}

	public void setpCost(int pCost) {
		this.pCost = pCost;
	}
	
	
	
	
}
