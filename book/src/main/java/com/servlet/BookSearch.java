package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.dao.BookDAO;
import com.servlet.dto.BookDTO;


@WebServlet("/bs")
public class BookSearch extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		
		/*String driver = "oracle.jdbc.driver.OracleDriver";
		String url ="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String id="daegu";
		String pw="dkdlel";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet res= null;
		
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			stmt = con.createStatement();
			String sql="SELECT * FROM book";
			res = stmt.executeQuery(sql);
			
			while(res.next()) {
				int bookId = res.getInt("book_id");
				String bookName = res.getString("book_name");
				String bookLoc = res.getString("book_loc");
				
				out.println("book ID : "+ bookId +", ");
				out.println("bookName : "+ bookName +", ");
				out.println("bookLoc  : "+ bookLoc +", ");
				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(res != null) res.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}*/
		BookDAO bookDAO = new BookDAO();
		ArrayList<BookDTO>list = bookDAO.select();
	
		for(int i=0; i<list.size(); i++) {
			BookDTO dto = list.get(i);
			int bookId = dto.getBookId();
			String bookName = dto.getBookName();
			String bookLoc = dto.getBookLoc();
			
			out.println("bookID : "+bookId+", ");
			out.println("bookName : "+bookName+", ");
			out.println("bookLoc : "+bookLoc+"<br>");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
