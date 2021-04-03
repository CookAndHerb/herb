<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <style>
    	#listArea{
			display: inline-block;
			width: 420px;
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
                        <a href="#"><i class="fa fa-home"></i> Admin</a>
                        <!-- <span>카테고리 적기</span> -->
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
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    
                    <div class="filter-widget">
                        <h4 class="fw-title">Admin</h4>
                        <ul class="filter-catagories" style="font-weight: bold;">
                            <li><a href="adminProduct.do" >상품관리</a></li>
                            <li><a href="adminOrder.do" >주문관리</a></li>
                            <li><a href="adminMember.do" >회원관리</a></li>
                        </ul>
                    </div>

                   
                </div>
                
                <!-- 내용 -->
                <div class="col-lg-9 order-1 order-lg-2">
                
                <!-- 매출, 판매량 정보 -->
                <div id="eventing">매출 정보</div>
                 <p> 총 매출액 : <fmt:formatNumber pattern="###,###,###" value="${totalSales}" />원</p>
                <%@ include file="adminChart.jsp" %>
                <br><br><br>
                
				<!-- 공지사항 리스트 -->
				<div id="listArea">
				<div id="eventing">공지사항</div>
				<table class="table table-bordered" style="text-align:center; font-size: small;">
  					  <thead>
     					 <tr>
        					<th style="width:55px">번호</th>
    					    <th>제목</th>
      					</tr>
    				</thead>
    				<tbody>
    				<c:forEach var="notice" items="${notice}">
      					<tr>
        					<td>${notice.noticeNum }</td>
        					<td><a href="noticePage.do?noticeNum=${notice.noticeNum}&page=1" style="color:black; float:left;">${notice.noticeTitle }</a></td>
      					</tr>
      				</c:forEach>		
    			</tbody>
  				</table>
  				</div>
  				
  				<!-- QA 리스트 -->
  				<div id="listArea">
  					<div id="eventing">질문 게시판</div>
				<table class="table table-bordered" style="text-align:center; font-size: small;">
  					  <thead>
     					 <tr>
        					<th style="width:55px">번호</th>
    					    <th>제목</th>
      					</tr>
    				</thead>
    				<tbody>
    				<c:forEach var="qa" items="${Qa}">
      					<tr>
        					<td>${qa.qaNum}</td>
        					<td><a href="qaPwForm.do?qaNum=${qa.qaNum}&curPage=1" style="color:black; float:left;">
						${qa.qaTitle}</a></td>
      					</tr>
      				</c:forEach>		
    			</tbody>
  				</table>
  				</div>
				
                 <br><br><br>
                 <div id="eventing">진행 중 이벤트</div>
                  <img class="banner" src="${pageContext.request.contextPath}/resources/img/sujung/banner1.JPG">
                  <img class="banner" src="${pageContext.request.contextPath}/resources/img/sujung/banner2.JPG">
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