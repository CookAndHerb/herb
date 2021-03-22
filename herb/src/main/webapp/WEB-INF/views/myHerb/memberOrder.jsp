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
                        <a href="#"><i class="fa fa-home"></i> My Herb</a>
                        <span>주문 목록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
            
            	<!-- 사이드바 -->
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    
                    <div class="filter-widget">
                        <h4 class="fw-title">My Herb</h4>
                        <ul class="filter-catagories" style="font-weight: bold;">
                            <li><a href="#" style="color:orange;">주문 조회</a></li>
                            <li><a href="memberUpdate.do"  >개인 정보 수정</a></li>
                            <li><a href="memberDelete.do" >탈퇴하기</a></li>
                        </ul>
                    </div>

                   
                </div>
                
                <!-- content 시작 -->
                <div class="col-lg-9 order-1 order-lg-2">
       
       		    <h2 style="font-weight:bold;">${member.userName}님의 허브</h2>
           		<h4 style="font-weight:bold; color:gray;">${member.userEmail}</h4>
           		<br>
           		<h3 style="font-weight:bold;">주문 조회</h3>
           		<br>
           		<br>
   				
   				<!-- 주문 목록 시작 -->
   	 <div class=""> <!-- 제일 큰 박스 -->
        <div class="container">
        <span>주문날짜</span><span>주문</span>
        <a>주문 상세 보기 ></a> <!-- 주문 날짜 -->
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                      
                    </div>
                </div>
                
        </div> <!-- 주문날짜, 주문상세보기 있는 박스 끝 -->
    </div><!-- 제일 큰 박스 끝 -->
   				
   				
   				 <!-- 주문 목록 끝-->
    
    
               </div>  <!-- content 끝 -->
                
                
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->


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