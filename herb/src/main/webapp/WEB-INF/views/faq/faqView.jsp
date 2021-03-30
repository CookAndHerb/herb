<%@page import="com.kh.herb.member.model.vo.Member"%>
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
<style>
table {
	border-collapse: separate;
  	border-spacing: 1px;
  	text-align: left;
  	line-height: 1.5;
  	/* border: 1px solid #ccc; */
  	margin: 20px 10px;
}
.theader {
	width: 150px;
  	padding: 10px;
  	font-weight: bold;
  	vertical-align: top;
  	border-bottom: 1px solid #e7ab3c;
  	background: #e7ab3c;
}
table td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #e7ab3c;
}
 #btn_search {
	background-color : #e7ab3c;
	border-color : #e7ab3c;
}
#btn_write {
	background-color : #636363;
	border-color : #636363;
}
#btn_update {
	background-color : #e7ab3c;
	border-color : #e7ab3c;
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
                        <a href="#"><i class="fa fa-home"></i>고객 센터</a>
                        <span>자주 묻는 질문</span>
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
                        <h4 class="fw-title">고객 센터</h4>
                        <ul class="filter-catagories" style="font-weight: bold;">
                            <li><a href="noticeList.do" >공지사항</a></li>
                            <li><a href="faqList.do" >자주 묻는 질문</a></li>
                            <li><a href="qaList.do" >질문 게시판</a></li>
                        </ul>
                    </div>

                   
                </div>
                
                <!-- 내용 -->
                <div class="col-lg-9 order-1 order-lg-2">
                  <form method="post" action="faqView.do">
					<table style="width:90%">
						<tr>
							<td class="theader">제목</td>
							<td colspan="4">${faq.faqTitle }</td>
						</tr>
						<tr>
							<td class="theader">카테고리</td>
							<td>${faq.faqCategory }</td>
							<td class="theader">조회수</td>
							<td>${faq.readcount }</td>
						</tr>
						<tr>
							<td colspan="4">${faq.faqContent }</td>
						</tr>
					</table>
				</form>
				<div align="center">
					<input type="button" class="btn btn-light" value="목록" onclick="location.href='faqList.do'">
					<!-- 관리자만 수정, 삭제 버튼 표시 -->
					<% Member mb = (Member)session.getAttribute("member"); 
					 	if(mb != null && mb.getUserNum() < 1000) {
					%>
						<input type="button" id="btn_update" class="btn btn-warning" value="수정" onclick="location.href='faqUpdateView.do?faqNum=${faq.faqNum}'">
						<input type="button" class="btn btn-secondary" value="삭제" onclick="location.href='faqDelete.do?faqNum=${faq.faqNum}'">
					<% } %>
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