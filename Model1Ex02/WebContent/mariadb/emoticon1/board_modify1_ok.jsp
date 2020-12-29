<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.BoardTO" %>
<%@ page import="model1.BoardDAO" %>

<%
	request.setCharacterEncoding("utf-8");

	String seq = request.getParameter("seq");
	
	BoardTO to = new BoardTO();
	to.setSeq(seq);
	to.setPassword(request.getParameter("password"));
	
	to.setSubject(request.getParameter("subject"));
	to.setContent(request.getParameter("content"));
	to.setEmot(request.getParameter("emot").replaceAll("emot", ""));
	to.setMail("");
	if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
		to.setMail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));
	}
	
	BoardDAO dao = new BoardDAO();
	int flag = dao.boardModifyOk(to);
	
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('글수정에 성공했습니다.');");
		out.println("location.href='board_modify1.jsp?seq=" + seq +"';");
	} else if(flag == 1){
		out.println("alert('비밀번호가 잘못되었습니다.');");
		out.println("history.back();");
	} else {
		out.println("alert('글수정에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>