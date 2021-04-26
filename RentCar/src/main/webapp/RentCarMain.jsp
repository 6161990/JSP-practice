<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
<%
	String center=request.getParameter("center");

	//처음 실행시에는 center 값이 넘어오지 않으므로
	if(center==null){
		center="Center.jsp";  //디폴트  center값을 부여
	}
%>

	<table width="1000">
	<!-- top 부분 -->
	<tr height="140" align="center">
		<td align="center" width="1000"> <jsp:include page="Top.jsp" /></td>
	</tr>
	</table>
	
	<!-- Center 부분 -->
	<tr height="470" align="center">
		<td  align="center" width="1000"> <jsp:include page="<%=center %>" /></td>
	</tr>
	</table>
	
	<!-- Bottom 부분 -->
	<tr height="100" align="center">
		<td align="center" width="1000"> <jsp:include page="Bottom.jsp" /></td>
	</tr>
	</table>

</center>
</body>
</html>