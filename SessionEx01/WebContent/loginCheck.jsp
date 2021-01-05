<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//id / password
	String save_id = "test";
	String save_password = "1234";
		
	int flag = 2;
	if(id.equals(save_id) && password.equals(save_password)){
		// 성공
		flag = 0;
		
		session.setAttribute("login_id", id);
		session.setAttribute("login_grade", "A");
		
	} else {
		// 실패
		flag = 1;
	}
	
	
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('로그인 되었습니다.');");
		out.println("location.href='loginComplete.jsp';");
	} else if(flag == 1){
		out.println("alert('아이디나 비밀번호가 틀렸습니다.');");
		out.println("history.back();");
	} else{
		out.println("alert('기타 에러.');");
		out.println("history.back();");
	}
	
	out.println("</script>'");
%>