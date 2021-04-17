<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");	
	
		//취미 부분은 별도로 읽어들여 다시 빈클래스에 저장
		String[] hobby = request.getParameterValues("hobby");
		
		//배열에 있는 내용알을 하나의 스트링으로 저장
		String texthobby="";
		for(int i=0; i<hobby.length;i++){
			texthobby += hobby[i]+", ";
		}
	%>
	
	<!-- useBean을 이용하여 한꺼번에 데이터를 사용자로부터 받아온다. 그것을 db에 넣는다(맵핑) -->	
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"/> 
	</jsp:useBean>
	
	<%
		//기존 취미는 주소 번지가 저장되기에 배열의 태용을 하나의 스트링으로 저장한 변수를 다시 입력
		mbean.setHobby(texthobby); 
	
		//데이터 베이스 클래스 객체 생성
		MemberDAO mdao=new MemberDAO();
		mdao.insertMember(mbean);//데이터 베이스에 회원 정보 삽임
		
		
		//회원 가입이 되었다면 회원 정보를 보여주는 페이지로 이동시킴
		response.sendRedirect("MemberList.jsp");
		
	 %>
	 
	
	 
	 
</body>
</html>