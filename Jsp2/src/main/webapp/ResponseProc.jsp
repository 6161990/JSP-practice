<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이 페이지는 로그인 정보가 넘어오는 페이지 입니다.</h2>
	<%
		request.setCharacterEncoding("UTF-8"); //post방식 한글처리
		
		String id = request.getParameter("id"); //request객체에 담겨진 사용자 정보중 id추출
		
		//정보를 넘기는 방법 1 : session
		//방법 2: response.sendRedirect
		//response.sendRedirect("ResponseRedirect.jsp"); //흐름제어,  즉시 명시한 페이지로 넘어감. 그 페이지에서는 request(id)객체가 넘어오지 않음
		//response.sendRedirect("ResponseRedirect.jsp?id="+id);//이렇게 직접 넣어주면 가능, but 다음 페이지갈 때 계속 그렇게 넘겨줘야함
	%>
	<!-- but, forward는 request객체가 같이 넘어감, 현재 페이지가 ResponseRedirect.jsp에 같이 넘어감 --> 
		<jsp:forward page="ResponseRedirect.jsp">  
			<jsp:param value="mmmm" name="id"/>
			<jsp:param value="1234" name="phone"/>	  
		</jsp:forward>
		<!-- jsp:param 이건 제어, id를 mmmm으로 finaltic하게, 실제입력한 id가 뭐든, mmmm나옴. -->
        <!-- 넘어간 페이지에서 사용하고 싶은 값 미리 넣어도 그곳에서 살아있음 -->
		
		
		<!-- 방법 2의 경우, 볼 수 없는 부분 -->
		<h3> 아이디는: <%=id %></h3> 
</body>
</html>