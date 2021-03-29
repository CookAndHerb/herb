<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	type="text/css">

<style>
a {
	text-decoration: none !important;
}

a:hover {
	text-decoration: none !important;
}

a {
	text-decoration: none;
}

.pagination a {
	border: none;
	margin-top: 20px;
	/* #636363;
    		#e7ab3c */
}

.page-link {
	color: #636363;
}

.page-item.active .page-link {
	color: white;
	background-color: #e7ab3c;
	border-color: #e7ab3c;
}

.page-item:hover .page-link {
	background-color: #fff !important;
	color: #111111;
	font-weight: bold;
}

.search-name {
	margin-bottom: 30px;
}

.pi-text .pd-rating i {
	font-size: 12px;
	display: inline-block;
	color: #FAC451;
	margin-right: -3px;
}

.pi-text .pd-rating span {
	font-size: 12px;
	color: #999591;
}

</style>
</head>
<body>
	<!-- 상단 공동 메뉴 -->
	<header>
		<%@ include file="../template/header.jsp"%>
	</header>
	<!-- ##### Hero Area Start ##### -->

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="product.do"><i class="fa fa-home"></i>상품 목록</a> <span>${category}</span>
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
				<div
					class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">상품 목록</h4>
						<ul class="filter-catagories" style="font-weight: bold;">
							<li><a href="product.do">상품 전체</a></li>
							<li><a href="categoryList.do?category=비타민&pSelect=1">비타민</a></li>
							<li><a href="categoryList.do?category=장 건강&pSelect=1">장 건강</a></li>
							<li><a href="categoryList.do?category=눈 건강&pSelect=1">눈 건강</a></li>
							<li><a href="categoryList.do?category=홍삼&pSelect=1">홍삼</a></li>
							<li><a href="categoryList.do?category=기타&pSelect=1">기타</a></li>
						</ul>
					</div>

				</div>

				<!-- 내용 -->

				<div class="col-lg-9 order-1 order-lg-2">
					<!-- 셀렉트 박스 -->
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7">
								<c:if test="${keyword ne null}">
									<div class="search-name">
										<span><b>'${keyword}'</b>에 대한 <b>${count}</b>개의 검색결과</span>
									</div>
								</c:if>
								<div class="select-option">
									<select class="sorting" onchange="location.href=this.value">
										<c:choose>
											<c:when test="${keyword ne null}">
												<option
													value="productSearch.do?search=${search}&keyword=${keyword}&pSelect=1">전체</option>
												<option
													value="productSearch.do?search=${search}&keyword=${keyword}&pSelect=2" 
													<c:if test="${pSelect eq 2}">selected</c:if>>
													리뷰 많은순</option>
												<option
													value="productSearch.do?search=${search}&keyword=${keyword}&pSelect=3"
													<c:if test="${pSelect eq 3}">selected</c:if>>낮은가격순</option>
												<option
													value="productSearch.do?search=${search}&keyword=${keyword}&pSelect=4"
													<c:if test="${pSelect eq 4}">selected</c:if>>높은가격순</option>
											</c:when>
											<c:when test="${category ne null}">
												<option
													value="categoryList.do?category=${category}&pSelect=1">전체</option>
												<option
													value="categoryList.do?category=${category}&pSelect=2"
													<c:if test="${pSelect eq 2}">selected</c:if>>리뷰 많은순</option>
												<option
													value="categoryList.do?category=${category}&pSelect=3"
													<c:if test="${pSelect eq 3}">selected</c:if>>낮은가격순</option>
												<option
													value="categoryList.do?category=${category}&pSelect=4"
													<c:if test="${pSelect eq 4}">selected</c:if>>높은가격순</option>
											</c:when>
											<c:otherwise>
												<option value="product.do?pSelect=1" >전체</option>
												<option value="product.do?pSelect=2"
												<c:if test="${pSelect eq 2}">selected</c:if>>리뷰 많은순</option>
												<option value="product.do?pSelect=3"
												<c:if test="${pSelect eq 3}">selected</c:if>>낮은가격순</option>
												<option value="product.do?pSelect=4"
												<c:if test="${pSelect eq 4}">selected</c:if>>높은가격순</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품 목록 -->
					<div class="product-list">
						<div class="row">
							<c:if test="${count ne 0}">
								<c:forEach var="list" items="${list }">
									<div class="col-lg-4 col-sm-6">
										<div class="product-item">
											<div class="pi-pic">
												<a href="productInfo.do?num=${list.pNum}"> <img
													src="${pageContext.request.contextPath}/resources/productImg/${list.imageName}"
													alt="">
												</a>
											</div>
											<div class="pi-text">
												<div class="catagory-name">${list.pCategory }</div>
												<a href="#"> <a href="productInfo.do?num=${list.pNum}"><h5>${list.pName }</h5></a>
												</a>
												<div class="pd-rating">
													<!-- 리뷰가 있을 경우 -->
													<c:if test="${list.pStar ne 0 || list.pStarAvg ne 0}">
														<c:forEach begin="0" end="${list.pStarAvg+1}" var="star">
															<i class="fa fa-star"></i>
														</c:forEach>

														<c:if test="${list.pStarAvg ne 5}">
															<c:forEach var="rStar" begin="0"
																end="${5-(list.pStarAvg+3)}">
																<i class="fa fa-star-o"></i>
															</c:forEach>
														</c:if>
														<span>(${list.pStar})</span>
													</c:if>
													<!-- 리뷰가 없을 경우 -->
													<c:if test="${list.pStar eq 0 && list.pStarAvg eq 0}">
														<c:forEach var="rStar" begin="0" end="4">
															<i class="fa fa-star-o"></i>
														</c:forEach>
														<span>(0)</span>
													</c:if>
												</div>
												<div class="product-price">
													<fmt:formatNumber value="${list.pCost }" pattern="#,###" />
													원
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>

							<!-- 페이징 처리 -->
							<c:set var="pageCount"
								value="${count / 10 + (count % 10 == 0 ? 0 : 1 )}" />
							<c:set var="startPage" value="${1}" />

							<c:if test="${currentPage%5 != 0}">
								<fmt:parseNumber var="result" value="${currentPage/5}"
									integerOnly="true" />
								<c:set var="startPage" value="${result*5+1}" />
							</c:if>
							<c:if test="${currentPage%5 == 0}">
								<fmt:parseNumber var="result" value="${(currentPage-1)/5}"
									integerOnly="true" />
								<c:set var="startPage" value="${result*5+1}" />
							</c:if>

							<c:set var="pageBlock" value="${5}" />
							<c:set var="endPage" value="${startPage+pageBlock-1}" />

							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>

							<div class="container" style="margin-top: 60px;">
								<ul class="pagination justify-content-center">
									<!-- 이전 -->
									<c:if test="${startPage > pageBlock}">
										<c:choose>
											<c:when test="${category ne null}">
												<li class="page-item"><a class="page-link"
													href="categoryList.do?category=${category}&pageNum=${startPage-5}&pSelect=${pSelect}">◀</a>
												</li>
											</c:when>
											<c:when test="${keyword ne null}">
												<li class="page-item"><a class="page-link"
													href="productSearch.do?pageNum=${startPage-5}&search=${search}&keyword=${keyword}&pSelect=${pSelect}">◀</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="product.do?pageNum=${startPage-5}&pSelect=${pSelect}">◀</a></li>
											</c:otherwise>
										</c:choose>
									</c:if>
									<!-- 페이지 숫자 -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:choose>
											<c:when test="${category ne null}">
												<c:if test="${i==currentPage}">
													<li class="page-item active"><a class="page-link"
														href="categoryList.do?category=${category}&pageNum=${i}&pSelect=${pSelect}">${i}</a></li>
												</c:if>
												<c:if test="${i!=currentPage}">
													<li class="page-item "><a class="page-link"
														href="categoryList.do?category=${category}&pageNum=${i}&pSelect=${pSelect}">${i}</a></li>
												</c:if>
											</c:when>
											<c:when test="${keyword ne null}">
												<c:if test="${i==currentPage}">
													<li class="page-item active"><a class="page-link"
														href="productSearch.do?pageNum=${i}&search=${search}&keyword=${keyword}&pSelect=${pSelect}">${i}</a></li>
												</c:if>
												<c:if test="${i!=currentPage}">
													<li class="page-item "><a class="page-link"
														href="productSearch.do?pageNum=${i}&search=${search}&keyword=${keyword}&pSelect=${pSelect}">${i}</a></li>
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${i==currentPage}">
													<li class="page-item active"><a class="page-link"
														href="product.do?page=${i}&pSelect=${pSelect}">${i}</a></li>
												</c:if>
												<c:if test="${i!=currentPage}">
													<li class="page-item "><a class="page-link"
														href="product.do?pageNum=${i}&pSelect=${pSelect}">${i}</a></li>
												</c:if>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<!-- 다음  -->
									<c:if test="${endPage < pageCount}">
										<c:choose>
											<c:when test="${category ne null}">
												<li class="page-item"><a class="page-link"
													href="categoryList.do?category=${category}&pageNum=${startPage+5}&pSelect=${pSelect}">▶</a></li>
											</c:when>
											<c:when test="${keyword ne null}">
												<li class="page-item"><a class="page-link"
													href="productSearch.do?pageNum=${startPage+5}&search=${search}&keyword=${keyword}&pSelect=${pSelect}">▶</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="product.do?pageNum=${startPage+5}&pSelect=${pSelect}">▶</a></li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
					<!-- 상품 목록 끝 -->
				</div>

			</div>
		</div>
	</section>
	<!-- content 끝 -->


	<!-- 하단 -->
	<footer>
		<%@ include file="../template/footer.jsp"%>
	</footer>

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.zoom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>