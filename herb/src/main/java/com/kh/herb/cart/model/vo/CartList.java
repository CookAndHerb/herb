package com.kh.herb.cart.model.vo;

public class CartList {

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
	
	private int num;
	private String pName; // 상품명
	private int pCost; // 상품 가격
	private String pImageName; // 썸네일 이름
	private String pImagePath; // 썸네일 경로
	
	public CartList() {}
	
	public CartList(int cartNum, int cartStock, String cartUserId, int cartPnum, int num, String pName, int pCost,
			String pImageName, String pImagePath) {
		super();
		this.cartNum = cartNum;
		this.cartStock = cartStock;
		this.cartUserId = cartUserId;
		this.cartPnum = cartPnum;
		this.num = num;
		this.pName = pName;
		this.pCost = pCost;
		this.pImageName = pImageName;
		this.pImagePath = pImagePath;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpCost() {
		return pCost;
	}

	public void setpCost(int pCost) {
		this.pCost = pCost;
	}

	public String getpImageName() {
		return pImageName;
	}

	public void setpImageName(String pImageName) {
		this.pImageName = pImageName;
	}

	public String getpImagePath() {
		return pImagePath;
	}

	public void setpImagePath(String pImagePath) {
		this.pImagePath = pImagePath;
	}
	
	
	
}
