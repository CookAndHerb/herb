package com.kh.herb.member.model.vo;

import java.sql.Date;

public class Member {

		private int userNum;
		private String userId;
		private String userPw;
		private String userName;
		private String userPhone;
		private String userEmail;
		private int userAddress1;
		private String userAddress2;
		private String userAddress3;
		private String userBirth;
		private String userDel;
		private Date userDate;
		
		public Member() {}

		public Member(int userNum, String userId, String userPw, String userName, String userPhone, String userEmail,
				int userAddress1, String userAddress2, String userAddress3, String userBirth, String userDel,
				Date userDate) {
			super();
			this.userNum = userNum;
			this.userId = userId;
			this.userPw = userPw;
			this.userName = userName;
			this.userPhone = userPhone;
			this.userEmail = userEmail;
			this.userAddress1 = userAddress1;
			this.userAddress2 = userAddress2;
			this.userAddress3 = userAddress3;
			this.userBirth = userBirth;
			this.userDel = userDel;
			this.userDate = userDate;
		}

		public int getUserNum() {
			return userNum;
		}

		public void setUserNum(int userNum) {
			this.userNum = userNum;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getUserPw() {
			return userPw;
		}

		public void setUserPw(String userPw) {
			this.userPw = userPw;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getUserPhone() {
			return userPhone;
		}

		public void setUserPhone(String userPhone) {
			this.userPhone = userPhone;
		}

		public String getUserEmail() {
			return userEmail;
		}

		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}

		public int getUserAddress1() {
			return userAddress1;
		}

		public void setUserAddress1(int userAddress1) {
			this.userAddress1 = userAddress1;
		}

		public String getUserAddress2() {
			return userAddress2;
		}

		public void setUserAddress2(String userAddress2) {
			this.userAddress2 = userAddress2;
		}

		public String getUserAddress3() {
			return userAddress3;
		}

		public void setUserAddress3(String userAddress3) {
			this.userAddress3 = userAddress3;
		}

		public String getUserBirth() {
			return userBirth;
		}

		public void setUserBirth(String userBirth) {
			this.userBirth = userBirth;
		}

		public String getUserDel() {
			return userDel;
		}

		public void setUserDel(String userDel) {
			this.userDel = userDel;
		}

		public Date getUserDate() {
			return userDate;
		}

		public void setUserDate(Date userDate) {
			this.userDate = userDate;
		}
		

		
		
}
