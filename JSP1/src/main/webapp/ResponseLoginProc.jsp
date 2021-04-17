<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 이건 화면에 나오지 않음 왜? 위부터 아래로 코드를 읽는데 ,
	읽은 것을 버퍼에서 처리하다가 아이디 패스워드 일치하면 다른 페이지로 넘어가버리기 때문에
	'로그인 처리 페이지'는 화면에 출력되지 않음 -->
	<h2>로그인 처리 페이지</h2>

<%

	request.setCharacterEncoding("EUC-KR");

	//임의적으로 id와 pass를 설정해 DB대체.
	String dbid = "aaaa";
	String dbpass = "1234";
	
	//사용자로부터 넘어온 데이터를 입력받아줌
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(dbid.equals(id) && dbpass.equals(pass)){
		//아이디와 패스워드가 일치하니깐 메인 페이지를 보여주어야함
		response.sendRedirect("ResponseMain.jsp?id="+id);
	}else{
%>
	<script>
		alert("아이디와 패스워드가 일치하지않습니다.");
		history.go(-1);
	</script>

<%
	}
%>

</body>
</html>