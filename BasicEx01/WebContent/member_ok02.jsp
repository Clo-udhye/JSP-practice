<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% //MemberTO to = new MemberTO() %>
<jsp:useBean id="to" class="pack1.MemberTO" />

<%
	//to.setId("test");
	//to.setPassword("1234");
%>
<jsp:setProperty name="to" property="id" value="test" />
<jsp:setProperty name="to" property="password" value="1234" />

<%
	//out.println(to.getId()+"<br />");
	//out.println(to.getPassword()+"<br />");
%>
<jsp:getProperty name="to" property="id" /><br />
<jsp:getProperty name="to" property="password" /><br />