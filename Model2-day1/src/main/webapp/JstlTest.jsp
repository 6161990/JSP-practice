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
	<%
		//int i = 4;
		//request.setAttribute("i",4); == <c:set var="i" value="4" />
	%>
	
	<!--변수 선언  -->
	<c:set var="i" value="4" />
	
	<!-- if문 사용법  -->
	<c:if test="${4 < 3}"><!--변수를 다이렉트로 가져와 사용을 할수 없다  -->
		안녕하세요
	</c:if>
	
	
	<!-- 반복문 for -->
	<c:forEach var="k" begin="1"  end ="10" step="${k=k+1}">
	 	점심시간 입니다. ${k}<br>
	</c:forEach>
	
	<c:forEach  begin="1"  end ="10">
	 	점심시간 입니다.1<br>
	</c:forEach>
	
	
	<c:forEach var = "i" begin="1"  end ="10">
	 	<c:set var="sum" value="${sum=sum+i}" />
	</c:forEach>
	
	${sum}
	
	
	<c:forEach var = "j" begin="1"  end ="10" step="${j=j+2}" >
	 	<c:set var="sum1" value="${sum1=sum1+j}" /> 
	</c:forEach>
	
	${sum1}
	
</body>
</html>