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
	
	<!-- ckeditor -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>

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
                <h3 style="font-weight:bold; text-align:center;">공지사항 글 등록</h3>
                <br>
                <br>

                <form action="noticeWriteForm.do" method="post">
                  <table class="table table-bordered">   
                  	<tbody>
     				 <tr>
        				<td style="background-color:#d2d2d2; font-weight:bold; text-align:center;">제목</td>
        				<td> <input type="text" name="noticeTitle" style="width:80%; border-color:#d2d2d2;"></td>
      				</tr>
    				</tbody>
  					</table> 
					<input type="hidden" name="noticeWriter" value="${sessionScope.member.userId}">                
                	<textarea id="noticeContent" name="noticeContent"></textarea><br>
                	<div style="text-align:center; margin-top:20px;">
                	<button type="submit" class="btn btn-warning" >등록</button>
                	<button type="button" onclick="history.back(-1);" class="btn btn-secondary" >취소</button>
                	</div>
                </form>
                
                
                
                
                </div> <!-- 내용 끝 -->
                
                
            </div>
        </div>
    </section>
    <!-- content 끝 -->
			<script type="text/javascript">
				//ck에디터
				CKEDITOR.replace('noticeContent', {height : 500});
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