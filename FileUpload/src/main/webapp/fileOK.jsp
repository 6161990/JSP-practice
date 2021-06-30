<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.FileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	// 업로드 폴더가 없으면 폴더 생성
	String saveDir = pageContext.getServletContext().getRealPath("/upload");
	System.out.print(saveDir);
	
	File sDir = new File(saveDir);
	
	if(!sDir.exists())
		sDir.mkdirs();
	
	//파일 크기 설정
	int maxPostSize = 1024 * 1024 * 3; //3MB 
	
	//인코딩방식
	String encoding ="UTF-8";
	
	//파일 정책, 파일명 중복시 파일명뒤에 인덱스값 붙이기
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest mreq = new MultipartRequest(request //MultipartRequest를 생성하기 위한 request
			, saveDir //저장위치
			,maxPostSize // 저장될 파일 최대 크기
			,encoding // 인코딩 
			,policy); //파일정책
	
	String name = mreq.getParameter("name");
	File uploadFile = mreq.getFile("upload");
	long uploadFile_length = uploadFile.length();
	String orgFileName = mreq.getOriginalFileName("upload");
	String fileSysName = mreq.getFilesystemName("upload");
	
	if(orgFileName != null){
%>		
	이름 : <%=name %> <br>
	경로 : <%=saveDir %> <br>
	파일명 : <%=uploadFile.getName() %> <br>
	Original File : <%=orgFileName %> <br>
	FileSystem file:<%=fileSysName %><br>
	파일 크기 : <%=uploadFile_length %>
<% 
	}else{
		System.out.println("파일업로드 실패");
	}
%>			
