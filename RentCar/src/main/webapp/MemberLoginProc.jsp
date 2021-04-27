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
		request.setCharacterEncoding("UTF-8");
	
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		//회원 아이디와 패스워드가 일치하는지 비교
		RentCarDAO rdao = new RentCarDAO(); 
		
		//해당 회원이 있는지 여부를 숫자로 표현
		int result = rdao.getMember(id,pass); 
		
		if(id==null){
			%>
				<script>
					alert("아이디 또는 비밀번호가 맞지 않습니다.");
					location.href="RentCarMain.jsp?center=MemberLogin.jsp";
				</script>
			<%
		}else{
			//로그인 처리가 되었다면
			session.setAttribute("id", id);
			response.sendRedirect("RentCarMain.jsp");
		}
		
	%> 
</body>
</html>