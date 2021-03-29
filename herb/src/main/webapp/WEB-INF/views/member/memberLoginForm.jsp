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

    <script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

	<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
   charset="utf-8"></script>   
   
	<link href="css/bootstrap.min.css" rel="stylesheet">
   
</head>
<body>
	<!-- 상단 공동 메뉴 -->
	<header>
		<%@ include file="../template/header.jsp" %>
	</header>
	    <!-- ##### Hero Area Start ##### -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="index.do"><i class="fa fa-home"></i> Home</a>
                        <span>Login</span>
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
                        <h2>Login</h2>
                        <form action="memberLogin.do" method="post">
                            <div class="group-input">
                                <label for="userId" style="font-weight:bold;">아이디 *</label>
                                <input type="text" id="userId" name="userId">
                            </div>
                            <div class="group-input">
                                <label for="userPw" style="font-weight:bold;">비밀번호 *</label>
                                <input type="password" id="userId" name="userPw">
                            </div>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                   <a href="memberPwSearch.do" class="forget-pass">비밀번호 찾기</a>
                                   <span class="forget-pass">&nbsp;&nbsp;/&nbsp;&nbsp;</span>
                                   <a href="memberIdSearch.do" class="forget-pass">아이디 찾기  </a>
                                </div>
                            </div>
                            <button type="submit"  class="site-btn login-btn">로그인</button>
                        
                        	<!-- <div id="naver_id_login" style="text-align: center">
                     		<a href="${naver_url}"><img style="width:250px; height:50px;" 
                        	src="${pageContext.request.contextPath}/resources/img/네이버.png" /></a>
                  			</div>
                         -->
                         <div id="naver_id_login" class="site-btn login-btn" style="background-color:green; border:green;">
                     		<a href="${naver_url}" style="color:white; text-align:center; margin-left:150px;">네이버 아이디로 로그인</a>
                  			</div>
                        </form>
                        <div class="switch-login">
                            <a href="memberJoin.do" class="or-login">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->


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