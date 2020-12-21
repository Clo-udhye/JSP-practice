<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	const checkfrm = function(){
		const year = document.frm.year.value;
		const month = document.frm.month.value;
		
		alert(year + ' ' + month);
		
	}
</script>
</head>
<body>

	<form action="Calendar_ok.jsp" method="post" name="frm">
	<select name ="year">
		<option value="2019">2019</option>
		<option value="2020" selected="selected">2020</option>
		<option value="2021">2021</option>
	</select>년도
	
	<select name ="month">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
	</select>월
	
	<!-- <input type="button" value="달력" onclick="" / > -->
	<input type="submit" value="달력보기">	
	</form>
</body>
</html>