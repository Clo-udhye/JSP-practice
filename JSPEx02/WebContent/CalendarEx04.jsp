<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	width: 900px;
}

table, td {
	border: 1px solid black;
}
</style>
<script type="text/javascript">	
	const printCalendar = function() {
		const stryear = document.frm.year.value;
		const strmonth = document.frm.month.value;
		
		const year = parseInt(stryear);
		const month = parseInt(strmonth);
		
		let result = "";

		const sDay = new Date(year, month - 1, 1);
		const eDay = new Date(year, month, 1 - 1);

		const START_DAY_OF_WEEK = sDay.getDay();
		const END_DAY_OF_WEEK = eDay.getDay();
		const END_DAY = eDay.getDate(); //요일 데이터 (일 : 0 ~ )

		result += "<table width='800' border='1'>";
		result += "<tr>";
		result += "<td colspan='7'>" + year + "년 " + month + "월</td>";
		result += "</tr>";

		result += "<tr>";
		result += "<td>SU</td><td>MO</td><td>TU</td><td>WE</td><td>TH</td><td>FR</td><td>SA</td>";
		result += "</tr>";

		result += "<tr>";
		for (let i = 0; i < START_DAY_OF_WEEK; i++) {
			result += "<td></td>";	// 첫주 공백
		}
		for (let i = 1, n = START_DAY_OF_WEEK; i <= END_DAY; i++, n++) {
			if (n % 7 == 0){ 	//일요일 일때 행시작 
				result += "<tr>";
			}
			result += "<td>" + i + "</td>"; //1~31(30)일까지 숫자 출력
			if (n % 7 == 6){	// 토요일 일때 행끝
				result += "</tr>";
			}
		}

		for (let i = END_DAY_OF_WEEK; i < 6; i++) {
			result += "<td></td>";	// 마지막주 공백
		}

		result += "</tr>";
		result += "</table>";

		let div = document.getElementById("printHere");
        div.innerHTML = result;
	};
	
</script>
</head>
<body>

	<form name="frm">
		<select name="year">
			<option value="2019">2019</option>
			<option value="2020" selected="selected">2020</option>
			<option value="2021">2021</option>
		</select>년도 
		<select name="month">
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
		
		<!-- <input type="submit" value="달력"> -->
		<input type="button" value="달력보기" onclick="printCalendar()" />
		

	</form>
	<br /><hr /><br />
	
	<div id="printHere"></div>
</body>
</html>