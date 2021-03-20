<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <!-- faqList 설정 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script>
		//아래쪽에서 이 함수를 호출해 페이지값을 컨트롤러에 매핑
		function list(page) {
			console.log("페이지를 이동합니다");
			location.href="faqList.do?curPage="+page;
		}
		// 글쓰기 폼으로 이동하게 하는 함수
		$(function() {
			$("#btnWrite").click(function() {
				location.href="faqWrite.do";
			});
		});
	</script>
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
                            <li><a href="#" >공지사항</a></li>
                            <li><a href="#" >자주 묻는 질문</a></li>
                            <li><a href="#" >질문 게시판</a></li>
                        </ul>
                    </div>

                   
                </div>
                
                <!-- 내용 -->
                <div class="col-lg-9 order-1 order-lg-2">
                   <form name="form1" method="post" action="faqList.do">
	<input name="keyword" value="${map.keyword }">
	<input type="submit" value="검색">
</form>

<button type="button" id="btnWrite" align="right">글쓰기</button>

<table border = "1" width = "600px">
<tr>
	<td>번호</td>
	<td>카테고리</td>
	<td>제목</td>
	<td>조회수</td>
</tr>
<!-- forEach var = "개별데이터" items = "집합데이터" -->
<c:forEach var="row" items = "${map.list }">
<tr>
	<td>${row.faqNum }</td> 
	<td>${row.faqCategory }</td>
	<!-- 클릭하면 컨트롤러의 faqView.do로 이동하고, 글번호, 페이지번호, 검색옵션 키워드를 같이 넘긴다-->
	<!-- 같이 넘겨야 값들이 초기화되지 않기 때문에 -->
	<td>
	<a href="faqView.do?faqNum=${row.faqNum}&curPage=${map.pager.curPage}&keyword=${map.keyword}">
	${row.faqTitle}</a></td>
	<td>${row.readcount }</td>
</tr>
</c:forEach>
<!-- 페이지 네비게이션 출력 -->
<tr>
	<td colspan="7" align="center">
		<c:if test="${map.pager.curBlock > 1 }">
			<a href="#" onclick="list('1')">[처음]</a>
		</c:if> <!-- 현재 블록이 1보다 크면(뒤쪽에 있기 때문에)처음으로 갈 수 있도록 링크 추가  -->
		
		<c:if test="${map.pager.curBlock > 1 }">
			<a href="#" onclik="list('${map.pager.prevPage}' })">[이전]</a>
		</c:if> 
		
		<c:forEach var="num" begin="${map.pager.blockBegin }" end="${map.pager.blockEnd }">
			<c:choose>
				<c:when test="${num == map.pager.curPage }">
				<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
				<!-- 현재 페이지인 경우에는 링크를 빼고 빨간색으로 처리 -->
					<span style="color:red;">${num }</span>
				</c:when>
				<c:otherwise>
					<a href="#" onclick="list('${num}')">${num }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${map.pager.curBlock <= map.pager.totBlock }">
			<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
		</c:if>
	</td>
</tr>
</table>
                  
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