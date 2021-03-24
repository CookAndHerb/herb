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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	#rContent {
	width: 100%;
	resize: none;
	font-size: 16px;
	color: #636363;
	height: 116px;
	border: 1px solid #ebebeb;
	border-radius: 5px;
	padding-left: 20px;
	padding-top: 10px;
	margin-bottom: 20px;
	}
	.review_btn{
		height: 40px;
		width: 100%;
		
	}
	#reWriteBtn{
		margin-top: 20px;
	}
/* 	[type=radio] { 
	  position: absolute;
	  opacity: 0;
	  width: 0;
	  height: 0;
	} */
	.star label > span{
		color: #e7ab3c;
		font-size: 40px;
	}
	.reImg{
		width: 100px;
		height: 100px;
	}
	
</style>

</head>
<body>
	<!-- 상단 공동 메뉴 -->
	<header>
		<%@ include file="../template/header.jsp"%>
	</header>
	<!-- ##### Hero Area Start ##### -	->

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="#"><i class="fa fa-home"></i> 게시판 적기</a> <span>카테고리
							적기</span>
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
						<h4 class="fw-title">게시판 적기 ex.고객 센터</h4>
						<ul class="filter-catagories" style="font-weight: bold;">
							<li><a href="#">카테고리 적기 ex.공지사항</a></li>
							<li><a href="#">자주 묻는 질문</a></li>
							<li><a href="#">질문 게시판</a></li>
						</ul>
					</div>


				</div>

				<!-- 내용 -->
				<div class="col-lg-9 order-1 order-lg-2">
					<h3>상품인포</h3>
					<c:set var="vo" value="${vo }"></c:set>

					<table border="1">
						<tr>
							<th>${vo.pName }</th>
							<th>${vo.pCost }</th>
							<th>별점 ${vo.pStar }</th>
						</tr>
						<tr>
							<td Colspan="3">${vo.pContent}</td>
						</tr>
					</table>


					<div class="product-tab">
						<div class="tab-item">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#tab-1"
									role="tab">DESCRIPTION</a></li>
								<li><a data-toggle="tab" href="#tab-2" role="tab">SPECIFICATIONS</a>
								</li>
								<li><a data-toggle="tab" href="#tab-3" role="tab">Customer
										Reviews (02)</a></li>
							</ul>
						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="product-content">
										<div class="row">
											<div class="col-lg-7">
												<h5>Introduction</h5>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit, sed do eiusmod tempor incididunt ut labore et dolore
													magna aliqua. Ut enim ad minim veniam, quis nostrud
													exercitation ullamco laboris nisi ut aliquip ex ea commodo
													consequat. Duis aute irure dolor in</p>
												<h5>Features</h5>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit, sed do eiusmod tempor incididunt ut labore et dolore
													magna aliqua. Ut enim ad minim veniam, quis nostrud
													exercitation ullamco laboris nisi ut aliquip ex ea commodo
													consequat. Duis aute irure dolor in</p>
											</div>
											<div class="col-lg-5">
												<img src="img/product-single/tab-desc.jpg" alt="">
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-2" role="tabpanel">
									<div class="specification-table">
										<table>
											<tr>
												<td class="p-catagory">Customer Rating</td>
												<td>
													<div class="pd-rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o"></i> <span>(5)</span>
													</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">Price</td>
												<td>
													<div class="p-price">$495.00</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">Add To Cart</td>
												<td>
													<div class="cart-add">+ add to cart</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">Availability</td>
												<td>
													<div class="p-stock">22 in stock</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">Weight</td>
												<td>
													<div class="p-weight">1,3kg</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">Size</td>
												<td>
													<div class="p-size">Xxl</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">Color</td>
												<td><span class="cs-color"></span></td>
											</tr>
											<tr>
												<td class="p-catagory">Sku</td>
												<td>
													<div class="p-code">00012</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
								
								
								<div class="tab-pane fade" id="tab-3" role="tabpanel">
								<div class="review_btn"><input type="button" id="reWriteBtn" class="site-btn" value="리뷰 등록하기" onclick="reWriteBtn();"></div>
									<div class="customer-review-option">
										
										<!-- 리뷰 쓰기 -->
										<div id="reWrite" class="leave-comment" style="display:none;">
											<h4>리뷰 작성</h4>
												<div class="row">
													<div class="col-lg-12">
														<c:set var="pNum" value="${num }"></c:set>
														<input type="hidden" name="pNum"  id="pNum" value="${pNum }">
														<input type="hidden" id="rWriter" name="rWriter" value="${sessionScope.member.getUserId()}">
												<!-- 		별점: <div if="star" >
																<a href="#" value="1"><i class="fa fa-star"></i></a>
																<a href="#" value="2"><i class="fa fa-star"></i></a>
																<a href="#" value="3"><i class="fa fa-star"></i></a>
																<a href="#" value="4"><i class="fa fa-star"></i></a>
																<a href="#" value="5"><i class="fa fa-star"></i></a>
															</div> -->
														별점: <select id="rStar" name="rStar">
																<option value="1">1점</option>
																<option value="2">2점</option>
																<option value="3">3점</option>
																<option value="4">4점</option>
																<option value="5">5점</option>
															</select>
  														
														<textarea name="rContent" id="rContent"></textarea>
														<div style="margin-bottom: 20px;">
															<input type="file" id="userFile" value="사진 업로드">
														</div>
														<button class="site-btn" id="reSumitBtn" style="margin-bottom: 40px;">Send
															message</button>
													</div>
												</div>
										</div><!-- 리뷰 쓰기 끝 -->
										
										<!-- 리뷰 리스트 출력 -->
										<div class="comment-option">
											<c:forEach var="review" items="${review }">
												<div class="co-item">
													<div class="avatar-text">
	                                                	<div class="at-rating">
				      											<c:forEach var="rStar" begin="0" end="${review.rStar - 1}">
			      													<i class="fa fa-star"></i>
			      												</c:forEach>
			      												<c:if test="${review.rStar != 5}">
				      												<c:forEach var="rStar" begin="0" end="${5 - (review.rStar+1)}">
				      													 <i class="fa fa-star-o"></i>
				      												</c:forEach>
			      												</c:if>
	                                                    </div>
	          
															<h5>${review.rWriter }
																<span><fmt:formatDate value="${review.rDate}"
																		pattern="yyyy/MM/dd" /></span>
															</h5>
															<div class="at-reply">${review.rContent }</div>
															<div class="img-reply">
																<c:forEach var="fileName" items="${review.mFileList}">
																	<img class="reImg" src="/Temp/${fileName.rFile}"/>
																</c:forEach>
															</div>
													</div>
												</div>
											</c:forEach>

										</div>
										<!-- 리뷰 리스트 끝 -->
									
									</div>
								</div>
							</div>
						</div>
					</div> <!-- 리뷰 탭 끝 -->

				</div>


			</div>
		</div>
	</section>
	<!-- content 끝 -->
	<script>
		var fileList = []; // 리뷰 사진객체  list
		
		// 리뷰 추가
		$('#reSumitBtn').on('click', reviewList);
		
		function reWriteBtn() {
			// 리뷰쓰기 버튼 클릭 시, 로그인 체크
			var id = $('input[name=rWriter]').val();
			if (id != "") {
				$('#reWrite').show();
			} else {
				alert("로그인 해야 작성할 수 있습니다.");
			}
		}

		var userfile = '';
		$('#userFile').on('change', function() {
			userfile = $('#userFile');
			console.log($(userfile[0]).val());

			/* 		var partname = $(userfile[0]).val().substring($(userfile[0]).val().lastIndexOf("\\") + 1);
					console.log(partname); */
			fileList.push(userfile[0].files[0]);
		});
		
		function reviewList() {
			//예외처리를 해줌
			if (fileList.length == 0) {
				alert("후기 사진을 첨부해주세요.");
				return false;
			}

			if (fileList.length > 5) {
				alert("사진은 최대 5개까지 첨부할 수 있습니다.");
				return false;
			}

			var formData = new FormData();

			formData.append('pNum', $('#pNum').val());
			formData.append('rWriter', $("#rWriter").val());
			formData.append('rStar', $("#rStar").val());
			formData.append('rContent', $("#rContent").val());

			// 다중첨부파일
			if (fileList) {
				for ( var index in fileList) {
					formData.append('fileName', fileList[index]);
				}
			}
			$.ajax({
				// 첨부파일이 있을때는 data, contentType, enctype, processData가 이런 폼으로 있어야한다.
				type : 'POST',
				dataType : 'json',
				url : 'reviewInsert.do',
				data : formData,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					alert("리뷰가 등록 되었습니다.");
					location.href= data.moveUrl + "?num=" + data.num ;
				},
				error : function(request, status, error) {
					alert('리뷰 등록을 실패하였습니다.');
					//location.href= data.moveUrl + "?num=" + data.num ;
					console.log("code = " + request.status + " message = "
							+ request.responseText + " error = " + error);
				}
			});

		}
	</script>

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