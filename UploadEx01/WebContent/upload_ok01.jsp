<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	// 경로
	// C:/Java/jsp-workspace/UploadEx01/WebContent/upload
	// 제한용량(byte)
	// 인코딩
	
	String uploadPath = "C:/Java/jsp-workspace/UploadEx01/WebContent/upload";
	int maxFileSize = 1024 *1024 * 2; 
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy());

	out.println("업로드 완료");
%>