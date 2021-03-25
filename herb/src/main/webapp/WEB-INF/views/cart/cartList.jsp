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
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	<script type="text/javascript">
	
	$(function(){
		
		$("#allCheck").click(function(){
		var chk = $("#allCheck").prop("checked");
		if(chk){
			$(".chBox").prop("checked",true);
		}else{
			$(".chBox").prop("checked",false);
			}
		}); // 체크 버튼 끝
		
		$(".chBox").click(function(){
			$("#allCheck").prop("checked",false);	
		});
		
		
		$(document).on('click', '.plus', plusfunction);
		$(document).on('click', '.minus', minusfunction);
		$(document).on('click', '.cartDel', deletefunction);
		$(document).on('click', '.cartAllDel', deleteAllfunction);
	
	function plusfunction(){
		
		var uptdata = $(this).val().split('*');
			   
		var count = uptdata[1];

		count++;

		$.ajax({
			 type : 'GET',
			 dataType : 'json',
			 url : 'updateCart.do?cartNum='+uptdata[0]+'&cartStock='+count,
			 success : function(data){
				 
			       if(data.result == "ok"){
			       location.href="cartList.do"
			       }else{
			          alert("옵션 수정 실패");
			          }
			                                					
			 },error : function(data){
			       
				 alert('전송오류');
			     console.log("서버 호출을 정상적으로 처리하지 못 했습니다.");
			 } 
		}); //ajax끝
	}


	function minusfunction(){
			  
			var uptdata = $(this).val().split('*');
			   
			var count = uptdata[1];
			  
			if(count != 1){
				
			      count--;
			      
			$.ajax({
			     type : 'GET',
			     dataType : 'json',
			     url : 'updateCart.do?cartNum='+uptdata[0]+'&cartStock='+count,
			     success : function(data){
			          
			    	 if(data.result == "ok"){
			         location.href="cartList.do"
			         }else{
			           alert("옵션 수정 실패");
			         }
			                                					
			      },error : function(data){
			          alert('전송오류');
			         console.log("서버 호출을 정상적으로 처리하지 못 했습니다.");
					}
			  }); // ajax끝
		} // minusfunction() 끝
	}
	
	function deletefunction(){ // 하나만 선택 삭제
		
	   $.ajax({
	      type : 'GET',
	      dataType : 'json',
	      url : 'deleteCart.do?cartNum='+$(this).val(),
	      success : function(data){
		    	 if(data.result == "ok"){
		         location.href="cartList.do"
		         }else{
		           alert("삭제 실패");
		         }
		                                					
		      },error : function(data){
		          alert('전송오류');
		         console.log("서버 호출을 정상적으로 처리하지 못 했습니다.");
				}
		  }); // ajax끝
	} // deletefunction() 끝
	
	function deleteAllfunction(){
		
		var checkArr = new Array(); // 배열 생성
		
		$("input[class='chBox']:checked").each(function(){
			checkArr.push($(this).attr("data-cartNum"));
		});
		
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'deleteAllCart.do',
			data : { chbox : checkArr },
			success : function(data){
				
				if(data.result == "ok"){
			         location.href="cartList.do"
			         }else{
			           alert("선택 삭제 실패");
			         }
			},error : function(data){
		          alert('전송오류');
			         console.log("서버 호출을 정상적으로 처리하지 못 했습니다.");
			} 
			
		}); // ajax 끝
		
	}// deleteAllfunction() 끝
	
	
	});// script 끝
	
	</script>

</head>
<body>
	<!-- 상단 공동 메뉴 -->
	<header>
		<%@ include file="../template/header.jsp" %>
	</header>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="index.do"><i class="fa fa-home"></i>Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->
    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                	<th><input style="background-color:yellow;"type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">&nbsp;&nbsp;모두 선택</label></th>
                                  
                                    <th>상품 이미지</th>
                                    <th class="p-name">상품명</th>
                                    <th>개당 가격</th>
                                    <th>수량</th>
                                    <th>총 가격</th>
                                    <th>
                                    <button type="button" class="cartAllDel btn btn-secondary btn-sm">선택 삭제</button>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <c:set var="sum" value="0" />
                            <!-- 반복구간 시작 -->
                            <c:forEach items="${cartList}" var="cartList">
                            
                                <tr>
                                	<td><input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}"/></td>
                                    <td class="cart-pic first-row"><img src="${pageContext.request.contextPath}/resources/img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title first-row"><h5 style="font-weight:bold;">${cartList.pName}</h5></td>
                                    <td class="p-price first-row"><fmt:formatNumber pattern="###,###,###" value="${cartList.pCost}" />원</td>
                                    <td class="qua-col first-row">
                                        <div class="quantity">
                                            
                                            <button class="minus" value="${cartList.cartNum}*${cartList.cartStock}">-</button>
											<input type="text" class="count" size="1" value="${cartList.cartStock}" style="text-align: center; border-left: none; border-right: none; border-top:2px solid #b3b3b3; border-bottom: 2px solid #b3b3b3;">
											<button class="plus" value="${cartList.cartNum}*${cartList.cartStock}">+</button>
                                            
                                        </div>
                                    </td>
                                    <td class="total-price first-row"><fmt:formatNumber pattern="###,###,###" value="${cartList.pCost * cartList.cartStock}" /> 원</td>
                                    <td class="close-td first-row">
                                    	<button type="button" class="cartDel btn btn-secondary btn-sm" value="${cartList.cartNum}" data-cartNum="${cartList.cartNum}">삭제</button>
                                    </td>
                                </tr>
                                
                                	
                              <c:set var="sum" value="${sum + (cartList.pCost * cartList.cartStock)}"/>
                              </c:forEach>
 							<!-- 반복구간 끝 -->

                            </tbody>
                        </table>
                    </div>
                    
                    <div class="row">
                   
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href="#" class="primary-btn continue-shop">쇼핑 계속하기</a>
                            </div>
                        </div>
                        
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <li class="subtotal">총 가격 <span><fmt:formatNumber pattern="###,###,###" value="${sum}" />원</span></li>
                                    <li class="subtotal">배송비 <span>3,000원</span></li>
                                    <li class="cart-total">합계 가격 <span><fmt:formatNumber pattern="###,###,###" value="${sum + 3000}" />원</span></li>
                                </ul>
                                <a href="orderForm.do" class="proceed-btn">결제하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

 	
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