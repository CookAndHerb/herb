<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
    <style>
 		#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:30px; box-shadow:2px 2px 3px 1px gray; }
 		#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
 		
 		.my.pagination > .active > a, 
		.my.pagination > .active > span, 
		.my.pagination > .active > a:hover, 
		.my.pagination > .active > span:hover, 
		.my.pagination > .active > a:focus, 
		.my.pagination > .active > span:focus {
 			background: #e7ab3c;
  			border-color: #e7ab3c;
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
                            <li><a href="memberOrder.do" style="color:orange;">주문 조회</a></li>
                            <li><a href="memberReview.do" >구매 후기</a></li>
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
                
                <div id="content">
 
 					<ul class="orderList" style="list-style:none;">
  						<c:forEach items="${orderList}" var="orderList">
  					
  							<li>
 								 <div>
  									 <p><span>주문번호</span><a href="memberOrderDetail.do?orderNum=${orderList.orderNum}" style="font-weight:bold ; color:#e7ab3c; ">${orderList.orderNum}</a></p>
  									 <p><span>주문일자</span><fmt:formatDate value="${orderList.orderDate}" type="date"/></p>
  									 <p><span>수령인</span>${orderList.orderRecvName}</p>
   									 <p><span>주소</span>(${orderList.orderRecvAddress1}) ${orderList.orderRecvAddress2} ${orderList.orderRecvAddress3}</p>
     							     <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.orderAmount}" /> 원</p>
           						</div>
  							</li>
  						</c:forEach>
 					</ul>

				</div> <!-- 주문 목록 끝 -->
   
   				<!-- 페이징 시작-->
   				<!-- Center-aligned -->
   				
				<ul class="pagination justify-content-center my" style="margin-top:70px; margin-bottom:20px; ">
  					  	<c:choose>
							<c:when test="${startNavi == 1}">
           						 <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
							</c:when>
							<c:otherwise>
 								<li class="page-item"><a class="page-link" href="memberOrder.do?page=${currentPage-1}">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="page" begin="${startNavi}" end="${endNavi}">
							<c:choose>
								<c:when test="${currentPage == page}">
            						<li class="page-item active"><a class="page-link" href="#">${page }</a></li>
								</c:when>
	
								<c:otherwise>
            						<li class="page-item "><a class="page-link" href="memberOrder.do?page=${page}" style="color:black;">${page}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:choose>
							<c:when  test="${endNavi == maxPage}">
            					<li class="page-item disabled" ><a class="page-link" href="#">다음</a></li>	
            				</c:when>
							<c:otherwise>
	 							<li class="page-item"><a class="page-link" href="memberOrder.do?page=${endNavi+1}">다음</a></li>
							</c:otherwise>
						</c:choose>   
				</ul>
   					
   				<!-- 페이징 끝 -->
    			</div> <!-- content 끝 -->
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