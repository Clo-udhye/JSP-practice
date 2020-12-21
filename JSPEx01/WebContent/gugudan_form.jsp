<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- gugudan_form .jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan_form.jsp</title>
<script type="text/javascript">
	const checkfrm = function(){
		const startdan = parseInt(document.frm.startdan.value.trim());
		const enddan = parseInt(document.frm.enddan.value.trim());
		
		if(startdan>enddan){
			alert('끝단이 커야합니다.');

		} else {
			document.frm.submit();	
		}
	}
</script>
</head>
<body>

<form action="gugudan_ok.jsp" method="post" name="frm">
시작단 <input type="text" name="startdan"/>
&nbsp;~&nbsp;
끝단 <input type="text" name="enddan"/>
<input type="button" value="구구단" onclick="checkfrm()" />


</form>
</body>
</html>