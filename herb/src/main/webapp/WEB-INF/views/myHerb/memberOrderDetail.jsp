<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	<script>
	$(function(){
		
		$(document).on('click', '.orderDel', orderDelfunction);
		
		
		function orderDelfunction(){
			
			var orderNum = $(this).val();
			var confirm_val = confirm("정말 주문 취소하시겠습니까?");
			
			if(confirm_val){
				
				$.ajax({
					 type : 'GET',
					 dataType : 'json',
					 url : 'orderDel.do?orderNum='+orderNum,
					 success : function(data){
						 
					       if(data.result == "ok"){
					    	   alert("주문이 취소되었습니다.")
					       location.href="memberOrderDetail.do?orderNum="+orderNum;
					    		   
					       }else{
					          alert("주문 취소 실패");
					          }
					                                					
					 },error : function(data){
					       
						 alert('전송오류');
					     console.log("서버 호출을 정상적으로 처리하지 못 했습니다.");
					 } 
				}); //ajax끝
				
			}
		}
	}); // function 끝
	
	</script>	
	
	<style>
		.addCart_btn:active {
		background-color : #252525;
		
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
                        <a href="#"><i class="fa fa-home"></i> My Herb</a>
                        <span>주문 목록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
            
            	<!-- 사이드바 -->
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    
                    <div class="filter-widget">
                        <h4 class="fw-title">My Herb</h4>
                        <ul class="filter-catagories" style="font-weight: bold;">
                            <li><a href="memberOrder.do" style="color:orange;">주문 조회</a></li>
                            <li><a href="memberReview.do" >구매 후기</a></li>
                            <li><a href="memberUpdate.do"  >개인 정보 수정</a></li>
                            <li><a href="memberDelete.do" >탈퇴하기</a></li>
                        </ul>
                    </div>

                   
                </div>
                
                <!-- content 시작 -->
                <div class="col-lg-9 order-1 order-lg-2">
       
       		    <h2 style="font-weight:bold;">${member.userName}님의 허브</h2>
           		<h4 style="font-weight:bold; color:gray;">${member.userEmail}</h4>
           		<br>
           		<br>
           		<h3 style="font-weight:bold;">주문 상세</h3>
           		<br>
           		<p><span style="font-size:20px; font-weight:bold; color:black;">
           		<fmt:formatDate value="${orderDetailList[0].orderDate}" type="date"/>
           		
           		주문 &nbsp;</span><span style="font-size:20px; font-weight:bold; color:gray">주문 번호 ${orderDetailList[0].orderNum}</span></p>
           		<br>
           		<br>
   				
                <div id="content">
                	
                	<table class="table table-bordered" style="
    					box-shadow:2px 2px 3px 1px gray;">
                		
                		<tr>
                			
                			<td style="width:70%"> <!-- 왼쪽 -->
                			
                				<div style="margin:20px;"> <!-- 배송상태랑 상품목록 감싸기 -->
                				
                				<div style="margin-top:20px; margin-bottom:20px;"> <!-- 배송상태 -->
                					<c:choose>
                						<c:when test="${orderDetailList[0].orderDel == 'N'}">
                							<h5 style="font-weight:bold;">${orderDetailList[0].orderStatus}</h5>
                						</c:when>
                						<c:otherwise>
                							<h5 style="font-weight:bold; color:gray;">취소완료</h5>
                						</c:otherwise>
                						
                					</c:choose>
                				</div> <!-- 배송상태 끝 -->
                				
                				       <!-- 상품 목록 시작 -->
                				       
                				 <c:forEach items="${orderDetailList}" var="orderDetailList">   
                				    
                				<table style="border-style:hidden; width:100%">
                						<tr style="border-style:hidden;">
                							<td rowspan="2" style="width:23%; border-style:hidden;"> <!-- 이미지 -->
                								<img style="width:90px; height:90px;"src="${pageContext.request.contextPath}/resources/img/cart-page/product-1.jpg" alt="">
                							</td>
                							<td>
                								${orderDetailList.pName}
                							</td>
                						</tr>
                							
                						<tr style="border-style:hidden;"> 
                							<td>
                							<fmt:formatNumber pattern="###,###,###" value="${orderDetailList.pCost}" /> 원  • ${orderDetailList.orderDetailStock} 개
                							</td>
                						</tr>
                				</table>
                				</c:forEach>
                						<!-- 상품 목록 끝 -->
                				</div> <!-- 배송상태랑 상품목록 감싸기 끝 -->
                			</td>
                			
                			<td> <!-- 오른쪽-->
                				
                				<div style="text-align:center; margin-top: 30%;">
                				<c:choose>
                					<c:when test="${orderDetailList[0].orderDel == 'N'}">
                							<button class="orderDel addCart_btn primary-btn pd-cart" style="border-style:none;" type="button" value="${orderDetailList[0].orderNum}">주문 취소</button>
                						</c:when>
                						<c:otherwise>
                							<button class="primary-btn pd-cart" style="border-style:none; background-color:#636363; " type="button">주문 취소 완료</button>
                						</c:otherwise>
                						
                				</c:choose>
                				
                				</div>
                			</td>
                		</tr>
                	
                	
                	</table>
                	
                	<br>
                	<br>
                	
                  <table class="table">  <!-- 받는 사람 정보 -->
  					  <thead class="table-active">
    					  <tr>
      						  <th style="width:20%; font-size:18px;">받는 사람 정보</th>
      						  <th></th>
        				  </tr>
   					</thead>
   					 <tbody>
      					<tr>
        					<td style="font-weight:bold;">받는사람</td>
        					<td>${orderDetailList[0].orderRecvName}</td>
	    				</tr>
      					<tr>
        					<td style="font-weight:bold;">연락처</td>
        					<td>${orderDetailList[0].orderRecvPhone}</td>
      					</tr>
     					<tr>
        					<td style="font-weight:bold;">받는 주소</td>
        					<td>${orderDetailList[0].orderRecvAddress1}
        						${orderDetailList[0].orderRecvAddress2}
        						${orderDetailList[0].orderRecvAddress3}</td>
        				</tr>
        				<tr>
        					<td style="font-weight:bold;">요청 사항</td>
        					<td>${orderDetailList[0].orderMessage}</td>
        					
        				</tr>
        				
			    </tbody>
  				</table> <!-- 받는 사람 정보 끝 -->
  					<br>
  					<br>
                 
                 <table class="table"> <!-- 결제 정보 시작 -->
  					  <thead class="table-active">
    					  <tr>
      						  <th style="width:20%; font-size:18px;">결제 정보</th>
      						  <th></th>
        				  </tr>
   					</thead>
   					 <tbody>
      					<tr>
        					<td style="width:60%;"> <!-- 위 왼쪽 시작 -->
        						<table>
        							<tr>
        								<td style="border-style:hidden;">결제수단</td>
        							</tr>
        							<tr>
        								<td style="border-style:hidden; font-weight:bold;">신용카드</td>
        							</tr>
        						</table>
        					</td> <!-- 위 왼쪽 끝 -->
        					
        					<td class="table-active"> <!-- 위 오른쪽  시작-->
        						<table>
        							<tr>
        								<td style="border-style:hidden; width:65%;">
        									총 상품 가격
        								</td >
        								<td style="border-style:hidden; font-weight:bold;" >
        									<fmt:formatNumber pattern="###,###,###" value="${orderDetailList[0].orderAmount}" /> 원  
        									
        								</td>
        							</tr>
        								
        							<tr>
	        							<td>
	        								배송비
        								</td>
        								<td>
 		       								2,500원
        								</td>
        							</tr>
        						</table>
        					</td> <!-- 위 오른쪽 끝-->
	    				</tr>
	    				
      					<tr>
        					<td><!-- 아래 왼쪽 시작 -->
        					
        					</td> <!-- 아래 왼쪽 끝 -->
        					<td class="table-active"><!-- 아래 오른쪽 시작 -->
        					        <table>
        							<tr>
        								<td style="border-style:hidden; width:65%;">
        									신용카드
        								</td >
        								<td style="border-style:hidden; font-weight:bold;" >
        									<fmt:formatNumber pattern="###,###,###" value="${orderDetailList[0].orderAmount+2500}" /> 원  
        									
        								</td>
        							</tr>
        								
        							<tr style="font-weight:bold;">
	        							<td>
	        								총 결제 금액
        								</td>
        								<td>
 		       								<fmt:formatNumber pattern="###,###,###" value="${orderDetailList[0].orderAmount+2500}" /> 원  
        								</td>
        							</tr>
        						</table>
        					</td> <!-- 아래 오른쪽 끝 -->
      					</tr>
			    </tbody>
  				</table><!-- 결제 정보 끝 --> 		
				<br>
				<br>
				
				<!-- 배송 안내 이미지  -->
    			<table class="table table-bordered">
    				<tr>
    					<td>
    						<img src="${pageContext.request.contextPath}/resources/img/배송상태.png" alt="">
    					</td>
    				</tr>
    			</table>
    			<!-- 배송 안내 이미지 끝 -->
               		</div>  <!-- 주문 목록 끝 -->
               		
               		
               		
                </div><!-- content 끝 -->
                
                
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->


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