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
	<!-- 결제 api -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<script>
$(function(){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp34761928'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : '${order.orderNum}',
        name : '어른허브 결제',
        amount : '${order.orderAmount}',
        //buyer_email : 'wngmlgksk2@naver.com',
        buyer_name : '${order.orderRecvName}',
        buyer_tel : '${order.orderRecvPhone}',
        buyer_addr : '${order.orderRecvAddr2}'+' '+'${order.orderRecvAddr3}',
        buyer_postcode : '${order.orderRecvAddr1}',
        //m_redirect_url : 'http://www.naver.com'
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            //성공시 이동할 페이지
           location.href='paySuccess.do';
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
            location.href="<%=request.getContextPath()%>/order/payFail";
            alert(msg);
        }
    });
    
});
 
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
                        <a href="index.do"><i class="fa fa-home"></i>장바구니</a>
                        <span>주문/결제</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->


 	
 	    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
           <form action="orderInsert.do" method="post" class="checkout-form">
                <div class="row">
                    <div class="col-lg-6">
                        
                        <h4>주문/결제</h4>
                        <div class="row">
                            <!-- <div class="col-lg-6">
                                <label for="fir">First Name<span>*</span></label>
                                <input type="text" id="fir">
                            </div>
                            <div class="col-lg-6">
                                <label for="last">Last Name<span>*</span></label>
                                <input type="text" id="last">
                            </div> -->
                            <!-- 이름 -->
                            <div class="col-lg-12">
                                <label for="orderRecvName">이름<span>*</span></label>
                                <input type="text" id="orderRecvName" name="orderRecvName" value="${order.orderRecvName}">
                            </div>
                            
                            <!-- 연락처 -->
                            <div class="col-lg-12">
                                <label for="orderRecvPhone">전화번호<span>*</span></label>
                                <input type="text" id="orderRecvPhone" name="orderRecvPhone" value="${order.orderRecvPhone }">
                            </div>
                            
                            <!-- 배송메세지 입력 -->
                            <div class="col-lg-12">
                                <label for="orderMessage">배송 메세지<span>*</span></label>
                                
                                <div class="input-group mb-3">
			                   		
			                   		<input type="text" name="orderMessage" list="orderMessage" value="${order.orderMessage }"/>
										<datalist id="orderMessage">
										  <option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
										  <option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
										  <option value="부재시 집 앞에 놔주세요.">부재시 집 앞에 놔주세요.</option>
										  <option value="부재시 전화 주시거나 문자 남겨주세요.">부재시 전화 주시거나 문자 남겨주세요.</option>
										</datalist>
			                   	</div>
                            </div>
                            
                            
                            <!-- 주소 -->
                            <div class="col-lg-12">
                                <label for="orderRecvAddr1">주소<span>*</span></label>
                                <div class="d-flex">
									<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="orderRecvAddr1" id="order_address" type="text" value="${order.orderRecvAddr1 }" readonly="readonly" >
					    <button type="button" class="btn btn-default" ><i class="fa fa-search"></i> 우편번호 찾기</button>
								</div>
								<div class="d-flex">
									<label for="orderRecvAddr2"></label>
									<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="orderRecvAddr2" id="order_address" value="${order.orderRecvAddr2 } " type="text" readonly="readonly" />
								</div>
								<div class="d-flex">
									<label for="orderRecvAddr3"></label>
									<input class="form-control" placeholder="상세주소" name="orderRecvAddr3" id="order_detailaddress" value="${order.orderRecvAddr3 }" type="text"  />
								</div>
                            </div>
                            
                            <!--  -->
                            <!-- <div class="col-lg-12">
                                <label for="zip">Postcode / ZIP (optional)</label>
                                <input type="text" id="zip">
                            </div> -->
                            
                            <div class="col-lg-12">
                                <div class="create-item">
                                    <label for="acc-create">
                                        	위 상품의 구매조건을 확인하였으며, 결제 진행을 동의 합니다.
                                        <input type="checkbox" id="acc-create">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <!-- 주희씨 제가 여기만 건들였읍니다.. 
                    	배송비까지 포함된 총 합계금액은 ${sum}에다가 넣어놨읍니다.. 
                    -->
                    
                    <!-- 카트 리스트  -->
                    <div class="col-lg-6">
                        
                        <div class="place-order">
                            <h4>카트 목록</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>상품 <span>합계</span></li>
                                    
                                    <!-- 반복 시작 -->
                                    <c:set var="sum" value="0" /> <!-- 총 합계금액 구하기 위한 변수 선언 -->
                                    <c:forEach items="${cartList}" var="cartList">
                                    <li class="fw-normal">${cartList.pName} x ${cartList.cartStock} <span><fmt:formatNumber pattern="###,###,###" value="${cartList.pCost * cartList.cartStock}" /> 원</span></li>
                                    <c:set var="sum" value="${sum + (cartList.pCost * cartList.cartStock)}"/> 
                                    </c:forEach>
                                    <!-- 반복 끝 -->
                                    <li class="fw-normal" style="color:gray; font-weight:bold;">배송비 <span>2,500원</span></li>
                                    <li class="total-price">총 합계 <span><fmt:formatNumber pattern="###,###,###" value="${sum + 2500}" />원</span></li>
                                </ul>
                                
                                <input type="hidden" id="orderAmount" name="orderAmount" value="${sum+2500 }">
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">결제 하기</button>
                                </div>
                            </div>
                        </div>
                        <!--  주연 여기까지.. -->
                        
                        
                        
                        
                    </div>
                </div>
            </form> 
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