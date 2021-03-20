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
<!-- sujung css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sujung.css" type="text/css">
<!-- ckeditor -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						<a href="#"><i class="fa fa-home"></i> Admin</a> <span>상품등록</span>
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
						<h4 class="fw-title">Admin</h4>
						<ul class="filter-catagories" style="font-weight: bold;">
							<li><a class="sidebar" href="adminProduct.do">상품관리</a></li>
							<li><a href="#">주문관리</a></li>
							<li><a href="#">회원관리</a></li>
						</ul>
					</div>
				</div>

				<!-- 내용 -->
				<div class="col-lg-9 order-1 order-lg-2">

					<h3>상품 등록</h3>
					<br>
					<br>
					<form action="productIns.do" method="post" enctype="multipart/form-data">
						  <div class="custom-file col-sm-12">
    						<input type="file" class="custom-file-input" name="infoImageName" id="customFile">
    						<label class="custom-file-label" for="customFile">상품 대표 이미지</label>
  						</div>
  						<br><br>
  						<div class="form-inline">
						<label for="pName">상품 명</label> &nbsp;&nbsp;&nbsp; 
						<input type="text" class="col-sm-8 form-control" name="pName" id="pName">&nbsp; 
						<label for="sel1"></label> 
						<select class="form-control col-sm-3" id="sel1" name="pCategory">
							<option value="">카테고리 선택</option>
							<option value="비타민">비타민</option>
							<option value="홍삼">홍삼</option>
							<option value="눈 건강">눈 건강</option>
							<option value="장 건강">장 건강</option>
							<option value="기타">기타</option>
						</select>
						</div><br>
						<div class="form-inline">
							<label for="pMaDate">제조일자</label>&nbsp;
							<input type="date" class="col-sm-5 form-control" name="pMaDate" id="pMaDate">
							&nbsp;
							<label for="pMaDate">유통기한</label> &nbsp;
							<input type="date" class="col-sm-5 form-control" name="pExDate" id="pExDate">
						</div><br>
						<div class="form-inline">
						<label for="pCapacity">포장 단위별 용량</label> &nbsp;&nbsp;&nbsp; 
						<input type="text" class="col-sm-7 form-control" name="pCapacity" id="pCapacity">&nbsp;
						<select class="form-control col-sm-3" id="sel1" name="pType">
							<option value="">식품유형 선택</option>
							<option value="건강기능식품">건강기능식품</option>
							<option value="홍삼제품">홍삼제품</option>
							<option value="기타가공식품">기타가공식품</option>
						</select>
						</div><br>
						<div class="form-inline">
						<label for="pCost">판매가</label> &nbsp;&nbsp;&nbsp; 
						<input type="number" class="col-sm-11 form-control" name="pCost" id="pCost">
						</div><br>
						<div class="form-inline">
							<label for="ImageName">상품 정보 이미지 </label>&nbsp;&nbsp;&nbsp; 
    						<input type="file" class="col-sm-10" name="imageName" id="imageName" multiple="multiple">
  						</div><br>
  						<textarea id="pContent" name="pContent"></textarea><br>
  						<div class="insButton">
						<input type="submit" class="btn btn-warning" value="등록">
						<input type="reset" class="btn btn-secondary" value="취소">
						</div>
					</form>
				
				</div>
			</div>

			<script type="text/javascript">
				//ck에디터
				CKEDITOR.replace('pContent', {height : 500});
				
				//선택한 파일 이름으로 변경
				$(".custom-file-input").on("change",function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
				});
			</script>
	</section>
	<!-- content 끝 -->


	<!-- 하단 -->
	<footer>
		<%@ include file="../template/footer.jsp"%>
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