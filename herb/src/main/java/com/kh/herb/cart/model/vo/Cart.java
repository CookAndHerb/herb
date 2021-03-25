package com.kh.herb.cart.model.vo;

public class Cart {
	
	/*
	CREATE TABLE CART (
	CART_NUM	NUMBER	PRIMARY KEY,
	CART_STOCK	NUMBER	NOT NULL,
	CART_USER_ID	VARCHAR2(10)	NOT NULL,
	CART_P_NUM	NUMBER	NOT NULL
	);
	 
	*/
	
	private int cartNum; // 카트 번호
	private int cartStock; // 상품 갯수
	private String cartUserId; // 사용자 아이디
	private int cartPnum; // 상품 번호
	
	public Cart() {}
	
	public Cart(int cartNum, int cartStock, String cartUserId, int cartPnum) {
		super();
		this.cartNum = cartNum;
		this.cartStock = cartStock;
		this.cartUserId = cartUserId;
		this.cartPnum = cartPnum;
	}


	public int getCartNum() {
		return cartNum;
	}


	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}


	public int getCartStock() {
		return cartStock;
	}


	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}


	public String getCartUserId() {
		return cartUserId;
	}


	public void setCartUserId(String cartUserId) {
		this.cartUserId = cartUserId;
	}


	public int getCartPnum() {
		return cartPnum;
	}


	public void setCartPnum(int cartPnum) {
		this.cartPnum = cartPnum;
	}
	
	
	
}