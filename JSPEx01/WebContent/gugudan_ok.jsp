<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- gugudan_ok.jsp -->

<% 
	request.setCharacterEncoding("utf-8");
	String startDan = request.getParameter("startdan");
	String endDan = request.getParameter("enddan");
	
	int sDan = Integer.parseInt(startDan);
	int eDan = Integer.parseInt(endDan);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan_ok.jsp</title>
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
<%
	
	String html = "<table>";
	for(int row=sDan-1; row<=eDan; row++){	
		html += "<tr>";
		for(int col=0; col<=9; col++){
			if(row==sDan-1 && col==0){
				html += "<td></td>";
			} else if(row==sDan-1){
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