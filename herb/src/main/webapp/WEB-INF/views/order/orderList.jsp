<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">

<style>
.box1 {text-align : center}
.box2 {display : inline-block}
.box3 {text-align : left}
</style>


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
                        <a href="index.do"><i class="fa fa-home"></i>장바구니</a>
                        <span>주문 완료</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->


 	
 	    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
         <form class="checkout-form box1">
                    
                    <!-- 주문 리스트  -->
                    <div class="col-lg-6 box2">
                        
                        <div class="place-order box3">
                            <h4>주문 목록</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>상품 <span>합계</span></li>
                                    
                                    <!-- 반복 시작 -->
                                    <c:set var="sum" value="0" /> <!-- 총 합계금액 구하기 위한 변수 선언 -->
                                    <c:forEach items="${orderDetailList}" var="orderDetailList">
                                    <li class="fw-normal">${orderDetailList.pName} x ${orderDetailList.orderDetailStock} <span><fmt:formatNumber pattern="###,###,###" value="${orderDetailList.pCost * orderDetailList.orderDetailStock}" /> 원</span></li>
                                    <c:set var="sum" value="${sum + (orderDetailList.pCost * orderDetailList.orderDetailStock)}"/> 
                                    </c:forEach>
                                    <!-- 반복 끝 -->
                                    <li class="fw-normal" style="color:gray; font-weight:bold;">배송비 <span>2,500원</span></li>
                                    <li class="total-price">총 합계 <span><fmt:formatNumber pattern="###,###,###" value="${sum + 2500}" />원</span></li>
                                </ul>
                                <h4>주문이 완료되었습니다.</h4>
                            </div>
                        </div>
                    
                        
                        
                        
                    </div>
                    </form>
                </div>
               
       <!--  </div> -->
    </section>
    <!-- Shopping Cart Section End -->
    
    
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