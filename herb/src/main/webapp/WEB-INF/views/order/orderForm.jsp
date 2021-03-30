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
	<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//우편번호 찾기 버튼 클릭시 발생 이벤트
function execPostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);
         /*      var a = console.log(data.zonecode);
            var b = console.log(fullRoadAddr);
            
            if(a == null || b = null){
               alert("주소를 확인하세요.");
               return false;
            }   */
            
            
            $("[name=mem_oaddress]").val(data.zonecode);
            $("[name=mem_address]").val(fullRoadAddr);
            
            document.getElementById('mem_oaddress').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('mem_address').value = fullRoadAddr;
            //document.getElementById('mem_detailaddress').value = data.jibunAddress; 
        }
     }).open();
 }
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
            <form action="orderInsert.do" class="checkout-form">
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
                                <input type="text" id="orderRecvName">
                            </div>
                            
                            <!-- 연락처 -->
                            <div class="col-lg-12">
                                <label for="orderRecvPhone">전화번호<span>*</span></label>
                                <input type="text" id="orderRecvPhone">
                            </div>
                            
                            <!-- 배송메세지 입력 -->
                            <div class="col-lg-12">
                                <label for="orderMessage">배송 메세지<span>*</span></label>
                                
                                <div class="input-group mb-3">
			                   		
			                   		<input type="text" list="orderMessage" />
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
									<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="orderRecvAddr1" id="order_address" type="text" readonly="readonly" >
					    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
								</div>
								<div class="d-flex">
									<label for="orderRecvAddr2"></label>
									<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="orderRecvAddr2" id="order_address" type="text" readonly="readonly" />
								</div>
								<div class="d-flex">
									<label for="orderRecvAddr3"></label>
									<input class="form-control" placeholder="상세주소" name="orderRecvAddr3" id="order_detailaddress" type="text"  />
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
                                        	위 상품의 구매조건 확인을 하였으며, 결제 진행을 동의 합니다.
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
                                
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn" onclick="location.href='orderInsert.do'">결제 하기</button>
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