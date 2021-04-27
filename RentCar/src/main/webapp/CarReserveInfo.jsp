<%@page import="db.CarListBean"%>
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
 	int no = Integer.parseInt(request.getParameter("no"));

	//데이터베이스에 접근
	RentCarDAO rdao = new RentCarDAO();
	
	//렌트카 하나에 대한 정보를 얻어옴
	CarListBean bean = rdao.getOneCar(no); 


	int category = bean.getCategory();
	String temp="";
	if(category==1){
		temp="소형";
	}else if(category==2){
		temp="중형";
	}else if(category==3){
		temp="대형";
	}
%>

<center>
<form action="RentCarMain.jsp?center=CarOptionSelect.jsp" method="post">
<table width="1000">
	<tr height="100">
		<td align="center" colspan="3">
		<font size="5" color="gray"> <%=bean.getName() %></font></td>
		</tr>
		
		<tr>
			<td rowspan="6" width="500" align="center">
			<img alt="" src="images/<%=bean.getImg() %>" width="450"></td>
			<td width="250" align="center"> 차량이름 </td>
			<td width="250" align="center"> <%=bean.getName() %></td>
		</tr>
		<tr>
			<td width="250" align="center"> 차량수량</td>
			<td width="250" align="center"> <select name="qty">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
		</td> </tr>	 
		<tr>
			<td width="250" align="center"> 차량분류</td>
			<td width="250" align="center"> <%=temp %></td>
		</tr>
			<tr>
			<td width="250" align="center"> 대여가격</td>
			<td width="250" align="center"> <%=bean.getPrice() %>원</td>
		</tr>
		<tr>
			<td width="250" align="center"> 제조회사</td>
			<td width="250" align="center"> <%=bean.getCompany() %></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			<input type="hidden" name="no" value="<%=bean.getNo() %>">
			<input type="hidden" name="img" value="<%=bean.getImg() %>">
			<input type="submit" value="옵션선택 후 구매하기">
		</td>
		</tr>
</table>
	<br><br><br>
	<font size="5" color="gray">차량 정보 보기</font>
	<p>
	<%=bean.getInfo() %>
</form>
</center>
</body>
</html>