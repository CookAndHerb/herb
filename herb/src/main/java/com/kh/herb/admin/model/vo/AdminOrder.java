package com.kh.herb.admin.model.vo;

import java.sql.Date;

public class AdminOrder {
	private int orderDetailNum;			//상품주문번호
	private int orderNum;				//주문번호
	private Date orderDate; 			//주문일
	private String orderRecvName;		//수령인
	private String userName;			//주문자
	private String userId;
	private String orderRecvAddress1;	//수령주소
	private String orderRecvAddress2;
	private String orderRecvAddress3;
	private String orderRecvPhone;		//연락처
	private String pName;				//상품명
	private int orderDetailStock;		//주문 수량
	private int orderAmount;			//총 주문금액
	private String orderStatus;			//배송상태
	private String orderMessage;
	private String orderDel;			//주문 취소 여부
	
	public AdminOrder() {}
	public AdminOrder(int orderDetailNum, int orderNum, Date orderDate, String orderRecvName, String userName,
			String orderRecvAddress1, String orderRecvAddress2, String orderRecvAddress3, String orderRecvPhone,
			String pName, int orderDetailStock, int orderAmount, String orderStatus, String orderDel) {
		super();
		this.orderDetailNum = orderDetailNum;
		this.orderNum = orderNum;
		this.orderDate = orderDate;
		this.orderRecvName = orderRecvName;
		this.userName = userName;
		this.orderRecvAddress1 = orderRecvAddress1;
		this.orderRecvAddress2 = orderRecvAddress2;
		this.orderRecvAddress3 = orderRecvAddress3;
		this.orderRecvPhone = orderRecvPhone;
		this.pName = pName;
		this.orderDetailStock = orderDetailStock;
		this.orderAmount = orderAmount;
		this.orderStatus = orderStatus;
		this.orderDel = orderDel;
	}
	
	public int getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(int orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
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
	public String getOrderRecvName() {
		return orderRecvName;
	}
	public void setOrderRecvName(String orderRecvName) {
		this.orderRecvName = orderRecvName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getOrderDetailStock() {
		return orderDetailStock;
	}
	public void setOrderDetailStock(int orderDetailStock) {
		this.orderDetailStock = orderDetailStock;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderDel() {
		return orderDel;
	}
	public void setOrderDel(String orderDel) {
		this.orderDel = orderDel;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderMessage() {
		return orderMessage;
	}
	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}
	
	
}
