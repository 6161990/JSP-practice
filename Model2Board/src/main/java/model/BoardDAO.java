package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	//데이터 베이스에 연결 메소드
	public void getCon() {
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/Oracle11g");
			con=ds.getConnection();//커넥션 연결 해주는 메소드 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//전체 게시글의 갯수를 리턴하는 메소드
	public int getAllCount() {
		
		int count=0; //전체 게시글의 갯수
		
		getCon();
		
		try {
			//쿼리준비
			String sql="select count(*) from board";
			pstmt=con.prepareStatement(sql);
			
			//쿼리 실행후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()) {//데이터가 있다면
				count=rs.getInt(1);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//화면에 보여질 데이터를 10개씩 추출해서 리턴하는 메소드
	public Vector<BoardBean> getAllBoard(int startRow, int endRow){
		Vector<BoardBean> v = new Vector<>();
		getCon();
		
		try {
			//쿼리 작성
			String sql ="select * from (select A.*, Rownum Rnum from(select * from board order by ref desc, re_step asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
			pstmt =con.prepareStatement(sql);
			//?값을 대입
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs=pstmt.executeQuery();
			while(rs.next()) {
				//데이터를 패키징(가방 = Boardbean 클래스를 이용)해줌
				 BoardBean bean = new BoardBean();
				 bean.setNum(rs.getInt(1));
				 bean.setWriter(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setSubject(rs.getString(4));
				 bean.setPassword(rs.getString(5));
				 bean.setReg_date(rs.getDate(6).toString());
				 bean.setRef(rs.getInt(7));
				 bean.setRe_step(rs.getInt(8));
				 bean.setRe_level(rs.getInt(9));
				 bean.setReadcount(rs.getInt(10));
				 bean.setContent(rs.getString(11));
				 
				 //패키징한 데이터를 벡터에 저장 
				 v.add(bean);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}	
}
