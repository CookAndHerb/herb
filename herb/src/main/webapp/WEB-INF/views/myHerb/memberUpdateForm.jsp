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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- 부트스트랩 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- daum 도로명주소 찾기 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
    
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
    
    <style type="text/css">
	</style>

    <style>
    
    .label {
    display:inline-block;
    width:180px;
    font-size:18px;
	font-weight: bold;
    }
    
    .form-control {
    display:inline-block;
    width: 30%;
    }
    
    .eheck_font{
    display:inline-block;
    }
    
    </style>
    
     <script type="text/javascript">
     
//모든 공백 체크 정규식
var empJ = /\s/g;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

$(document).ready(function() {
   var address = $('#mem_detailaddress');
   
     $('form').on('submit',function(){
         var inval_Arr = new Array(3).fill(false);
         // 비밀번호가 같은 경우 && 비밀번호 정규식
         if (($('#userPw').val() == ($('#userPw2').val()))
               && pwJ.test($('#userPw').val())) {
            inval_Arr[0] = true;
         } else {
            inval_Arr[0] = false;
            alert('비밀번호를 확인하세요.');
            return false;
         }

         // 휴대폰번호 정규식
         if (phoneJ.test($('#userPhone').val())) {
            console.log(phoneJ.test($('#userPhone').val()));
            inval_Arr[1] = true;
         } else {
            inval_Arr[1] = false;
            alert('핸드폰 번호를 확인하세요.');
            return false;   
         }
         
         //주소확인
            if(address.val() == ''){
               inval_Arr[2] = false;
               alert('주소를 확인하세요.');
               return false;
            }else
               inval_Arr[2] = true;
         
          //전체 유효성 검사
         var validAll = true;
         for(var i = 0; i < inval_Arr.length; i++){
            if(inval_Arr[i] == false){
               validAll = false;
            }
         }
         if(validAll == true){ // 유효성 모두 통과
            alert('수정 완료되었습니다.');
         } else{
            alert('정보를 다시 확인하세요.')
         }
       });
   $('#userPw').blur(function() {
      if (pwJ.test($('#userPw').val())) {
         console.log('true');
         $('#pw_check').text('');
      } else {
         console.log('false');
         $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
         $('#pw_check').css('color', 'red');
      }
   });
   //1~2 패스워드 일치 확인
   $('#userPw2').blur(function() {
      if ($('#userPw').val() != $(this).val()) {
         $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
         $('#pw2_check').css('color', 'red');
      } else {
         $('#pw2_check').text('');
      }
   });
   
     // 휴대전화
   $('#userPhone').blur(function(){
       if(phoneJ.test($(this).val())){
           console.log(nameJ.test($(this).val()));
           $("#phone_check").text('');
           } else {
              $('#phone_check').text('휴대폰번호를 확인해주세요 ');
              $('#phone_check').css('color', 'red');
           }
        });
});

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
            
            
            $("[name=userAddress1]").val(data.zonecode);
            $("[name=userAddress2]").val(fullRoadAddr);
            
            document.getElementById('userAddress1').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('userAddress2').value = fullRoadAddr;
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
	    <!-- ##### Hero Area Start ##### -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> My Herb</a>
                        <span>개인 정보 수정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- content부분 시작-->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
            
            	<!-- 사이드바 -->
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    
                    <div class="filter-widget">
                        <h4 class="fw-title">My Herb</h4>
                        <ul class="filter-catagories" style="font-weight: bold;">
                            <li><a href="memberOrder.do" >주문 조회</a></li>
                            <li><a href="memberReview.do" >구매 후기</a></li>
                            <li><a href="#" style="color:orange;" >개인 정보 수정</a></li>
                            <li><a href="memberDelete.do" >탈퇴하기</a></li>
                        </ul>
                    </div>

                   
                </div>
                
                <!-- 내용 -->
                <div class="col-lg-9 order-1 order-lg-2">
       
       
           <!-- 개인 정보 수정 폼 시작-->
           <h2 style="font-weight:bold;">${member.userName}님의 허브</h2>
           <h4 style="font-weight:bold; color:gray;">${member.userEmail}</h4>
           <br>
           <h3 style="font-weight:bold;">개인 정보 수정</h3>
           <br>
           <br>
           
           <!-- 폼 시작 -->
                <form action="memberUpdate.do" method="post" role="form" id="usercheck" name="member" style="margin-left:130px;">
                
                    <div class="form-group">
                        <div class="label">아이디</div>
                        <input type="text" class="form-control" id="userId" name="userId"  value="${sessionScope.member.userId}" readonly="readonly">
                        <div class="eheck_font" id="id_check"></div>
                    </div>
                    
                    <div class="form-group">
                        <div class="label">비밀번호 재설정</div>
                        <input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호" >
                        &nbsp;<div class="eheck_font" id="pw_check"></div>
                    </div>
                    <div class="form-group">
                        <div class="label">비밀번호 재설정 확인</div>
                        <input type="password" class="form-control" id="userPw2" name="userPw2" placeholder="비밀번호 확인">
                          &nbsp;<div class="eheck_font" id="pw2_check"></div>
                    </div>
                    
                       <div class="form-group">
                        <div class="label">이름</div>
                        <input type="text" class="form-control" id="userName" name="userName"  value="${sessionScope.member.userName}" readonly="readonly">
                         <div class="eheck_font" id="name_check"></div>
                    </div>
                    
                    
                    <div class="form-group">
                        <div class="label">이메일</div>
                        <input type="email" class="form-control" id="userEmail" name="userEmail" value="${sessionScope.member.userEmail}" readonly="readonly">
                       <div class="eheck_font" id="email_check"></div>
                    </div>
                    
             
                    <div class="form-group">
                        <div class="label">휴대폰 번호</div>
                        <input type="tel" class="form-control" id="userPhone" name="userPhone"  value="${sessionScope.member.userPhone}">
                         &nbsp;<div class="eheck_font" id="phone_check"></div>
                    </div>
					
					<div class="form-group">       
 						<div class="label">주소</div>      
						<input class="form-control" style="width: 20%; display: inline;" placeholder="우편번호" name="userAddress1" id="mem_oaddress" type="text"  value="${sessionScope.member.userAddress1}" >
  						<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
					</div>

					<div class="form-group">
						<div class="label"></div>
   					 	<input class="form-control" style="top: 5px; width: 40%; display: inline;" placeholder="도로명 주소" name="userAddress2" id="mem_address" type="text" value="${sessionScope.member.userAddress2}"/>
					</div>

					<div class="form-group">
						<div class="label"></div>
    					<input class="form-control" style="width: 40%;display: inline;" placeholder="상세주소" name="userAddress3" id="mem_detailaddress" type="text" value="${sessionScope.member.userAddress3}"  />
					</div>

					<br>
                    <div class="form-group" style="margin-left:20px;" >
                        <button type="submit" class="site-btn register-btn" style="width:400px;">수정하기</button>                     
                    </div>
                </form>
 
    <!-- 개인 정보 수정 폼 끝 -->
                
                </div>
            </div>
        </div>
    </section>
    <!-- content 부분 끝 -->


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