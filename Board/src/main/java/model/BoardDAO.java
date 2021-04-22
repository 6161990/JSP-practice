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
	
	//모든 게시물을 리턴해주는 메소드 작성
	public Vector<BoardBean> getAllBoard(){
		
		//리턴할 객체 선언
		Vector<BoardBean> v = new Vector<>();
		getCon();
		
		try {
			//쿼리 준비
			String sql ="select * from board order by ref desc, re_step asc";
			
			//쿼리를 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			
			//쿼리 실행후 결과 저장
			rs = pstmt.executeQuery();
			
			//데이터 개수가 몇 개인지 모르기에 반복문을 이용하여 데이터를 추출
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
	
	
	//하나의 게시글을 레턴하는 메소드
	public BoardBean getOneBoard(int num) {
		
			//리턴타입 선언
			BoardBean bean = new BoardBean();
			getCon();
			
		try {
			//조회수 증가쿼리
			String readsql = "update board set readcount = readcount+1 where num=?";
			pstmt = con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			//쿼리준비
			String sql ="select * from board where num=?";
			
			//쿼리 실행객체
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			//쿼리 실행 후 결과를 리턴
			rs= pstmt.executeQuery();
			if(rs.next()) {
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
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	

}
