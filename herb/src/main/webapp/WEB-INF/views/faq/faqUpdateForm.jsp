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
    
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<style>
 #btn_write {
	background-color : #e7ab3c;
	border-color : #e7ab3c;
}
.input-group-prepend {
	float: left;
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
                   <form method="post" action="faqUpdate.do?faqNum=${faq.faqNum }&faqTitle=${faqTitle}&faqCategory=${faqCategory}&faqContent=${faqContent}">
						<div class="input-group mb-3">
							<div class="input-group-prepend"><label class="input-group-text px-4">제목</label></div>
							<input type="text" name="faqTitle" class="form-control" value="${faq.faqTitle }">
							<div class="input-group-prepend"><label class="input-group-text px-4">카테고리</label></div>
							<select name="faqCategory">
								<option value="배송">배송</option>
								<option value="주문/결제">주문/결제</option>
								<option value="취소/교환">취소/교환</option>
								<option value="기타">기타</option>
							</select>
						</div>
				        <textarea rows="8" cols="80" 
				            name="faqContent" id="faqContent">${faq.faqContent }</textarea>
				
						<script>
						//id가 description인 태그에 ckeditor를 적용시킴
						//이미지 업로드 안됨
						CKEDITOR.replace("faqContent",{
						    filebrowserUploadUrl : "${path}/imageUpload.do"
						}); //이미지 업로드 기능을 추가하기위한 코드
						</script>
					<div align="center">
						<input type="submit" id="btn_write" class="btn btn-warning" value="수정">
						<input type="button" class="btn btn-secondary" value="취소" onclick="location.href='faqView.do?faqNum=${faq.faqNum}'">
					</div>
				</form>
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