<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. 데이터 베이스에서 모든 회원의 정보를 가져옴  2.table 태크를 이용하여 화면에 회원들의 정보를 출력 -->	
	<%--
	<% 
		MemberBeanDAO mbao = new MemberBeanDAO();
		mbao.allSelectMember();
		//회원들의 정보가 얼마나 저장 되어있는지 모르기에 가변길이인 Vector를 이용하여 데이터를 저장해줌
		//폴리 모피즘 다형성 트리 구조 하위구조 부모 자식 관계 
	    Vector<MemberBean> vec = mbao.allSelectMember(); 
	    
	    el이 일반변수를 뿌리지 못하므로, setAttribute로 객체 뿌려주기
		++++++request.setAttribute("vec",vec);++++++


	<center>
	<h2> 모든 회원 보기 </h2>
	
		<table width ="800" border="1">
			<tr height="50">
				<td align = "center" width = "150">아이디 </td>
				<td align = "center" width = "250">이메일 </td>
				<td align = "center" width = "200">전화번호 </td>
				<td align = "center" width = "200">취미 </td>
			</tr>
			<% 
				for(int i = 0 ; i<vec.size();i++){
				MemberBean bean = vec.get(i);//백터에 담긴 빈 클래스를 하나씩 추출
			%>
			<tr height="50">
				<td align = "center" width = "150">
					<a href = "MemberInfo.jsp?id=<%=bean.getId()%>">
						<%=bean.getId()%></a>
					</td>
				<td align = "center" width = "250"><%=bean.getEmail()%></td>
				<td align = "center" width = "200"><%=bean.getTel()%></td>
				<td align = "center" width = "200"><%=bean.getHobby()%></td>
			</tr>
			<% 
			}
			%>
		--%>
		
		<table width ="800" border="1">
			<tr height="50">
				<td align = "center" width = "150">아이디 </td>
				<td align = "center" width = "250">이메일 </td>
				<td align = "center" width = "200">전화번호 </td>
				<td align = "center" width = "200">취미 </td>
			</tr>
			<c:forEach var="bean" items="${vec}">
				<tr height="50">
				<td align = "center" width = "150">
					<a href = "MemberInfo.jsp?id=${bean.id}"> ${bean.id} </a>
					</td>
				<td align = "center" width = "250">${bean.email}</td>
				<td align = "center" width = "200">${bean.tel}</td>
				<td align = "center" width = "200">${bean.hobby}</td>
			</tr>
			</c:forEach>
</body>
</html>