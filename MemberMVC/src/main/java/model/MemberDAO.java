package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/Oracle11g");
			con=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//회원 한 사람에 대한 정보를 저장하는 메소드
	public void insertMember(MemberBean bean) {
		getCon();
		
		try {
			//쿼리 준비
			String sql ="insert into member values(?,?,?,?,?,?,?,?)";
			//쿼리 실행 객체 선언
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass1());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getHobby());
			pstmt.setString(6, bean.getJob());
			pstmt.setString(7, bean.getAge());
			pstmt.setString(8, bean.getInfo());
			
			//쿼리 실행
			pstmt.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
	}
	
}
