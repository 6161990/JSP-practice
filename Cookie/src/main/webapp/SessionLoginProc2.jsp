<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>

	<center>
	<h2> 세션 로그인 처리 2 </h2>
	
	<% 
		request.setCharacterEncoding("UTF-8");
		
		//String id= request.getParameter("id");	
		//String pass = request.getParameter("pass");
		
		//세션을 이용하여 데이터를 불러옴
		String id   = (String)session.getAttribute("id");	
		String pass = (String)session.getAttribute("pass");
	%>
	
	
	<h2>당신의 아이디는 <%=id%> 입니다. 패스 워드는<%=pass%>입니다 </h2>
</center>
	

</center>

</body>
</html>