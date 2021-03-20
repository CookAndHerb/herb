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
                        <a href="#"><i class="fa fa-home"></i> 게시판 적기</a>
                        <span>카테고리 적기</span>
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
                        <h4 class="fw-title">게시판 적기 ex.고객 센터</h4>
                        <ul class="filter-catagories" style="font-weight: bold;">
                            <li><a href="#" >카테고리 적기 ex.공지사항</a></li>
                            <li><a href="#" >자주 묻는 질문</a></li>
                            <li><a href="#" >질문 게시판</a></li>
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
					
					<br>
					<input type="button" value="리뷰쓰기" onclick="reWriteBtn()">
					<!-- 리뷰 쓰기 -->
					<div id="reWrite" style="display:none;">
						<c:set var="pNum" value="${num }"></c:set>
						
						<form action="reviewInsert.do" id="refrm" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="pNum" value="${pNum}">
							<input type="hidden" name="rWriter" value="${sessionScope.member.getUserId()}">
							<table>
								<tr>
									<td>
										별점: <select name="rStar">
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
										</select>
									</td>
									<tr>
										<td><textarea name="rContent" rows="7" cols="40"></textarea></td>
									</tr>
									<tr>
										<td><input type="file" id="userFile"value="사진 업로드"></td>
									</tr>
							</table>
							<input type="button" id="reSumitBtn" value="제출">
						</form>
					</div>
					
					<div id="reviewList">
						<table border="1">
							<tr>
								<th>작성자</th>
								<th>리뷰</th>
								<th>작성일</th>
								<th>별점</th>
							</tr>
							<c:forEach var="review" items="${review }">
								<tr>
									<td>${review.rWriter }</td>
									<td>${review.rContent }</td>
									<td><fmt:formatDate value="${review.rDate}" pattern="yyyy-MM-dd"/>
									<td>${review.rStar }</td>
								</tr>	
							</c:forEach>
						</table>
                  </div>
                </div>
                
                
            </div>
        </div>
    </section>
    <!-- content 끝 -->
	<script>
	var fileList = []; //작성할 첨부파일을 담을 list
	$(document).ready(function(){
		// 리뷰쓰기 버튼 클릭 시, 로그인 체크
		var id = $('input[name=rWriter]').val();
			function reWriteBtn(){
				if(id != ""){
					$('#reWrite').show();
				}else{
					alert("로그인 해야 작성할 수 있습니다.");
				}
			}
	// 리뷰 추가 이벤트
	$('#reSumitBtn').on('click', reply_list);
	
	
	}); // ready fucntion
	
	function reply_list() {
		   //예외처리를 해줌
		   if(fileList.length == 0){
		      alert("후기 사진을 첨부해주세요.");
		      return false;
		   }
		   
		   if(fileList.length > 3){
		      alert("사진은 최대 3개까지 첨부할 수 있습니다.");
		      return false;
		   }

		   // 다중첨부파일
		   if (fileList) {
		      for ( var index in fileList) {
		         form_data.append('filename', fileList[index]);
		      }
		   }

		   $.ajax({
		      // 첨부파일이 있을때는 data, contentType, enctype, processData가 이런 폼으로 있어야한다.
		      type : 'POST',
		      dataType : 'json',
		      url : 'reviewInsert.do.',
		      data : form_data,
		      contentType : false,
		      enctype : 'multipart/form-data',
		      processData : false,
		      success : 'location.href="product.do"',
		      error : function(res){
		         alert("error");
		      }

		   });

		   fileList = [];

		}
	</script>

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