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
                        <span>상품관리</span>
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
                            <li><a class="sidebar" href="adminProduct.do" >상품관리</a></li>
                            <li><a href="#" >주문관리</a></li>
                            <li><a href="#" >회원관리</a></li>
                            <li><a href="adminProduct.do" style="color: #e7ab3c">상품관리</a></li>
                            <li><a href="adminOrder.do" >주문관리</a></li>
                            <li><a href="adminMember.do" >회원관리</a></li>
                        </ul>
                    </div>              
                </div>
                
                <!-- 내용 -->
                <div class="col-lg-10 order-1 order-lg-2">

                <form action="productIns.do">
                	<input type="submit" class="btn btn-warning" value="상품 등록">
                </form>
                
               	<h3><i class='fas fa-capsules' style='font-size:32px; color:#e7ab3c'></i> 상품관리</h3>
                <br><br>
                &nbsp;&nbsp;&nbsp;
                <button class="btn btn-sm" id="productIns" onclick="location.href = 'productIns.do';">상품등록</button>
				<div id="searchDiv">
                        <div class="form-inline serch">
                            <select name="search" class="custom-select-sm">
                            <option value="pNum">상품 번호</option>
                            <option value="pName">상품 명</option>
                            </select>
                            <div class="input-group">
                                <input type="text" class="control-sm">
                                <button type="button" id="searchButton" class="btn-warning"><i class="ti-search"></i></button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
                    </div>
				
				<br><br>
					<div class="container ">
						<table id="productTable" class="table table-bordered col-sm-12">
							<thead>
								<tr>
									<th>상품번호</th>
									<th>상품명</th>
									<th>카테고리</th>
									<th>식품의 유형</th>
									<th>판매가</th>
									<th>제조일</th>
									<th>유통기한</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="product" items="${productList }">
								<tr>
									<td>${product.pNum}</td>
									<td style="width: 180px;">${product.pName}</td>
									<td>${product.pCategory}</td>
									<td>${product.pType}</td>
									<td>${product.pCost}</td>
									<td>${product.pMaDate} </td>
									<td>${product.pExDate}</td>
									<td>수정</td>
									<td>삭제</td>
								</tr>
							</c:forEach>
						</table>
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