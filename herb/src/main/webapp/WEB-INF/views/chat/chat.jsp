<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">    
    
<style>
	*{
		margin: auto;
	}
	#sendBtn{
		background: #e7ab3c;
		color: white;
		border: white;
	}
	#chatArea{
		width: 320px;
		text-align: center;
	}
	#message{
		width: 250px;
	}
	#messageArea{
		width: 320px;
	}


.container {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

/* Darker chat container */
.darker {
  border-color: #ccc;
  background-color: #ddd;
}

/* Clear floats */
.container::after {
  content: "";
  clear: both;
  display: table;
}

</style>
</head>
<body>
	<div id="messageArea">
		<div class="container"></div>
	</div>
	<div id="chatArea">
		<input type="text" id="message" /> 
		<input type="button" id="sendBtn" class="btn" value="전송"/>
	</div>
</body>
<script type="text/javascript">
 	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	}); 
 	
 	
 	$('#message').keypress(function(e){
 		if(e.keyCode == 13){
 			sendMessage();
 			$('#message').val('')
 		}
 	});

	let sock = new SockJS("http://localhost:8181/herb/chat");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
		
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;

		$(".container").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>

</html>