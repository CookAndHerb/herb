<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <style type="text/css">
    	#chatIcon{
    		width: 80px;
    		height: 80xp;
    		float: right;
    	}
    </style>
    
    <script type="text/javascript">
	function showPopup(){
		window.open("chat", "chat", "width=370, height=400");
	}
    </script>
</head>
<body>
	<!-- 상단 공동 메뉴 -->
	<header>
		<%@ include file="./template/header.jsp" %>
	</header>
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/연습.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>비타민</span>
                            <h1>Nature's Way</h1>
                            <p>온 가족을 위한 건강 구미</p>
                            <a href="#" class="primary-btn">Shop Now</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>Hot <span>item</span></h2>
                    </div>
                </div>
            </div>
            <div class="single-hero-items set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/연습2.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>장 건강</span>
                            <h1>Herb Only</h1>
                            <p>말썽인 장 건강 쑤욱변으로 시원하게!</p>
                            <a href="#" class="primary-btn">Shop Now</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>Hot <span>item</span></h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    

	<br>
	<br>
	<br>
	
	 <!--채팅 아이콘-->
	 <c:if test="${not empty sessionScope.member}">
		<div id="chatIcon">
	    	<img src="${pageContext.request.contextPath}/resources/img/채팅아이콘.png" onclick="showPopup();" />
		</div>
	</c:if>
	
    <!-- 옆 배너 시작 -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/products/로고로고4.jpg">
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="filter-control">
                        <ul>
                            <li class="active">Best TOP 4</li>
                          
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                        <div class="product-item">
                            <div class="pi-pic">
                           	 	<a href="productInfo.do?num=${topList[0].pNum}" style="color:black; font-weight:bold;">
                                	<img src="${pageContext.request.contextPath}/resources/${topList[0].pImageName}" alt="">
                                </a>
                                <div class="sale">BEST</div>
                                
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">BEST 1</div>
                                
                                <a href="productInfo.do?num=${topList[0].pNum}" style="color:black; font-weight:bold;">
                                    ${topList[0].pName}
                                </a>
                                <div class="product-price">
                                    <fmt:formatNumber pattern="###,###,###" value="${topList[0].pCost}" /> 원
                                    
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                           	 <a href="productInfo.do?num=${topList[1].pNum}" style="color:black; font-weight:bold;">
                                <img src="${pageContext.request.contextPath}/resources/${topList[1].pImageName}" alt="">
                              </a>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">BEST 2</div>
                                <a href="productInfo.do?num=${topList[1].pNum}" style="color:black; font-weight:bold;">
                                     ${topList[1].pName}
                                </a>
                                <div class="product-price">
                                   <fmt:formatNumber pattern="###,###,###" value="${topList[1].pCost}" /> 원
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                            	<a href="productInfo.do?num=${topList[2].pNum}" style="color:black; font-weight:bold;">
                                <img src="${pageContext.request.contextPath}/resources/${topList[2].pImageName}" alt="">
                            	</a>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">BEST 3</div>
                                <a href="productInfo.do?num=${topList[2].pNum}" style="color:black; font-weight:bold;">
                                    ${topList[2].pName}
                                </a>
                                <div class="product-price">
                                    <fmt:formatNumber pattern="###,###,###" value="${topList[2].pCost}" /> 원
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                            <a href="productInfo.do?num=${topList[3].pNum}" style="color:black; font-weight:bold;">
                                <img src="${pageContext.request.contextPath}/resources/productImg/${topList[3].pImageName}" alt="">
                             </a>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">BEST 4</div>
                                <a href="productInfo.do?num=${topList[3].pNum}" style="color:black; font-weight:bold;">
                                     ${topList[3].pName}
                                </a>
                                <div class="product-price">
                                    <fmt:formatNumber pattern="###,###,###" value="${topList[3].pCost}" /> 원
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Women Banner Section End -->

    <!-- Deal Of The Week Section Begin-->
    <section class="deal-of-week set-bg spad" data-setbg="${pageContext.request.contextPath}/resources/img/time-bg.png">
        <div class="container">
            <div class="col-lg-6 text-center">
                <div class="section-title">
                    <h2>이번주 특가</h2>
                    <p>비타민마을 메가씨 3000 비타민C 분말 스틱</p>
                    <div class="product-price">
                        12,900원 (10g당 478원)
                        <span>/ 비타민</span>
                    </div>
                </div>
                <div class="countdown-timer" id="countdown">
                    <div class="cd-item">
                        <span>56</span>
                        <p>일</p>
                    </div>
                    <div class="cd-item">
                        <span>12</span>
                        <p>시간</p>
                    </div>
                    <div class="cd-item">
                        <span>40</span>
                        <p>분</p>
                    </div>
                    <div class="cd-item">
                        <span>52</span>
                        <p>초</p>
                    </div>
                </div>
                <a href="#" class="primary-btn">Shop Now</a>
            </div>
        </div>
        
    </section>
    <!-- Deal Of The Week Section End -->   
    
    <br>
    <br>
	<!-- 하단 -->
	<footer>
		<%@ include file="./template/footer.jsp" %>
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