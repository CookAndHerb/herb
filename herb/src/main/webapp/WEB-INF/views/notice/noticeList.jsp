<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">  
	
	<style>
	.write_btn{
		float:right;
		margin-top:20px;
		margin-botton:20px;
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
                        <a href="#"><i class="fa fa-home"></i> 고객 센터</a>
                        <span>공지사항</span>
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
                            <li><a href="noticeList.do" style="color:orange;">공지사항</a></li>
                            <li><a href="faqList.do"  >자주 묻는 질문</a></li>
                            <li><a href="qaList.do"  >질문 게시판</a></li>
                        </ul>
                    </div>

                   
                </div>
                
                
                <div class="col-lg-9 order-1 order-lg-2"> <!-- 내용 -->
                <h3 style="font-weight:bold; text-align:center;">공지사항</h3>
                <c:if test="${sessionScope.member.userNum > 0 && sessionScope.member.userNum <= 999}">
                   <button type="button" class="btn btn-dark write_btn" 
                   onclick="window.location='noticeWriteForm.do'">글 작성</button>
                </c:if>
                <br>
                <br>
                <div style="clear:both; "> <!-- table 시작 -->
                <table class="table" style="margin-top:30px; text-align:center; ">
  					  <thead>
     					 <tr>
        					<th>글 번호</th>
    					    <th style="width:50%">제목</th>
        					<th>작성자</th>
        					<th>작성일</th>
        					<th>조회수</th>
      					</tr>
    				</thead>
    				<tbody>
    				<c:forEach var="notice" items="${noticeList}">
      					<tr>
        					<td>${notice.noticeNum }</td>
        					<td><a href="noticePage.do?noticeNum=${notice.noticeNum}&page=${currentPage}" style="color:black; float:left;">${notice.noticeTitle }</a></td>
        					<td>관리자</td>
        					<td>${notice.noticeDate }</td>
        					<td>${notice.noticeReadCount }</td>
      					</tr>
      				</c:forEach>		
    			</tbody>
  				</table>
                  </div> <!-- table 끝 -->
                  
                  	<!-- 앞 페이지 번호 처리 -->
					<div class="pageDiv" style="text-align:center;">
						<c:if test="${startPage == 1}"> 
  								<span style="font-weight:bold;" id="notPrev">[이전]&nbsp;</span>
 						</c:if> 
 						<c:if test="${startPage > 1}">
						<!-- 페이지 많아지면 5로 처리하는게 맞음 ( ex)6페이지에서 [이전] 버튼 클릭 ) -->
							<c:url var="proST" value="noticeList.do">
								<!-- blist.do?page=?  파라미터 자동으로 전달 -->
								<c:param name="page" value="${startPage-5}" />
							</c:url>
							<a class="paging" style="font-weight:bold; color:black;" href="${proST}">[이전]</a>
						</c:if> 
						<!-- 끝 페이지 번호 처리 --> 
						<c:forEach var="p" begin="${startPage}" end="${endPage}">
							<c:if test="${p eq currentPage}">
								<font color="#e7ab3c" size="4"><b>[${p}]</b></font>
							</c:if>
							<c:if test="${p ne currentPage}">
								<c:url var="prostchk" value="noticeList.do">
									<c:param name="page" value="${p}" />
								</c:url>
								<a class="paging" style="color:black;" href="${prostchk}">${p}</a>
							</c:if>
						</c:forEach> 
						<c:if test="${endPage >= maxPage}">
 							<span style="color:black; font-weight:bold;" id=notEnd>[다음]</span>
 						</c:if> 
 						<c:if test="${endPage < maxPage}">
							<c:url var="proEND" value="noticeList.do">
								<c:param name="page" value="${endPage+1}" />
							</c:url>
							<a class="paging" style="color:black; font-weight:bold;" href="${proEND}">[다음]</a>
						</c:if>
					</div>
                </div> <!-- 내용 끝 -->
                
                
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