package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginProc
 */
@WebServlet("/LoginProc.do") //어노테이션가능
public class LoginProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}

	public void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		
		//request 객체에 데이터를 저장 
		request.setAttribute("id", id);  
		request.setAttribute("pass", pass);
		
		
		//JSP로 객체를 떠넘길 수 있는 객체 
		RequestDispatcher dis = request.getRequestDispatcher("LoginProc.jsp");
		dis.forward(request, response);
	}
}
