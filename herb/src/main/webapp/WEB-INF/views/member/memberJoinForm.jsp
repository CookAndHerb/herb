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
    
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>회원가입</title>
<style>
	* {
    	margin: 0;
    	padding: 0;
    	float:none;
	}
	td{
		padding: 10px; 
	}
	.form-group{
		width:100%;
		padding: 60px;
		padding-bottom: 160px;
	}
	#join_btn{
		background-color:  #e7ab3c;
    	border-color:  #e7ab3c;
		width: 240px;
		
	}
	#idCheck{
    	border-color:  #e7ab3c;
    	color: #e7ab3c;
	}
	#idCheck:hover{
		background-color:  #e7ab3c;
		color: white;
	}
	#NicknameCheck{
    	border-color:  #e7ab3c;
    	color: #e7ab3c;
	}
	#NicknameCheck:hover{
		background-color:  #e7ab3c;
		color: white;
	}
	#emailCheck{
    	border-color: #e7ab3c;
    	color: #e7ab3c;
	}
	#emailCheck:hover{
		background-color:  #e7ab3c;
		color: white;
	}
	#emailCheckNum{
		border-color: #e7ab3c;
    	color: #e7ab3c;
	}
	#emailCheckNum:hover{
		background-color:  #e7ab3c;
		color: white;
	}
	.table-borderless td{
		font-size: 16px;
		font-weight: bold;
	}
	h3{
		font-weight: bold;
		text-align: center; 
		padding-bottom: 30px;
	}
	.border1{
		border: 1px solid #d3d3d3;
		width: 900px;
		margin-bottom: 40px;
		box-shadow: 0 0 0 1px #d3d3d3 inset; 
	}
	.border2{
		border: 1px solid #d3d3d3;
		width: 900px;
		box-shadow: 0 0 0 1px #d3d3d3 inset;
		margin-bottom: 30px;
	}
</style>
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
                        <a href="index.do"><i class="fa fa-home"></i> Home</a>
                        <span>Join</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->	
	
 <div class="form-group row justify-content-center">
	<form action="memberJoin.do" method="post" class="needs-validation" onsubmit="return check()" novalidate>
		<h3>회원가입</h3>
		<div class="border1"></div>
		<table class="table-borderless" style="margin: 0 250px 0 50px; ">
			<tr class="d-flex">
				<td class="col-4"><label for="userId">아이디</label></td>
				<td class="col-sm-12">
					<input type="text" name="userId" id="userId" class="form-control col-xs-10" 
					placeholder="아이디를 입력해 주세요" onkeyup="idCheckFunction();"required>
				</td>
				<td>
					<input type="button" name="idCheck" value="중복확인" id="idCheck" class="btn btn-outline-warning px-4">
				</td>
			</tr>
			<tr>
				<td><span id="idCheckMessage" style="color:red;font-weight:bold;"></span></td>
			</tr>
			<tr class="d-flex">
				<td class="col-4"><label for="userPW">비밀번호</label></td>
				<td class="col-sm-12">
					<input type="password" name="userPw" class="form-control" id="userPw" 
					placeholder="비밀번호를 입력해 주세요" onkeyup="pwCheckFunction();" required>
				</td>
			</tr>
			<tr>
				<td><span id="pwCheckMessage" style="color:red;font-weight:bold"></span></td>
			</tr>
			<tr class="d-flex">
				<td class="col-4"><label for="userPwRe">비밀번호 확인</label></td>
				<td class="col-sm-12"><input type="password" name="userPwRe" id="userPwRe" 
				class="form-control" onkeyup="passwordCheckFunction();" placeholder="비밀번호를 한 번 더 입력해 주세요" required>
				</td>
			</tr>
			<tr>
				<td><span id="passwordCheckMessage" style="color:red; font-weight:bold"></span></td>
			</tr>
			<tr class="d-flex">
				<td class="col-4"><label for="userName">이름</label></td>
				<td class="col-sm-12">
					<input type="text" name="userName" class="form-control" placeholder="이름을 입력해 주세요" required>
				</td>
			</tr>
			<tr class="d-flex">
				<td class="col-4"><label for="userEmail">이메일</label></td>
				<td class="col-sm-12">
					<input type="email" name="userEmail" id="userEmail" class="form-control" 
					placeholder="ex)herb@herb.com" required>
				</td>
				<td>
					<input type="button" name="emailCheck" id="emailCheck" value="인증번호" 
					class="btn btn-outline-warning px-4">
				</td>
			</tr>
			<tr>
				<td><span id="emailCheckMessage" style="color:red;font-weight:bold"></span></td>
			</tr>
			<tr class="d-flex">
				<td class="col-4"><label for="userEmailNum">인증번호</label></td>
				<td class="col-sm-12">
					<input type="text" name="userEmailNum" id="userEmailNum" class="form-control"
					 placeholder="인증번호를 입력해 주세요" required>
				</td>
				<td>
					<input type="button" name="emailCheckNum" id="emailCheckNum" value="인증하기" 
					class="btn btn-outline-warning px-4">
				</td>
			</tr>
			<tr>
				<td><span id="emailNumCheckMessage" style="color:red; font-weight:bold"></span></td>
			</tr>
			 
			<tr class="d-flex" >
				<td class="col-4"><label for="userBirth">생년월일</label></td>
				<td class="col-sm-12">
					<input type="text" name="userBirth" placeholder="숫자만 입력해 주세요"
					onkeyup="birthCheckFunction();" class="form-control" required>
				</td>
			</tr>
			<tr>
				<td><span id="birthCheckMessage" style="color:red;font-weight:bold"></span></td>
			</tr>
			<tr class="d-flex">
				<td class="col-4"><label for="userPhone">전화번호</label></td>
				<td class="col-sm-12">
					<input type="text" name="userPhone" placeholder="숫자만 입력해 주세요" 
					onkeyup="phoneCheckFunction();" class="form-control" required>
				</td>
			</tr>
			<tr>
				<td><span id="phoneCheckMessage" style="color:red; font-weight:bold; padding:10px;"></span></td>
			</tr>
			<!-- 주소 -->
			<tr class="d-flex">
				<td class="col-4"><label for="userAddress1">주소</label></td>
				<td class="col-sm-12">
				<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="userAddress1" id="mem_oaddress" type="text" readonly="readonly" >
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
				</td>
			</tr>
			<tr class="d-flex">
				<td class="col-4"><label for="userAddress2"></label></td>
				<td class="col-sm-12">
				<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="userAddress2" id="mem_address" type="text" readonly="readonly" />
				</td>
			</tr>
			<tr class="d-flex">
				<td class="col-4"><label for="userAddress3"></label></td>
				<td class="col-sm-12">
				<input class="form-control" placeholder="상세주소" name="userAddress3" id="mem_detailaddress" type="text"  />
				</td>
			</tr>
		</table>
		<br>
		<br>
		<div class="border2"></div>
		<div class="btn d-flex justify-content-center" style=" padding-top: 40px;">
			<input type="submit" id="join_btn" value="가입하기" class="btn btn-primary btn-lg" disabled="disabled">
		</div>
		<input type="hidden" name="checkedId" value="">
		<input type="hidden" name="checkedEmail" value="">
		<input type="hidden" name="checkedEmailNum" value="">
		<input type="hidden" name="checkedNickname" value="">
	</form>
</div>
<script>

	var code = ""; // 이메일 전송 인증번호 저장위한 코드
	// 폼 전송 전 버튼 체크
	function check() {
		  if($("input[name='checkedId']").val()==''){
			    alert('아이디 중복확인을 해주세요.');
			    $("input[name='checkedId']").eq(0).focus();
			    return false;
			}else if($("input[name='checkedEmail']").val()==''){
			    alert('인증번호 버튼을 눌러주세요 ');
			    $("input[name='checkedEmail']").eq(0).focus();
			    return false;
			}else if($("input[name='checkedEmailNum']").val()==''){
			    alert('인증하기 버튼을 눌러주세요 ');
			    $("input[name='checkedEmailNum']").eq(0).focus();
			    return false;
			}
		  	else return true;
	}
	// 회원가입 버튼 누르기 전 입력 체크
	(function() {
		  'use strict';
		  window.addEventListener('load', function() {
		    // Get the forms we want to add validation styles to
		    var forms = document.getElementsByClassName('needs-validation');
		    // Loop over them and prevent submission
		    var validation = Array.prototype.filter.call(forms, function(form) {
		      form.addEventListener('submit', function(event) {
		        if (form.checkValidity() === false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }
		        form.classList.add('was-validated');
		      }, false);
		    });
		  }, false);
		})();
	
	
	// 아이디 중복체크
	$('#idCheck').on("click", function(){
		$("input[name=checkedId]").val('y');
		var userId = $("#userId").val();
		if(userId == ''){
			$('#idCheckMessage').html('아이디를 입력해 주세요');
			return false;
		}
		
		$.ajax({
			 type : 'GET',
			 dataType : 'json',
			 url : 'idCheck.do?userId='+userId,
			 success : function(data){
				 
			       if(data.result == "ok"){
				$('#idCheckMessage').html('사용할 수 없는 아이디입니다.');
				$("#join_btn").attr("disabled", "disabled");
			       }else{
				$('#idCheckMessage').html('사용할 수 있는 아이디입니다.');
				$("#join_btn").removeAttr("disabled");
			          }
			                                					
			 },error : function(data){
			       
				 alert('전송오류');
			     	console.log("서버 호출을 정상적으로 처리하지 못 했습니다.");
			 } 
		});// ajax끝
		
	});

	// 이메일 인증번호 전송
	$('#emailCheck').on("click", function(){
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var userEmail = $("#userEmail").val();
		
		$("input[name=checkedEmail]").val('y');
		
		if(userEmail == ''){
			$('#emailCheckMessage').html('이메일을 입력해 주세요');
			return false;
		}else if(!regExp.test(userEmail)){
			$('#emailCheckMessage').html('올바르지 않은 이메일 주소입니다.');
			return false;
		}
		$.ajax({
			type: 'get', 
			url: 'memberEmail.do?userEmail='+userEmail,
			async : false,
			success: function(data){ 
				$('#emailCheckMessage').html('인증번호가 발송되었습니다.');
				code = data;
			}
		})
	});
	$('#emailCheckNum').on("click", function(){
		$("input[name=checkedEmailNum]").val('y');
		var userEmailNum = $("#userEmailNum").val();
		if(userEmailNum == ''){
			$('#emailNumCheckMessage').html('인증번호를 입력해 주세요');
			return false;
		}
		
			if(userEmailNum == code){ 
				alert("인증번호가 확인되었습니다.");
				$('#emailNumCheckMessage').html('');
				$("#join_btn").removeAttr("disabled");
			
				}else{
					alert("인증번호가 맞지 않습니다");
					$('#emailNumCheckMessage').html('');
					$("#join_btn").attr("disabled", "disabled");
				}
	});
	
	
	function idCheckFunction(){
		var userId = $('input[name=userId]');
		//소문자 시작, 소문자+숫자 포함하여 5 ~ 10글자
		if (/^[a-z][a-z0-9]{4,9}$/.test(userId.val())) {
			$('#idCheckMessage').html('');
			$("#join_btn").attr("disabled", "disabled");
		}else{
			$('#idCheckMessage').html('소문자와 숫자를 포함하여 5~10글자 이내로 입력해주세요.');
			$("#join_btn").removeAttr("disabled");
		}
	}
	function pwCheckFunction(){
		var userPw = $('input[name=userPw]');
		//영어+숫자 섞어서 5글자~10글자
		if (/^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$/.test(userPw.val())) {
			$('#pwCheckMessage').html('');
			$("#join_btn").removeAttr("disabled");
		}else{
			$('#pwCheckMessage').html('소문자와 숫자를 포함하여 5~10글자 이내로 입력해주세요.');
			$("#join_btn").attr("disabled", "disabled");
		}
	}
	function birthCheckFunction(){
		var userBirth = $('input[name=userBirth]');
		//숫자만 8글자
		if (/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/
				.test(userBirth.val())) {
			$('#birthCheckMessage').html('');
			$("#join_btn").removeAttr("disabled");
		}else{
			$('#birthCheckMessage').html('생년월일 8자리 입력 ex)19990101');
			$("#join_btn").attr("disabled", "disabled");
		}
	}
	function phoneCheckFunction(){
		var userPhone = $('input[name=userPhone]');
		if (/(^02.{0}|^01.{1}|[0-9]{4})([0-9]+)([0-9]{7})/g.test(userPhone.val())) {
			$('#phoneCheckMessage').html('');
			$("#join_btn").removeAttr("disabled");
		}else{
			$('#phoneCheckMessage').html('휴대폰번호 11자리 입력  ex)01012345678');
			$("#join_btn").attr("disabled", "disabled");
		}
	}
	function passwordCheckFunction(){
        var userPw = $('#userPw').val();
        var userPwRe = $('#userPwRe').val();
        if(userPw!=userPwRe){
            $('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
            $("#join_btn").attr("disabled", "disabled");
        }
        else{
            $('#passwordCheckMessage').html("");
            $("#join_btn").removeAttr("disabled");
        }
    }
	
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