<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${num!=0}">
			<script>
				alert('리뷰가 등록 되었습니다.');
				location.href = 'productInfo.do?num=${num}';
			</script>
		</c:when>	
		<c:otherwise>
			<script>
				alert('리뷰 등록을 실패하였습니다.');
				location.href = 'product.do?num=${num}';
			</script>		
		</c:otherwise>
	</c:choose>
</body>
</html>