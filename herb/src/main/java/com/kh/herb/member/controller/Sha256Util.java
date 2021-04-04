package com.kh.herb.member.controller;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component
public class Sha256Util {
	
	public String encryData(String data) throws Exception{
		
		// import java.security.MessageDigest;
		// 암호화를 처리할 수 있는 MessageDigest 객체를 생성 (java에서 기본 제공)
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256"); // SHA-256 알고리즘 사용
		
		// 생성된 MessageDigest 객체를 가지고 데이터를 암호화
		// update 메소드를 사용할 때에는 (String data로 받은) 문자열을 Byte배열(data.getBytes())로 변경해서  mDigest에 넘겨주어야 함
		mDigest.update(data.getBytes());
		
		byte [] msgStr = mDigest.digest(); // SHA-256으로 변환하여 데이터를 가져오는 메소드 (256bit=32Byte 배열로 넘어옴)
		
		//System.out.println("암호화 데이터 길이 : "+msgStr.length);
		
		// 현재 데이터는 10진수로 표기가 되기 때문에 16진수로 바꾸어서 표기할 수 있어야 함
		StringBuffer hexString = new StringBuffer();
		
		for(byte d : msgStr) {
			hexString.append(String.format("%02x", d));
			
			// %02X : 16진수를 2자리 대문자로 표기
			// 예 ) ff -> FF / ac -> AC / 3 -> 03
			
		
		}
		return hexString.toString(); // 암호화 된 데이터를 리턴
	}
}
