<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
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
	//카테고리 분류값을 받아옴
	int category = Integer.parseInt(request.getParameter("category"));

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
<table width="1000">
	<tr height="100">
			<td align="center" colspan="3">
			<font size="5" color="gray"><b>IT'S NEW, [<%=temp %>]</b></font></td></tr>
<%
	RentCarDAO rdao = new RentCarDAO(); 
	Vector<CarListBean> v = rdao.getCategoryCar(category); 
 	//tr를 세개씩 보여주고 다시 tr를 실행할 수 있도록 하는 변수 선언
 	int j=0;
 	for(int i=0; i<v.size(); i++){
 		//벡터에 저장되어있는 빈클래스를 추출
 		CarListBean bean = v.get(i);
 		if(j%3==0){
 %>
 	<tr height="220">
 			
	<% } %>
		<td width="333" align="center">
		<a href="RentCarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
		<img alt="" src="images/<%=bean.getImg() %>" width="300" height="200">
		</a><p>
		<font size="3" color="black"> <b><%=bean.getName() %></b></font><br>
		<font size="3" color="black"> <b>가격 : <%=bean.getPrice() %></b></font>
		</td>
		
<%
		j=j+1;//하나의 행에 총 3개의 차량정보를 보여주기 위해 증가값넣기
 	}
 	
%>


</table>
</center>
</body>
</html>