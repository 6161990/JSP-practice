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
<!--  
		*
	   ***
	  *****
	 *******
	*********
	-->
	
	<!--5개의 반복적인일을 하는 outer for문을   -->
	<c:forEach var="i" begin="0" end="4">
	
			<!-- 공백을 출력하는 반복문을 작성 -->
			<c:forEach var="j" begin="${i+1}" end="4">
				&nbsp;
			</c:forEach>
			
			<c:forEach var="j" begin="1" end="${1+(i*2)}">
				*
			</c:forEach>
			</br>
	</c:forEach>
</body>
</html>