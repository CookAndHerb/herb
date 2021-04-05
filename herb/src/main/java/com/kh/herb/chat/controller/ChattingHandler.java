package com.kh.herb.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChattingHandler extends TextWebSocketHandler{
	
	private static final Logger log = LoggerFactory.getLogger(ChattingHandler.class);
	
	//세션리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	 //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        log.info("{} 연결됨", session.getId());  
        
        Map<String, Object> map = session.getAttributes();
    	String userId = (String) map.get("userId");
        
      //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(userId+"님이 입장하셨습니다. "));
        }
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	log.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    	
    	Map<String, Object> map = session.getAttributes();
    	String userId = (String) map.get("userId");
    	
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(userId+" : " +message.getPayload()));
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        log.info("{} 연결 끊김.", session.getId());
        
        Map<String, Object> map = session.getAttributes();
    	String userId = (String) map.get("userId");
        
      //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(userId+"님이 퇴장하셨습니다. "));
        }
    }

}