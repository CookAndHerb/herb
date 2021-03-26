package com.kh.herb.admin.model.vo;

import java.sql.Date;

public class AdminOrder {
	private int orderDetailNum;			//상품주문번호
	private int orderNum;				//주문번호
	private Date orderDate; 			//주문일
	private String orderRecvName;		//수령인
	private String userName;			//주문자
	private String orderRecvAddress1;	//수령주소
	private String orderRecvAddress2;
	private String orderRecvAddress3;
	private String orderRecvPhone;		//연락처
	private String pName;				//상품명
	private int orderDetailStock;		//주문 수량
	private int orderAmount;			//총 주문금액
	private String orderStatus;				//배송상태
	private String orderDel;
}
