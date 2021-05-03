package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberDAO;


@WebServlet("/Proc.do")
public class MemberJoinProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		MemberBean bean = new MemberBean();
		bean.setId(request.getParameter("id"));

		//패스워드 확인을 위해 받아오기
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		bean.setPass1(pass1);
		bean.setPass2(pass2);
		
		bean.setEmail(request.getParameter("email"));
		bean.setTel(request.getParameter("tel"));
		String [] arr = request.getParameterValues("hobby");
		String data="";
		for(String string : arr) {
			data += string+" "; //하나의 스트링으로 데이터 연결
		}
		bean.setHobby(data);
		bean.setJob(request.getParameter("job"));
		bean.setAge(request.getParameter("age"));
		bean.setInfo(request.getParameter("info"));
		
		//패스워드가 같은 경우에만 데이터 베이스에 저장
		if(pass1.equals(pass2)) {
			//데이터 베이스 객체 생성
			MemberDAO mdao = new MemberDAO();
			mdao.insertMember(bean);
			
			//컨트롤러에서 또 다른 컨트롤러 호출하기
			RequestDispatcher dis = request.getRequestDispatcher("MemberListCon.do");
			dis.forward(request, response);
		}else {
			request.setAttribute("msg", "패스워드가 일치하지 않습니다"); //jsp가 아니므로 request객체를 jsp쪽으로 넘겨주어야함
			RequestDispatcher dis = request.getRequestDispatcher("LoginError.jsp");
			dis.forward(request, response);
		}
		//데이터 베이스 객체 선언한 후 저장
	}
	
	
}
