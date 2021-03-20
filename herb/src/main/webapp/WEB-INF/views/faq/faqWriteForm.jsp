<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ckeditor 사용을 위해 js파일을 연결함 -->
<script src = "${path}/ckeditor/ckeditor.js"></script>
</head>
<body>
<h2>글쓰기</h2>
<form method = "post" action = "faqInsert.do">
 
<div>제목 : <input name = "faqTitle" id = "faqTitle" size = "80" placeholder = "제목을 입력하세요"></div><br><br>
 
내용 : <div style = "width:800px; height:100px;"> <textarea id = "faqContent" name = ""faqContent" rows = "6" cols = "80" placeholder = "내용을 입력하세요"></textarea></div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
 
 
<div style = "width:700px; text-align:right;" ><button type = "submit" name = "submit">확인</button></div>
 
<script>
//id가 description인 태그에 ckeditor을 적용시킴
//이미지 업로드 안됨
CKEDITOR.replace("content");



</script>

</form>
</body>
</html>