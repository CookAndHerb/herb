<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>어른허브</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
    
    <script type="text/javascript"    src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
</head>
<body>
	<!-- 상단 공동 메뉴 -->
	<header>
		<%@ include file="../template/header.jsp" %>
	</header>
   <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="index.do"><i class="fa fa-home"></i> Home</a>
                        <span>비밀번호 찾기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->	

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>비밀번호 찾기</h2>
                        <form action="memberPwSearch.do" method="post">
                            <div class="group-input">
                                <label for="userId" style="font-weight:bold;">아이디 *</label>
                                <input type="text" name="userId" id="userId" placeholder="아이디 입력해주세요." required>
                            </div>
                            <div class="group-input">
                                <label for="userEmail" style="font-weight:bold;">이메일 *</label>
                                
                                <input type="text"  name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요." 
                                style="display: inline-block; width: 70%;"
                                required>
                                <input type="button" class="btn btn-secondary btn-block col-3" id="keyBtn" value="인증번호" style="display: inline-block;">
                                <br>
                                
                            	<span id="emailCheckMessage" style="color:red;font-weight:bold"></span>
                            	<br>
                            	<label for="code" style="font-weight:bold;">인증번호 *</label>
                            	<input type="text" name="userEmailNum" id="userEmailNum" placeholder="인증번호를 입력해주세요" required 
                            	style="display: inline-block; width: 70%;">
                            	<input type="button" class="btn btn-secondary btn-block col-3" id="emailCheckNum" value="인증하기" style="display: inline-block;">
                            	<br><br>
                            	<span id="emailNumCheckMessage" style="color:red; font-weight:bold"></span>
                            </div>
     							
                            <button type="submit" class="site-btn login-btn" id="submitBtn" disabled>비밀번호 변경하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    	<script>

		var code = "";
		$(function(){ //onload()
			$('#keyBtn').on('click', function(){
				
				//var userId = $('#userId').val();
				//var userEmail = $('#userEmail').val();
				$.ajax({
					url:'memberFindPwEmail.do',
					data : {'userId':$('#userId').val(), 'userEmail': $('#userEmail').val()},
					type: 'POST',
					dataType : 'json',
					success : function(data){
						if(data.ok==""){
							alert('아이디와 이메일 주소가 일치하지 않습니다.');
							console.log("서버 호출을 정상적으로 완료하였습니다.");
							console.log(data.ok);
						}else{
							$('#emailCheckMessage').html('인증번호가 발송되었습니다.');
							code = data.code;
								
						}
					},
					 error : function(data){
						alert('전송 오류. 아이디와 비밀번호를 확인해주세요.');
						console.log("서버 호출을 정상적으로 처리하지 못 했습니다.");
						console.log(data.ok);
					} 
				});
			});
		});
		
		$('#emailCheckNum').on("click", function(){
			var userEmailNum = $("#userEmailNum").val();
			if(userEmailNum == ''){
				$('#emailNumCheckMessage').html('인증번호를 입력해 주세요');
				return false;
			}
			
				if(userEmailNum == code){ 
					alert("인증번호가 확인되었습니다.");
					$('#emailNumCheckMessage').html('');
					$("#submitBtn").removeAttr("disabled");
				
					}else{
						alert("인증번호가 맞지 않습니다");
						$('#emailNumCheckMessage').html('');
						$("#submitBtn").attr("disabled", "disabled");
					}
		});
		
	</script>
	
	<!-- 하단 -->
	<footer>
		<%@ include file="../template/footer.jsp" %>
	</footer>
 	        <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>   

</body>
</html>