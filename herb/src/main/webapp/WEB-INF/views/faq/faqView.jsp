<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/ckeditor/ckeditor.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<script>
// 목록 버튼
$(function() {
	$("btnList").click(function() {
		location.href = "faqList.do"
	});
});
// 수정 버튼
$(function() {
	$("btnUpdate").click(function() {
		// 첨부파일 이름들을 폼에 추가
		var str = "";
		$("#uploadedList.file").each(function(i) {
			str+="<input type='hidden' name='files["+i+"]' value='"
				+$(this).val()+"'>'";
		});
		$("#form1").append(str);
		document.form1.action="${path}/faqUpdate.do";
		document.form1.submit();
	});
});
//삭제 버튼
$(function(){$("#btnDelete").click(function(){
    if(confirm("삭제하시겠습니까?")){
        document.form1.action="${path}/board/delete.do";
        document.form1.submit();
        }
    });
});
listAttach();
</script>
<body>
<!-- 게시물을 작성하기 위해 컨트롤러의 insert.do로 맵핑 -->

</form>

</body>
</html>