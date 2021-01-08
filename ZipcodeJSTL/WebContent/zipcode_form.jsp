<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	const checkfrm = function() {
		if( document.frm.dong.value.trim() == '' ) {
			alert( '동이름을 입력해 주세요' );
			return;
		}
		document.frm.submit();
	};
</script>
</head>
<body>

<form action="./zipcode_ok.jsp" method="post" name="frm">
<input type="hidden" name="action" value="zipcode_ok">
동이름 <input type="text" name="dong" />
<input type="button" value="동이름 검색" onclick="checkfrm()" />
</form>

</body>
</html>