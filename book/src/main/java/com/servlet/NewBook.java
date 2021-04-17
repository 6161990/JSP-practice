package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/newBook")
public class NewBook extends HttpServlet {

       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String bookName = request.getParameter("book_name");
		String bookLoc = request.getParameter("book_loc");
		
		String driver ="oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String id = "daegu";
		String pw ="dkdlel";
		
		Connection con = null;
		Statement stmt =null;
		
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url,id,pw);
			stmt = con.createStatement();
			String sql ="INSERT INTO book(book_id, book_name, book_loc)";
					sql += "VALUES (BOOK_SEQ2.NEXTVAL, '"+bookName+ "', '"+ bookLoc+"')";
			int result = stmt.executeUpdate(sql);
			
			if(result == 1) {
				out.print("INSERT success!!");
			} else {
				out.print("INSERT fail!!");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt !=null) {stmt.close();}
				if(con != null) {con.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
