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
    <!-- Icon -->
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
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
    <!-- sujung css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sujung.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	//테이블 스크롤 설정
	$(function() {
		$(document).ready(function() {
			$('#dtHorizontalExample').DataTable({
				"scrollX" : true
			});
			$('.dataTables_length').addClass('bs-select');
		});
	});

	$(function() {
		$('#orderUpt').on('click', function() {
			var orderStr = $('#orderStatus').val();
			var orderDetailNum = $('#orderDetailNum').val();
			$.ajax({
				url : 'orderUpt.do',
				data : {
					'orderStatus' : orderStr,
					'orderDetailNum' : orderDetailNum
				},
				type : 'POST',
				dataType : 'json',
				success : function(data) {
					if (data.ok == 'dup') {
						alert('배송상태 업데이트 실패');
					} else {
						alert('배송상태 업데이트 성공');
					}
				},
				error : function(request, status, errorData) {
					alert("error code: " + request.status + "\n" // 오류 번호 나옴 ex)500 404
							+ "message: " + request.responseText + "\n" //오류 원인(기술 용어로 나옴)
							+ "error: " + errorData);
				}
			});
		})
	});
</script>
<style>
.dtHorizontalExampleWrapper {
	max-width: 600px;
	margin: 0 auto;
}

#dtHorizontalExample th, td {
	white-space: nowrap;
}

table.dataTable thead .sorting:after, table.dataTable thead .sorting:before,
	table.dataTable thead .sorting_asc:after, table.dataTable thead .sorting_asc:before,
	table.dataTable thead .sorting_asc_disabled:after, table.dataTable thead .sorting_asc_disabled:before,
	table.dataTable thead .sorting_desc:after, table.dataTable thead .sorting_desc:before,
	table.dataTable thead .sorting_desc_disabled:after, table.dataTable thead .sorting_desc_disabled:before
	{
	bottom: .5em;
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
                        <a href="adminMain.do"><i class="fa fa-home"></i> Admin</a>
                        <span>주문관리</span>
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
                <div class="col-lg-2 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    
                    <div class="filter-widget">
                        <h4 class="fw-title">Admin</h4>
                        <ul class="filter-catagories" style="font-weight: bold;">
                            <li><a href="adminProduct.do" >상품관리</a></li>
                            <li><a href="adminOrder.do" style="color: #e7ab3c">주문관리</a></li>
                            <li><a href="adminMember.do" >회원관리</a></li>
                        </ul>
                    </div>              
                </div>
                
                <!-- 내용 -->
                <div class="col-lg-10 order-1 order-lg-2">

               	<h3><i class='fas fa-box-open' style='font-size:32px; color:#e7ab3c'></i> 주문관리</h3>
                <br>
				<div id="searchDiv">
                 <form action="searchOrder.do">
                        <div class="form-inline serch">
                            <select name="selectType" class="custom-select-sm">
                            <option value="orderNum">주문번호</option>
                            <option value="userName">주문자</option>
                            </select>
                            <div class="input-group">
                                <input type="text" class="control-sm" name="keyword">
                                <button type="submit" id="searchButton" class="btn-warning" >
                                	<i class="ti-search"></i></button>
                            &nbsp;&nbsp;
                            </div>
                       	 </div>
                       </form>
                    </div>
				
				<br><br>
					<div class="table-responsive" id="orderDiv" style="overflow-x:scroll;">
						<table id="dtHorizontalExample" class="table table-bordered orderTable" 
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>상품주문번호</th>
									<th>주문 번호</th>
									<th>주문 일자</th>
									<th>주문자</th>
									<th>수령인</th>
									<th>수령 주소</th>
									<th>연락처</th>
									<th>주문 상품</th>
									<th>주문 수량</th>
									<th>총 주문금액</th>
									<th>배송 상태</th>
									<th>취소여부(N/Y)</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="order" items="${orderList}">
								<tr>
									<td>
										<a href="adminOrderDetail.do?orderDetailNum=${order.orderDetailNum }" class="aTag">
										${order.orderDetailNum }</a>
									</td>
									<td>${order.orderNum }</td>
									<td>${order.orderDate }</td>
									<td>${order.userName }</td>
									<td>${order.orderRecvName }</td>
									<td>(${order.orderRecvAddress1}) ${order.orderRecvAddress2} ${order.orderRecvAddress3}</td>
									<td>${order.orderRecvPhone }</td>
									<td>${order.pName }</td>
									<td>${order.orderDetailStock }</td>
									<td>${order.orderAmount }</td>
									<td>
										<select name="orderStatus" id="orderStatus" class="custom-select-sm">
										<option ${(param.orderStatus)=="배송 준비중" ? "selected" : "" } value="배송 준비중">배송 준비중</option>
                            			<option ${(param.orderStatus)=="배송중" ? "selected" : "" } value="배송중">배송중</option>
                            			<option ${(param.orderStatus)=="배송완료" ? "selected" : "" } value="배송완료">배송완료</option>
                            			</select>
                           			</td>
									<td>${order.orderDel }</td>
									<td>
										<input type="hidden" id="orderDetailNum" value="${order.orderDetailNum }"> 
										<button id="orderUpt" style="border: white; background: #e7ab3c; color: white;">수정</button>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<!-- 앞 페이지 번호 처리 -->
					<div class="pageDiv">
						<c:if test="${currentPage <= 1}"> 
  								<span id="notPrev">[이전]&nbsp;</span>
 						</c:if> 
 						<c:if test="${currentPage > 1}">
						<!-- 페이지 많아지면 5로 처리하는게 맞음 ( ex)6페이지에서 [이전] 버튼 클릭 ) -->
							<c:url var="proST" value="adminOrder.do">
								<!-- blist.do?page=?  파라미터 자동으로 전달 -->
								<c:param name="page" value="${currentPage-1}" />
							</c:url>
							<a class="paging" href="${proST}">[이전]</a>
						</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
						<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
							<c:if test="${p eq currentPage}">
								<font color="#e7ab3c" size="4"><b>[${p}]</b></font>
							</c:if>
							<c:if test="${p ne currentPage}">
								<c:url var="prostchk" value="adminOrder.do">
									<c:param name="page" value="${p}" />
								</c:url>
								<a class="paging" href="${prostchk}">${p}</a>
							</c:if>
						</c:forEach> 
						<c:if test="${currentPage >= maxPage}">
 							<span id=notEnd>[다음]</span>
 						</c:if> 
 						<c:if test="${currentPage < maxPage}">
							<c:url var="proEND" value="adminOrder.do">
								<c:param name="page" value="${currentPage+1}" />
							</c:url>
							<a class="paging" href="${proEND}">[다음]</a>
						</c:if>
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