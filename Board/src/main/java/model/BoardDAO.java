package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con; //데이터베이스에 접근할수 있도록 설정 
	PreparedStatement pstmt; //데이터 베이스에서 쿼리를 실행시켜주는 객체 
	ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
	
	//데이터 베이스의 커넥션 풀을 사용하도록 설정하는 메소드
	public void getCon() {
		
		try {
			//외부에서 데이터를 읽어들이기
			Context initctx = new InitialContext();
			
			
			//톰캣 서버에 정보를 담아놓은 곳으로 이동
			Context envctx = (Context) initctx.lookup("java:comp/env");
			
			//데이터 소스 객체를 선언
			DataSource ds = (DataSource) envctx.lookup("jdbc/Oracle11g");
			
			//데이터 소스를 기준으로 커넥션 연결
			con = ds.getConnection();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean) {
		getCon();
		//빈클래스에 넘어오지 않은 컬럼들을 초기화 해주어야함.
		int ref=0;//글 그룹을 의미 = 쿼리를 실행시켜서 가장 큰 ref 값을 가져온 후 +1
		int re_step=1; //새 글이기에 (부모글)
		int re_level=1;
		
		try {
			//가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql="select max(ref) from board";
			//쿼리 실행객체
			pstmt=con.prepareStatement(refsql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()) { // 쿼리 결과 값이 있다면
				ref= rs.getInt(1)+1; //최대 값에 1을 더해 글 그룹을 설정
			}
			//실제로 게시글 전체값을 테이블에 저장
			String sql="insert into board values (board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt=con.prepareStatement(sql);
			
			//?에 값을 맵핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			
			//쿼리를 실행하시오
			pstmt.executeUpdate();	
			
			//자원 반납
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	

}
