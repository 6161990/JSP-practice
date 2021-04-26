<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  세션을 이용한 로그인 처리 -->
<%
	String id= (String)session.getAttribute("id");
	
	//로그인이 되어있지 않다면 구매때문에 로그인 처리되도록
	if(id==null){
		id="GUEST";
	}
%>

	<table width="1000" bordercolor="white">
		<tr height ="70">
			<td colspan=4">
				<a href="RentCarMain.jsp" style="text-decoration:none">
				<img alt="" src="images/RENT.png" height="65"></a>
			</td>
			<td align="center" width="200">
				<%=id %>님 반갑습니다.
			</td>	
		</tr>	
		<tr height ="50">
			<td align="center" width="200" bgcolor="#CFD8DC">
				<font color="black" size="4" ><a href="RentCarMain.jsp?center=CarReserveMain.jsp" style="text-decoration:none">예약하기</a></font>
			</td>	
			<td align="center" width="200" bgcolor="#CFD8DC">
				<font color=black size="4" ><a href="#" style="text-decoration:none">예약확인</a></font>
			</td>	
			<td align="center" width="200" bgcolor="#CFD8DC">
				<font color="black" size="4" ><a href="#" style="text-decoration:none">자유게시판</a></font>
			</td>	
			<td align="center" width="200" bgcolor="#CFD8DC">
				<font color="black" size="4" ><a href="#" style="text-decoration:none">이벤트</a></font>
			</td>	
			<td align="center" width="200" bgcolor="#CFD8DC">
				<font color="black" size="4" ><a href="#" style="text-decoration:none">고객센터</a></font>
			</td>	
		</tr>	
		
	</table>


</body>
</html>