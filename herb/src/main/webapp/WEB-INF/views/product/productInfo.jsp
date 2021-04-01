<%@page import="java.util.Date"%>
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
	#rContent2 {
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
	.customer-review-option .comment-option .co-item {
	    padding-bottom: 20px;
	}
	.review_btn {
		height: 40px;
		width: 100%;
	}
	
	#reWriteBtn {
		margin-top: 20px;
		background-color: #252525;
		border-color: #252525;
	}
	.star label>span {
		color: #e7ab3c;
		font-size: 40px;
	}
	
	.reImg {
		width: 100px;
		height: 100px;
	}
	
	#review_none {
		padding: 80px;
		width: 100%;
		border: 1px solid #ebebeb;
	}
	
	#reTest_none {
		display: flex;
		justify-content: center;
		color: #e7ab3c;
	}
	
	.addCart_btn:active {
		background-color: #252525;
	}
	.reUpDel{
		display: inline-block;
		float: right;
		cursor: pointer;
		margin-left: 5px;
	}
	
	.modal {
		display: none;
		z-index: 500;
		width: 100%;
		height: 100vh;
		position: fixed;
		top: 0;
		left: 0;
		background-color: rgba(0, 0, 0, 0.3);
	}
	
	.modal button {
		position: absolute;
		top: 3rem;
		right: 3rem;
		background: transparent;
		border: 0;
		color: #ffffff;
		font-size: 3rem;
	}
	
	.modalBox {
		position: relative;
		top: 20%;
		left: 50%;
		transform: translate(-50%, -20%);
		background-color: #ffffff;
		width: 30%;
		height: 30%;
		text-align: center;
	}
	.img-reply{
		display: flex;
		margin-top: 12px;
	}
	
	.rating-stars ul {
	  list-style-type:none;
	  padding:0;
	  margin-bottom: 12px;
	  -moz-user-select:none;
	  -webkit-user-select:none;
	}
	.rating-stars ul > li.star {
	  display:inline-block;
	}
	
	.rating-stars ul > li.star > i.fa {
	  font-size:2.2em;
	  color:#ccc; 
	}
	
	.rating-stars ul > li.star.hover > i.fa {
	  color:#FFCC36;
	}
	.rating-stars ul > li.star.selected > i.fa {
	  color:#FF912C;
	}
	.reh4{
		text-align: center;
		height: 12px;
	}
	.recenter{
		display: flex;
		justify-content: center;
		margin-bottom: 60px;
		border-bottom: 1px solid #e9e9e9;
	}



</style>

<!-- 주연 장바구니 ajax 부분 -->
<script>
	$(
			function() {

				$(document).on('click', '.addCart_btn', addfunction);
				function addfunction() {

					var cartPnum2 = $("#productNumber").val();
					var cartStock2 = $(".numBox").val();
					if (cartStock2 > 0) {

						$.ajax({

							type : "get",
							url : "addCart.do?cartPnum=" + cartPnum2
									+ '&cartStock=' + cartStock2,
							dataType : 'json',
							success : function(data) {
								if (data.result == "ok") {
									alert("카트에 상품이 추가되었습니다.");
									$(".numBox").val("1");
								} else {
									if (data.result == "login") {
										alert("로그인 해주세요.");
										$(".numBox").val("1");

									} else if (data.result == "dup") {
										alert("이미 카트에 상품이 존재합니다.");
										$(".numBox").val("1");
									}
								}
							},
							error : function() {
								alert("카트에 상품 담기 실패")
							}

						}); // ajax 끝

					} else {
						alert("수량을 1개 이상 선택해주세요.");
					}

				}
				; // function 끝

			})
</script>

<!-- 주연 끝 -->
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
						<a href="product.do"><i class="fa fa-home"> </i>상품 목록</a> <span>${vo.pCategory }</span>
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
				<div class="col-lg-3">
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
				<!-- 사이드바 끝 -->

				<!-- 상품 영역 -->
				<div class="col-lg-9">
					<div class="row">
						<!-- 상품 이미지 -->
						<div class="col-lg-6">
							<!-- 상품 대표 이미지 -->
							<div class="product-pic-zoom">
								<img class="product-big-img"
									src="${pageContext.request.contextPath}/resources/productImg/${vo.imageName}"
									alt="상품 대표 이미지">
								<div class="zoom-icon">
									<i class="fa fa-search-plus"></i>
								</div>
							</div>
							<!-- 상품 인포 이미지 -->
							<div class="product-thumbs">
								<div class="product-thumbs-track ps-slider owl-carousel">
									<div class="pt active"
										data-imgbigurl="${pageContext.request.contextPath}/resources/productImg/${vo.imageName}">
										<img
											src="${pageContext.request.contextPath}/resources/productImg/${vo.imageName}"
											alt="상품 인포 이미지1">
									</div>
									<c:forEach var="file" items="${file}">
										<div class="pt active"
											data-imgbigurl="${pageContext.request.contextPath}/resources/productImg/${file.pInfoFile}">
											<img
												src="${pageContext.request.contextPath}/resources/productImg/${file.pInfoFile}"
												alt="상품 인포 이미지2">
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 상품 이름, 가격, 장바구니 -->

						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<span>${vo.pCategory}</span>
									<h3>${vo.pName }</h3>
								</div>
								<!-- 별점 평균 -->
								<div class="pd-rating">
									<!-- 리뷰가 있을 경우 -->
									<c:if test="${!empty review}">
										<c:forEach begin="0" end="${reAvg-1}" var="sta" >
											<i class="fa fa-star"></i>
										</c:forEach>

										<c:if test="${reAvg ne 5}">
											<c:forEach var="rSta" begin="0" end="${5-(reAvg+1)}">
												<i class="fa fa-star-o"></i>
											</c:forEach>
										</c:if>
										<span>(${vo.pStar})</span>
									</c:if>
									<!-- 리뷰가 없을 경우 -->
									<c:if test="${empty review}">
										<c:forEach var="rStar" begin="0" end="4">
											<i class="fa fa-star-o"></i>
										</c:forEach>
										<span>(0)</span>
									</c:if>
								</div>
								<div class="pd-desc">
									<h4>
										<fmt:formatNumber value="${vo.pCost }" pattern="#,###" />
										원
									</h4>
								</div>
								<div class="pd-size-choose">
									배송비 <b>2,500원</b><br />
									<c:set var="delivery_date"
										value="<%=new Date(new Date().getTime() + 2000 * 60 * 60 * 24)%>" />
									<fmt:formatDate value="${delivery_date}" pattern="E요일  MM/dd"
										var="delivery_date" />
									<p>${delivery_date}도착 예정</p>
								</div>

								<div class="quantity">
									<!-- 상품 수량 선택-->
									<div class="pro-qty">
										<input type="text" value="1" class="numBox">
									</div>
									<button class="addCart_btn primary-btn pd-cart"
										style="border-style: none;">장바구니 담기</button>
									<input type="hidden" id="productNumber" value="${vo.pNum}">
								</div>

								<ul class="pd-tags">
									<li><span>상품번호</span>: ${vo.pNum }</li>
									<li><span>개당 용량/중량/정</span>: ${vo.pCapacity }</li>
									<li><span>식품 유형</span>: ${vo.pType }</li>
								</ul>

							</div>
						</div>
					</div>
					<!-- row 끝 -->

					<div class="product-tab">
						<div class="tab-item">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#tab-1"
									role="tab">&emsp;&emsp;&nbsp;상품 소개&nbsp;&emsp;&emsp;</a></li>
								<li><a data-toggle="tab" href="#tab-2" role="tab">&emsp;&emsp;&nbsp;상품
										상세&nbsp;&emsp;&emsp;</a></li>
								<li><a data-toggle="tab" href="#tab-3" role="tab">&ensp;&emsp;&emsp;상품
										후기(${vo.pStar})&ensp;&emsp;&emsp;</a></li>
							</ul>
						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="product-content">
										<div class="row">
											<div class="col-lg-7">
												<p>${vo.pContent }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-2" role="tabpanel">
									<div class="specification-table">
										<table>
											<tr>
												<td class="p-catagory">상품명</td>
												<td>
													<div class="p-code">${vo.pName}</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">제조일자</td>
												<td>
													<div class="p-code">${vo.pMaDate }</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">유통기한</td>
												<td>
													<div class="p-code">${vo.pExDate}</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">포장단위별 용량</td>
												<td>
													<div class="p-code">${vo.pCapacity }</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">식품의 유형</td>
												<td>
													<div class="p-code">${vo.pType }</div>
												</td>
											</tr>
										</table>
									</div>
								</div>


								<div class="tab-pane fade" id="tab-3" role="tabpanel">
									<div class="review_btn">
										<input type="button" id="reWriteBtn" class="site-btn"
											value="리뷰 등록하기" style="display: none;">
									</div>
									<div class="customer-review-option">

										<!-- 리뷰 쓰기 -->
										<div id="reWrite" class="leave-comment" style="display: none;">
											<h4 class="reh4">리뷰 작성</h4>
											<div class="row">
												<div class="col-lg-12">
													<c:set var="pNum" value="${num }"></c:set>
													<input type="hidden" name="pNum" id="pNum" value="${pNum }">
													<input type="hidden" id="rWriter" name="rWriter" value="${sessionScope.member.getUserId()}"> 	
													
													<section class='rating-widget'>
													  <!-- Rating Stars Box -->
													  <div class='rating-stars text-center'>
															<ul id='stars' name="rStar">
																<li class='star' data-value='1'><i
																	class='fa fa-star fa-fw'></i></li>
																<li class='star' data-value='2'><i
																	class='fa fa-star fa-fw'></i></li>
																<li class='star' data-value='3'><i
																	class='fa fa-star fa-fw'></i></li>
																<li class='star' data-value='4'>
																	<i class='fa fa-star fa-fw'></i>
																</li>
																<li class='star' data-value='5'><i
																	class='fa fa-star fa-fw'></i>
																</li>
															</ul>
														</div>
													 </section>


													<textarea name="rContent" id="rContent"></textarea>
														<div style="margin-bottom: 20px;">
															<input type="file" id="userFile" value="사진 업로드" multiple/>
														</div>
														<div class="recenter">
															<button class="site-btn" id="reSumitBtn" style="margin-bottom: 40px;">리뷰 등록</button>
														</div>
												</div>
											</div>
										</div>
										<!-- 리뷰 쓰기 끝 -->
										
										<!-- 리뷰 리스트 출력 -->
										<div class="comment-option">
											<!-- 사진 리뷰 리스트 -->
											<c:if test="${!empty review}">
												<c:forEach var="review" items="${review }">
												<c:set var="rNum" value="${review.rNum}"/>
													<div class="co-item">
													<c:if test="${review.rWriter == sessionScope.member.getUserId()}">
															<button id="${rNum}" class="reUpDel btn btn-warning">수정</button>
															<button id="${rNum}" class="reUpDel btn btn-secondary">삭제</button>
														</c:if>
														<div class="avatar-text">
															<div class="at-rating">
																<c:forEach var="rStar" begin="0"
																	end="${review.rStar - 1}">
																	<i class="fa fa-star"></i>
																</c:forEach>
																<c:if test="${review.rStar != 5}">
																	<c:forEach var="rStar" begin="0"
																		end="${5 - (review.rStar+1)}">
																		<i class="fa fa-star-o"></i>
																	</c:forEach>
																</c:if>
															</div>

															<h5>${review.rWriter }
																<span><fmt:formatDate value="${review.rDate}"
																		pattern="yyyy/MM/dd" /></span>
															</h5>
															
															<div class="at-reply">${review.rContent }</div>
															<!-- 리뷰 파일 출력-->
															<div class="img-reply">
																<c:forEach var="fileName" items="${review.mFileList}">
																	<div class="imgC">
																		<img class="reImg"
																			src="${pageContext.request.contextPath}/resources/reviewImg/${fileName.rFile}" />
																	</div>
																</c:forEach>
															</div>
															
															<!-- 이미지 모달창 -->
															<div class="modal">
																<button>&times;</button>
																<div class="modalBox">
																	<img src="" alt="">
																	<p></p>
																</div>
															</div>
															
														</div>
														<!-- 리뷰 수정 폼 -->
														<div id="reUpdateForm${rNum}" class="leave-comment" style="display: none;">
															<h4 class="reh4">리뷰 수정</h4>
															<div class="row">
																<div class="col-lg-12">
																	<c:set var="pNum" value="${num }"></c:set>
																	<input type="hidden" name="pNum" id="pNum2" value="${pNum }">
																	<input type="hidden" id="rWriter2" name="rWriter" value="${sessionScope.member.getUserId()}"> 	
																	
																	<section class='rating-widget'>
																	  <!-- Rating Stars Box -->
																	  <div class='rating-stars text-center'>
																			<ul id='stars' name="rStar">
																				<li class='star' data-value='1'><i
																					class='fa fa-star fa-fw'></i></li>
																				<li class='star' data-value='2'><i
																					class='fa fa-star fa-fw'></i></li>
																				<li class='star' data-value='3'><i
																					class='fa fa-star fa-fw'></i></li>
																				<li class='star' data-value='4'>
																					<i class='fa fa-star fa-fw'></i>
																				</li>
																				<li class='star' data-value='5'><i
																					class='fa fa-star fa-fw'></i>
																				</li>
																			</ul>
																		</div>
																	 </section>
				
				
																	<textarea name="rContent" id="rContent2">${review.rContent}</textarea>
																		<span id="oldfile${rNum}" style="color: #C3C3C3;">기존파일:<br/></span>
																		<div style="margin-bottom: 20px;">
																			<input type="file" id="userFile2" value="사진 업로드" multiple/>
																		</div>
																		<div class="recenter">
																			<button class="site-btn" id="reUpdateBtn${rNum}" style="margin-bottom: 40px;">리뷰 수정</button>
																		</div>
																</div>
															</div>
														</div>
													</div>

													<!-- 리뷰 쓰기 끝 -->
												</c:forEach>
											</c:if>

											<c:if test="${empty review}">
												<div id="review_none" class="co-item">
													<h3 id="reTest_none">
														<b>등록된 리뷰가 없습니다.</b>
													</h3>
												</div>
											</c:if>
										</div>
										<!-- 리뷰 리스트 끝 -->

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 리뷰 탭 끝 -->
				</div>

				<!-- 내용 -->


				<!-- 탭 -->
				<div class="col-lg-9 order-1 order-lg-2"></div>


			</div>
		</div>
	</section>
	<!-- content 끝 -->
	<script>
		var fileList = []; // 리뷰 사진객체  list
		var userfile = '';
		var id = $('input[name=rWriter]').val();
		var num = ${pNum};
		var rStar;
		var oldFile = [];
		var fileList2 = [];
		var idNum;
		
		// 아이디 체크 후 리뷰쓰기 버튼 보여주기
		$(function() {
			console.log(id);
			if (id.length != 0) {
				$('#reWriteBtn').show();
			}

		});
		// 리뷰쓰기 버튼 누르면 리뷰 입력폼 보이기
		$('#reWriteBtn').on('click', function() {
			$.ajax({
				type : 'GET',
			    dataType : 'json',
			    url : 'orderCheck.do',
			    contentType : "application/json; charset:UTF-8",
			    data: {pNum:num, rWriter:id},
			    success : function(data){
			    	var sto = "배송완료";
			    	if(data.order == sto){
						if($('#reWrite').css("display") == "none"){
							$('#reWrite').show();
						}else{
							$('#reWrite').hide();
						}
			       }else{
			    	   alert("배송이 완료된 회원만 작성할 수 있습니다.");
			       }
			    }
			});

		});
		
		// 별점처리
		$(document).ready(function(){
			  
			  $('#stars li').on('mouseover', function(){
			    var onStar = parseInt($(this).data('value'), 10);
			   
			    $(this).parent().children('li.star').each(function(e){
			      if (e < onStar) {
			        $(this).addClass('hover');
			      }
			      else {
			        $(this).removeClass('hover');
			      }
			    });
			    
			  }).on('mouseout', function(){
			    $(this).parent().children('li.star').each(function(e){
			      $(this).removeClass('hover');
			    });
			  });
			  
			  
			  $('#stars li').on('click', function(){
			    var onStar = parseInt($(this).data('value'), 10); 
			    var stars = $(this).parent().children('li.star');
			    for (i = 0; i < stars.length; i++) {
			      $(stars[i]).removeClass('selected');
			    }
			    for (i = 0; i < onStar; i++) {
			      $(stars[i]).addClass('selected');
			    }
			    rStar = onStar;
			  });
			  
			  
		});
		
		
		// 리뷰 추가
		$('#reSumitBtn').on('click', reviewList);
		

		$('#userFile').on('change', function() {
			userfile = $('#userFile');

			if(userfile.multiple == true){
				for(var i=0; i<userfile.length; i++){
					console.log($(userfile[i]).val());
					fileList.push(userfile[i].files[i]);
				}
			}else{
				console.log($(userfile[0]).val());
				fileList.push(userfile[0].files[0]);
			}
		});
		
		// 수정, 삭제 버튼 눌렀을 때 연결
		$(document).on('click', '.reUpDel', reviewUpDel);
		
		// 수정, 삭제 버튼 눌렀을 때
		function reviewUpDel(){
			if($(this).text() == '삭제'){
				idNum = $(this).prop("id");
				console.log(idNum);
				
				$.ajax({
			         type : 'GET',
			         dataType : 'json',
			         url : 'reviewDelete.do',
			         async:false,
			         data: {rNum:idNum,
			        	 	num:num},
			         success : function(data){
			        	 if(data.result > 1){
			        		 alert("리뷰 삭제를 완료했습니다.");
			        		 location.href = data.moveUrl + "?num=" + data.num;
			        	 }else{
			        		 alert("리뷰 삭제를 실패하였습니다.");
			        	 }
			         },
			         error : function() {
						alert("리뷰 삭제를 실패하였습니다.")
					}
			      });
			}
			else if($(this).text() == '수정'){
 				idNum = $(this).prop("id");
 				console.log(idNum);
				if($('#reUpdateForm'+idNum).css('display') == "none"){
					$('#reUpdateForm'+idNum).show();
					//멀티 파일 가져오기
				      $.ajax({
				         type : 'POST',
				         dataType : 'json',
				         url : 'getReviewFile.do',
				         async:false,
				         data: {rNum:idNum},
				         success : function(data){
				        	$.each(data, function(index, value){
				        		var str1 = value.rFile;
				        		oldFile[index] = str1;
				        		var str2 = str1.split("_").reverse()[0];
				        		$('#oldfile'+idNum).append(str2+'<br/>');
				        	});
				         },
				         error : function(request, status, error) {
								alert('기존 파일을 가져오지 못했습니다.');
								//location.href= data.moveUrl + "?num=" + data.num ;
								console.log("code = " + request.status + " message = "
										+ request.responseText + " error = " + error);
							}
				      });
				}else{
					$('#reUpdateForm'+idNum).hide();
				}
			}
		}
		
		//리뷰 수정
		$('#reUpdateBtn'+idNum).on('click',reUpdateList);
		
		// 리뷰 수정할 때 새로운 파일
		$('#userFile2').on('change', function() {
			userfile2 = $('#userFile2');

			if(userfile2.multiple == true){
				for(var i=0; i<userfile2.length; i++){
					console.log($(userfile2[i]).val());
					fileList2.push(userfile2[i].files[i]);
				}
			}else{
				console.log($(userfile2[0]).val());
				fileList2.push(userfile2[0].files[0]);
			}
		});
		
		// 리뷰 수정 업로드 및 예외처리
		function reUpdateList(){
			console.log(oldFile.length);
			if (fileList2.length + oldFile.length == 0) {
				alert("후기 사진을 첨부해주세요.");
				return false;
			}

			if (fileList2.length + oldFile.length > 6) {
				alert("사진은 최대 6개까지 첨부할 수 있습니다.");
				return false;
			}
			if ($("#rContent2").val().trim() == "" || $("#rContent2").val() == null) {
				alert("내용을 적어주세요");
				return false;
			}
			var formData2 = new FormData();
			
			formData2.append('pNum', $('#pNum2').val());
			formData2.append('rNum', idNum);
			formData2.append('rWriter', $("#rWriter2").val());
			formData2.append('rStar', rStar);
			formData2.append('rContent', $("#rContent2").val());

			// 다중첨부파일
			if (fileList2) {
				for ( var index in fileList2) {
					formData2.append('fileName', fileList2[index]);
				}
			}
			$.ajax({
				dataType : 'json',
				url : 'reviewUpdate.do',
				type : 'POST',
				data : formData2,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					alert("리뷰 수정을 완료했습니다.");
					location.href = data.moveUrl + "?num=" + data.num;
				},
				error : function(request, status, error) {
					alert('리뷰 수정을 실패하였습니다.');
					//location.href= data.moveUrl + "?num=" + data.num ;
					console.log("code = " + request.status + " message = "
							+ request.responseText + " error = " + error);
				}
			});		
		}
		
		// 리뷰 제출 및 예외처리
		function reviewList() {
			if (fileList.length == 0) {
				alert("후기 사진을 첨부해주세요.");
				return false;
			}

			if (fileList.length > 6) {
				alert("사진은 최대 6개까지 첨부할 수 있습니다.");
				return false;
			}
			if ($("#rContent").val().trim() == "" || $("#rContent").val() == null) {
				alert("내용을 적어주세요");
				return false;
			}
			var formData = new FormData();

			formData.append('pNum', $('#pNum').val());
			formData.append('rWriter', $("#rWriter").val());
			formData.append('rStar', rStar);
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
					location.href = data.moveUrl + "?num=" + data.num;
				},
				error : function(request, status, error) {
					alert('리뷰 등록을 실패하였습니다.');
					//location.href= data.moveUrl + "?num=" + data.num ;
					console.log("code = " + request.status + " message = "
							+ request.responseText + " error = " + error);
				}
			});
		}
		
		$(function(){
		//	이미지 클릭시 해당 이미지 모달
			$(".imgC").click(function(){
				$(".modal").show();
				// 해당 이미지 가겨오기
				var imgSrc = $(this).children("img").attr("src");
				var imgAlt = $(this).children("img").attr("alt");
				$(".modalBox img").attr("src", imgSrc);
				$(".modalBox img").attr("alt", imgAlt);
				
				// 해당 이미지 텍스트 가져오기
				// var imgTit =  $(this).children("p").text();
				// $(".modalBox p").text(imgTit);
				
		   // 해당 이미지에 alt값을 가져와 제목으로
				$(".modalBox p").text(imgAlt);
			});
			
			//.modal안에 button을 클릭하면 .modal닫기
			$(".modal button").click(function(){
				$(".modal").hide();
			});
			
			//.modal밖에 클릭시 닫힘
			$(".modal").click(function (e) {
		    if (e.target.className != "modal") {
		      return false;
		    } else {
		      $(".modal").hide();
		    }
		  });
		});
		
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