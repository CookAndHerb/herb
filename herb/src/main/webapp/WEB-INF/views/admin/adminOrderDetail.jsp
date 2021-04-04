<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <!-- Icon -->
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
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
    <!-- sujung css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sujung.css" type="text/css">
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<style>
	table th{
		background: WhiteSmoke;
	}
</style>
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
                        <a href="adminMain.do"><i class="fa fa-home"></i> Admin</a>
                        <span>주문관리</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!--content 시작 -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
            
            	<!-- 사이드바 -->
                <div class="col-lg-2 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    
                    <div class="filter-widget">
                        <h4 class="fw-title">Admin</h4>
                        <ul class="filter-catagories" style="font-weight: bold;">
                            <li><a href="adminProduct.do" >상품관리</a></li>
                            <li><a href="adminOrder.do" style="color: #e7ab3c">주문관리</a></li>
                            <li><a href="adminMember.do" >회원관리</a></li>
                        </ul>
                    </div>              
                </div>
                
                <!-- 내용 -->
                <div class="col-lg-10 order-1 order-lg-2">

               	<h3><i class='fas fa-box' style='font-size:32px; color:#e7ab3c'></i> 상품 주문 정보 조회</h3>
                <br><br>
				<div id="orderNum">&nbsp;&nbsp; 주문번호 : <span id="spanNum">${order[0].orderNum} </span></div>
					<br>
					<div class="container">
					<h5><b>주문 상세 정보</b></h5>
						<table class="table table-bordered">
						<c:forEach var="order" items="${order}">
								<tr>
									<th width="150px;">상품별 주문 번호</th>
									<td width="70px;">${order.orderDetailNum}</td>
									<th width="80px;">상품 명</th>
									<td>
										${order.pName}
									</td>
									<th width="100px;">주문 수량</th>
									<td width="70px;">${order.orderDetailStock }</td>					
								</tr>
							</c:forEach>
						</table>
						  <table class="table table-bordered">
								<tr>
									<th width="225px;">상품 주문 상태</th>
									<td>결제 완료</td>
									<th width="225px;">주문 취소 여부(N/Y)</th>
									<td>${order[0].orderDel }</td>
								</tr>
								<tr>
									<th>구매자 명</th>
									<td>${order[0].userName }</td>
									<th>구매자 ID</th>
									<td>${order[0].userId }
								</tr>
								<tr>
									<th>총 주문 금액</th>
									<td><fmt:formatNumber pattern="###,###,###" value="${order[0].orderAmount}" />원</td>
									<th>배송비</th>
									<td>2,500원</td>					
								</tr>
						</table>
						
						 <h5><b>배송 상세 정보</b></h5>
						 <c:choose>
							<c:when test="${order[0].orderDel == 'Y'}">
								<table class="table table-bordered">
								<tr>
								<th width="225px;">배송상태</th>
								<td style="text-align: left;"> 구매 취소 </td>
								</tr>
								</table>
                         	</c:when>
                         	<c:otherwise>
						<table class="table table-bordered">
								<tr>
									<th width="225px;">수취인명 </th>
									<td colspan="3">${order[0].orderRecvName}</td>
									
								</tr>
								<tr>
									<th>연락처</th>
									<td width="225px;" >${order[0].orderRecvPhone }</td>
									<th width="225px;">배송상태</th>
									<td>${order[0].orderStatus}</td>
	
								</tr>
								<tr>
									<th>배송지</th>
									<td colspan="3">(${order[0].orderRecvAddress1 }) ${order[0].orderRecvAddress2} ${order[0].orderRecvAddress3}</td>
								</tr>
								<tr>
									<th>배송 메세지</th>
									<td colspan="3">${order[0].orderMessage }</td>
								</tr>
							</table>
							</c:otherwise>
						</c:choose>
					</div>
					<div style="text-align: right;">
						<button class="btn btn-sm" id="orderBtn" onclick="location.href = 'adminOrder.do';">주문 목록</button>
					</div>
				</div>
            </div>
        </div>
    </section>
    <!-- content 끝 -->


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