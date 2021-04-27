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
	<center> 
		<!-- 데이터베이스에 연결하여 최신순 자동차 3대 showing 하는 데이터를 가져오기 -->
		<%
			RentCarDAO rdao=new RentCarDAO();
			//벡터를 이용하여 자동차를 저장
			Vector<CarListBean> v = rdao.getSelectCar();  
		%>
		
		<table width="1000" >
			<tr height="100">
			<td align="center" colspan="3">
			<font size="5" color="gray"><b>IT'S NEW</b></font></td></tr>
		
			<tr height="240">
			<% for(int i=0; i< v.size(); i++){
				CarListBean bean = v.get(i);
			%>
				<td width="333" align="center">
				<a href="RentCarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo() %>"> 
				<img alt="" src="images/<%=bean.getImg() %>" width="300" height="220">
				</a><p>
				차랑명 : <%=bean.getName() %>
				</td>
			<%
			}    
			%> 
		</table>

			<p>
				<font size="4" color="black"><b>차량 검색 하기</b></font><br><br><br>
				<form action="RentCarMain.jsp?center=CarCategoryList.jsp" method="post">
				<font size="3" color="black"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
				<select name="category">
					<option value="1"> 소형</option>
					<option value="2"> 중형</option>
					<option value="3"> 대형 </option>
				</select>&nbsp;&nbsp;
				<input type="submit" value="검색"> &nbsp;&nbsp;
				</form>
				<button onclick="location.href='RentCarMain.jsp?center=CarAllList.jsp'">전체검색</button>
				

	</center>
</body>
</html>