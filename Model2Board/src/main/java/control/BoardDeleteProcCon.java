package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;


@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		request.setCharacterEncoding("UTF-8");
		
		//사용자로 부터 넘어온 데이터 3개를 받아줍니다
		int num = Integer.parseInt(request.getParameter("num"));
		String password =  request.getParameter("password");
		String pass =  request.getParameter("pass");
		
		//기존 패스워드 값과 delete form에서 작성한 패스워드를 비교 
		if(pass.equals(password)){
			BoardDAO bdao = new BoardDAO();
			//패스워드가 둘다 같다면 
			bdao.deleteBoard(num);
			
			//수정이 완료 되었다면 전체 게시글 보기로 이동 
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request ,response);
		}else{
			//비밀번호가 틀렸다면 이전 페이지로 이동
			request.setAttribute("msg","2");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request ,response);
		}	
	}

}
