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
</head>
<body>
<!-- 구구단 출력 -->
<%
	String html = "<table>";
	for(int row=0; row<=9; row++){	
		html += "<tr>";
		for(int col=0; col<=9; col++){
			if(row==0 && col==0){
				html += "<td></td>";
			} else if(row==0){
				html += "<td>" + col + "단</td>";
			} else if(col==0){
				html += "<td>X" + row + "</td>";
			} else {
				html += "<td>" + row + " X " + col + " = " + (row*col) + "</td>";	
			}
		}
		html += "</tr>";
	}
	html += "</table>";
	
	out.println(html);
%>
</body>
</html>