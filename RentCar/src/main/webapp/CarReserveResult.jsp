<%@page import="db.CarListBean"%>
<%@page import="db.RentCarDAO"%>
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
		
		//결과값으로 아무런 문제가 없다면 데이터 저장 후 결과 페이지 보여주기
		//아이디 값이 빈클래스에 없기에 
		String id1 = (String)session.getAttribute("id");
		rbean.setId(id1);
		
		//데이터 베이스에 빈클래스 저장
		RentCarDAO rdao  = new RentCarDAO();
		rdao.setReserveCar(rbean); 
		
		//차량 정보 얻어오기
		CarListBean cbean = rdao.getOneCar(rbean.getNo());
		
		//차량 총 금액
		int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
		//옵션금액
		int usein=0;
		if(rbean.getUsein()==1) {usein=10000;}
		int usewifi=0;
		if(rbean.getUsewifi()==1) {usewifi=10000;}
		int useseat=0;
		if(rbean.getUseseat()==1) {useseat=10000;}
		int totaloption= (rbean.getQty()*rbean.getDday())*(usein+usewifi+useseat);
	%>
	<center>
	<table width="1000">
			<tr height="100">
				<td align="center">
					<font size="6" color="gray"><b>Car Reserve Infomation</b></font>
				</td>
			</tr>
			
			<tr height="100">
				<td align="center">
					<img alt="" src="images/<%=cbean.getImg()%>"  width="470">
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="3" color="black"><b>Reserve</b>  <%=totalcar%>원 </font>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="3" color="black"><b>Option</b>  <%=totaloption %>원 </font>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="4" color="black"><b>Total</b> <%=totaloption+totalcar%>원 </font>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>