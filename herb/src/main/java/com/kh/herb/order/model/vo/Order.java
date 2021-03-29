package com.kh.herb.order.model.vo;

import java.sql.Date;

public class Order {
	public int orderNum;
	public String orderRecvName;
	public String orderRecvAddr1;
	public String orderRecvAddr2;
	public String orderRecvAddr3;
	public String orderRecvPhone;
	public Date orderDate;
	public String orderDel;
	public int orderAmount;
	public String orderMessage;
	public String orderStatus;
	public String orderUserId;
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
	public String getOrderRecvAddr1() {
		return orderRecvAddr1;
	}
	public void setOrderRecvAddr1(String orderRecvAddr1) {
		this.orderRecvAddr1 = orderRecvAddr1;
	}
	public String getOrderRecvAddr2() {
		return orderRecvAddr2;
	}
	public void setOrderRecvAddr2(String orderRecvAddr2) {
		this.orderRecvAddr2 = orderRecvAddr2;
	}
	public String getOrderRecvAddr3() {
		return orderRecvAddr3;
	}
	public void setOrderRecvAddr3(String orderRecvAddr3) {
		this.orderRecvAddr3 = orderRecvAddr3;
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
	
	
}
