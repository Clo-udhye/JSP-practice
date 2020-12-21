<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	const checkfrm1 = function(){
		//alert('click');
		const data1 = document.frm.data1.value.trim();
		const data2 = document.frm.data2.value.trim();
		
		// 값을 검사..
		//alert(data1 + '/' + data2);
		
		document.frm.submit();
	}
	
	const checkfrm2 = function(){
		//alert('click');
		const data1 = document.frm.data1.value.trim();
		const data2 = document.frm.data2.value.trim();
		
		// 입력값 검사..
		alert(data1 + '/' + data2);
		
		if(data1 == ''){
			alert('데이터 1 입력');
			return false;	// return false이면 submit취소 
		}
	}
	
</script>
</head>
<body>
<!-- form.jsp -->

<!-- post 방식 -->
<!--<form action="form_ok.jsp" method="post" name="frm">-->
<form action="form_ok.jsp" method="post" name="frm" onsubmit="return checkfrm2()">	<!--submit이용시 입력값검사 부분을 실행하고싶을때-->
data1 <input type="text" name="data1" /><br />
data2 <input type="text" name="data2" /><br />
<input type="submit" value="전송" onclick="chckfrm2()"/>
<!--<input type="button" value="전송" onclick="checkfrm1()"/>-->
</form>

</body>
</html>