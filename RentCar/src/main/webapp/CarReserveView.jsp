<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id= (String)session.getAttribute("id");
	
	if(id==null){
%>
	<script>
		alert("로그인을 먼저 해주세요");
		location.href='RentCarMain.jsp?center=MemberLogin.jsp';
	</script>	
<%		
	}
	//로그인 되어 있는 아이디 읽어오기
	RentCarDAO rdao = new RentCarDAO();
	Vector<CarViewBean> v = rdao.getAllReserve(id);
	 
%>
</body>
</html>