<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>    

<s:setDataSource 
	var="ds" 
	url="jdbc:mysql://localhost:3306/sample" 
	driver="org.mariadb.jdbc.Driver"
	user="root"
	password="!123456"
	scope="page" />
	
<%-- <s:update dataSource="${ds}" sql="insert into dept2 values (93, '생산', '부산')" /> --%>

<%--
<s:update dataSource="${ds}" sql="insert into dept2 values (?, ?, ?)">
	<s:param value="97" />
	<s:param value="조사" />
	<s:param value="대구" />
</s:update>
 --%>
 
<s:update dataSource="${ds}">
	insert into dept2 values (?, ?, ?)
	<s:param value="98" />
	<s:param value="생산" />
	<s:param value="부산" />
</s:update>
 