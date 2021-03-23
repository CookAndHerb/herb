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
                        <span>비밀번호 변경하기</span>
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
                        <h2>비밀번호 변경하기</h2>
                        <form action="memberPwUpdate.do" method="post">
                        <div class="group-input">
                                <label for="userId" style="font-weight:bold;">아이디 </label>
                                <input type="text" id="userId" name="userId" value="${userId}" readonly="readonly">
                            </div>
                            <div class="group-input">
                                <label for="userPw" style="font-weight:bold;">새 비밀번호 *</label>
                                <input type="password" name="userPw" id="userPw" onkeyup="pwCheckFunction();" placeholder="새 비밀번호를 입력해주세요." required>
                                <span id="pwCheckMessage"  style="color:red;font-weight:bold"></span>
                            </div>
                                                        <div class="group-input">
                                <label for="userPwRe" style="font-weight:bold;">새 비밀번호 재입력 *</label>
                                <input type="password" name="userPwRe" id="userPwRe" onkeyup="passwordCheckFunction();" placeholder="비밀번호를 한 번 더 입력해주세요." required>
                                <span id="passwordCheckMessage"  style="color:red; font-weight:bold"></span>
                            </div>
                            
                            
                            <button type="submit" class="site-btn login-btn" id="join_btn" disabled>비밀번호 변경하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
	<script>
	
	function pwCheckFunction(){
		var userPw = $('input[name=userPw]');
		//영어+숫자 섞어서 5글자~10글자
		if (/^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$/.test(userPw.val())) {
			$('#pwCheckMessage').html('');
			$("#join_btn").removeAttr("disabled");
		}else{
			$('#pwCheckMessage').html('소문자와 숫자를 포함하여 5~10글자 이내로 입력해주세요.');
			$("#join_btn").attr("disabled", "disabled");
		}
	}
	
	function passwordCheckFunction(){
        var userPw = $('#userPw').val();
        var userPwRe = $('#userPwRe').val();
        if(userPw!=userPwRe){
            $('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
            $("#join_btn").attr("disabled", "disabled");
        }
        else{
            $('#passwordCheckMessage').html("");
            $("#join_btn").removeAttr("disabled");
        }
    }
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