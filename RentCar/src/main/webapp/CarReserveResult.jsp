<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		
		//날짜비교
		Date d1 = new Date();
		Date d2 = new Date();
		
		//날짜를 2015-2-2 형식으로 포맷해주는 클래스 선언
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		
		d1 = sdf.parse(rbean.getRday());
		d2 = sdf.parse(sdf.format(d2));
		//날짜 비교 메소드를 사용
		int compare = d1.compareTo(d2);
		//예약하려는 날짜보다 현재날짜가 크다면 -1
		//예약하려는 날짜와 현재날짜가 같다면0
		//예약하려는 날짜가 더 크다면 1을 리턴
		if(compare <0){ //오늘 기준 , 이전 날짜 선택시 예약불가
	%>
			<script>
				alert("예약 불가능한 날짜입니다. 오늘 이후 날짜로 선택해주십시오.");
				history.go(-1);
			</script>
	<%
		}
		
	%>
</body>
</html>