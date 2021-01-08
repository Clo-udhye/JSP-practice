<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<s:setDataSource 
	var="ds" 
	url="jdbc:mysql://localhost:3306/sample" 
	driver="org.mariadb.jdbc.Driver"
	user="root"
	password="!123456"
	scope="page" />
	
 
<%-- <s:query var="rs" dataSource="${ ds }" sql="select * from dept2"></s:query> --%>
<s:query var="rs" dataSource="${ ds }"> 
 select deptno as no, dname as name, loc as loctaion from dept2
</s:query>
<c:forEach var="columnName" items="${ rs.columnNames }">
 	${ columnName }<br />
</c:forEach>
 
<hr />
 
<c:forEach var="data" items="${ rs.rows }">
 	${ data["deptno"] } / ${ data["dname"] } / ${ data["loc"] }<br />
</c:forEach>
 
 