<%@page import="com.kh.herb.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">  
	
    
    <script>
		//아래쪽에서 이 함수를 호출해 페이지값을 컨트롤러에 매핑
		function list(page) {
			console.log("페이지를 이동합니다");
			location.href="faqList.do?curPage="+page;
		}
		// 글쓰기 폼으로 이동하게 하는 함수
		$(function() {
			$("#btn_write").click(function() {
				location.href="faqWrite.do";
			});
		});
	</script>
<style>
#btn_search {
	background-color : #e7ab3c;
	border-color : #e7ab3c;
}

#btn_write {
		float:right;
		margin-top:20px;
		margin-botton:20px;
}

.table_text {
	color : black;
}

#title_color {
	color : black;
}

a {
	color : black;
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
                            <li><a href="faqList.do" style="color:orange;" >자주 묻는 질문</a></li>
                            <li><a href="qaList.do" >질문 게시판</a></li>
                        </ul>
                    </div>

                   
                </div>
                
                <!-- 내용 -->
                <div class="col-lg-9 order-1 order-lg-2">
                	<h3 align="center" style="font-weight:bold;">자주 묻는 질문</h3><br><br>
                	
                	<% Member mvo = (Member)session.getAttribute("member"); // 로그인 돼있는 경우만 글쓰기 버튼 보이도록
	
						if(mvo != null && mvo.getUserNum() < 1000){
						%>
					<!-- 글 작성 버튼 -->
					<div >
						<button type="button" id="btn_write" class="btn btn-dark">글 작성</button>
						<br>
						<br>
						<br>
					</div>
					 <%} %>
					 
                   <form name="formSearch" method="post" action="faqList.do">
                   <div class="input-group mb-3" style="clear:both;">
                   		
                   		<input name="keyword" class="form-control" placeholder="검색어를 입력해주세요" value="${map.keyword }">
                   		<div class="input-group-append">
                   			<input type="submit" id="btn_search" class="btn btn-warning" value="검색">
                   		</div>
                   </div>
					</form>
					
					<c:if test="${ count == 0 }">
						<table class="table text-center table_text">
							<tr>
								<td><h4>게시판에 저장된 글이 없습니다.</h4></td>
							</tr>
						</table>
					</c:if>
					
					<div class="card shadow" style="clear:both;">
					<div class="card-body">
					
					<c:set var="number" value="${map.number }" />
					<table class="table table-hover" id='board_list'>
					<tr>
						<td class="text-center d-none d-md-table-cell">번호</td>
						<td class="text-center d-none d-md-table-cell">카테고리</td>
						<td class="w-50">제목</td>
						<td class="text-center d-none d-md-table-cell">조회수</td>
					</tr>
					<!-- forEach var = "개별데이터" items = "집합데이터" -->
					<c:forEach var="row" items = "${map.list }">
					<tr>
						<td class="text-center d-none d-md-table-cell">${number }</td> 
						<td class="text-center d-none d-md-table-cell">${row.faqCategory }</td>
						<td class="w-50">
						<a href="faqView.do?faqNum=${row.faqNum}&curPage=${map.curPage}&keyword=${map.keyword}">
						${row.faqTitle}</a></td>
						<td class="text-center d-none d-md-table-cell">${row.readcount }</td>
						<c:set var="number" value="${number-1 }" />
					</tr>
					</c:forEach>
					
					<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
 <tr>
 
        <td colspan = "7" align = "center">
            <c:if test="${map.pager.curBlock > 1}">
 			 <a class="table_text" href="#" onclick="list('1')">[처음]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 (뒤쪽에 있기때문에) 처음으로 갈 수 있도록 링크를 추가 -->
        
            <c:if test="${map.pager.curBlock > 1}">
                <a class="table_text" href="#" onclick="list('${map.pager.prevPage}')">◀</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 이전 블록으로 이동할 수 있도록 링크 추가 -->
            
            <c:forEach var="num"
                begin="${map.pager.blockBegin}"
                end="${map.pager.blockEnd}">
                <c:choose>
                    <c:when test="${num == map.pager.curPage}">
                    
                    <!-- 현재 페이지인 경우 하이퍼링크 제거 -->
                    <!-- 현재 페이지인 경우에는 링크를 빼고 빨간색으로 처리를 한다. -->
                        <span style="color:#e7ab3c;">${num}</span>
                    </c:when>
                    <c:otherwise>
                        <a class="table_text" href="#" onclick="list('${num}')" >${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            
            <c:if test="${map.pager.curBlock <= map.pager.totBlock}">
                <a class="table_text" href="#" onclick="list('${map.pager.nextPage}')">▶</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작으면 다음으로 갈 수있도록 링크를 추가 -->
            
            
           <c:if test="${map.pager.curPage <= map.pager.totPage}">
                <a class="table_text" href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작거나 같으면 끝으로 갈 수 있도록 링크를 추가함--> 
            </td>

    </tr>
					
					
					</table>
                  
                  
                  
                  
                  
                  </div>
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