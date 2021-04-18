<%@page import="model.MemberDAO"%>
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
		<jsp:useBean id="mbean" class="model.MemberBean">
			<jsp:setProperty name="mbean" property = "*" />
		</jsp:useBean>


	<% 
	
		MemberDAO mbao = new MemberDAO();
		
		//스트링 타입으로 저장 되어 있는 패스워드를 가져옴(데이터 베이스에서 가져온 pass 값이 저장) 
		String pass = mbao.getPass1(mbean.getId());
		
		//수정 하기 위해서 작성한 패스워드 값과 기존 데이터 베이스에서 가져온 패스워드 값을 비교
		if(mbean.getPass1().equals(pass)){//기존 패스와 데이터 패스와 같다면 member테이블을 수정
			//MemberDao클래스의 회원 수정 매소드를 호출
			mbao.updateMember(mbean);
			response.sendRedirect("MemberList.jsp");
		}else{
	%>
		<script type="text/javascript">
			alert("패스워드가 맞지 않습니다. 다시 확인해 주세요");
			history.go(-1);
		</script>
	<% 		
		}
	%>
</body>
</html>