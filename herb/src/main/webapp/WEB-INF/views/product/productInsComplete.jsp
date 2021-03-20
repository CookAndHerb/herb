<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어른허브</title>
</head>
<body>
	<c:choose>
		<c:when test="${result==1}">
			<script>
				alert('상품 등록 완료');
				location.href = 'adminProduct.do';
			</script>
		</c:when>	
		<c:otherwise>
			<script>
				alert('상품 등록 실패');
				location.href = 'productIns.do';
			</script>		
		</c:otherwise>
	</c:choose>
</body>
</html>