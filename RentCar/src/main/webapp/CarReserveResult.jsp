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
		request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id ="rbean" class="db.CarReserveBean">
		<jsp:setProperty name ="rbean" property="*" />
	</jsp:useBean>
	
	<%
		String id=(String)session.getAttribute("id");
		if(id==null){
	%>
		<script>
			alert("로그인 후 예약이 가능합니다.");
			location.href="RentCarMain.jsp?center=MemberLogin.jsp";
		</script>
	<%
		}	
	%>
</body>
</html>