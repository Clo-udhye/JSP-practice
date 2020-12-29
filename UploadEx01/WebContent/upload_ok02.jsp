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

	out.println("업로드 완료<br />");
	//DefaultFileRenamePolicy적용으로 변경된 파일명
	out.println("파일 이름 : " + multi.getFilesystemName("upload") + "<br />");
	//원래 파일명
	out.println("파일 이름 : " + multi.getOriginalFileName("upload") + "<br />");
	
	// 파일에 관련된 정보
	java.io.File file = multi.getFile("upload");
	out.println("file 용량 : " + file.length() + "<br />");
	
	// 다운로드 
	out.println("<a href=./upload/"+multi.getFilesystemName("upload")+">다운로드</a>");
	
	//이미지
	out.println("<img src=./upload/"+multi.getFilesystemName("upload")+"/>");
		
%>