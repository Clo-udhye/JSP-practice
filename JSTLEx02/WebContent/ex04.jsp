<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<%-- startRow="2" max=Rows="4" => limit 2, 4 --%>	
<s:query var="rs" dataSource="jdbc/mariadb1" startRow="2" maxRows="4"> 
	select deptno as no, dname as name, loc as loctaion from dept2
</s:query>

<s:query var="rs" dataSource="jdbc/mariadb1"> 
	select deptno as no, dname as name, loc as loctaion from dept2 where deptno=?
	<s:param value="97" />
</s:query>
	
<c:forEach var="data" items="${ rs.rows }">
 	${ data["deptno"] } / ${ data["dname"] } / ${ data["loc"] }<br />
 </c:forEach>	
	
