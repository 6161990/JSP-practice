package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//데이터 베이스에 연결하고 select, insert, update,delete 작업을 실행해주는 클래스
public class MemberDAO {
 
	//오라클에 접속하는 소스를 작성
	String url ="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id="daegu";
	String pw="dkdlel";
	
	Connection conn; //데이터 베이스에 접근할 수 있도록 설정
	PreparedStatement pstmt; // 데이터 베이스에서 쿼리를 실행시켜주는 존재
	ResultSet rs; // 데이터 베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체 
	
	//데이터 베이스에 접근할 수 있도록 도와주는 메소드 
	public void getCon() {
		
			try {
				//1.해당 데이터 베이스를 사용한다고 선언(클래스를 등록 = 오라클을 사용) 	
				Class.forName("com.mysql.jdbc.Driver");
				
				//2.해당 데이터 베이스에 접속
				conn = DriverManager.getConnection(url, id, pw);
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
	}
	
	
	//데이터 베이스에 한사람의 회원 정보를 저장하는 메소드 
	public void insertMember(MemberBean mbean) {
				try {
					getCon();
					//3. 접속후 쿼리 준비하여 쿼리를 실행하여 쿼리를 사용하도록 설정 
					String SQL = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
					
					//쿼리를 사용하도록 설정 
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					
					//순서 맞게 데이터를 맵핑
					pstmt.setString(1,mbean.getId());
					pstmt.setString(2,mbean.getPass1());
					pstmt.setString(3,mbean.getEmail());
					pstmt.setString(4,mbean.getTel());
					pstmt.setString(5,mbean.getHobby());
					pstmt.setString(6,mbean.getJob());
					pstmt.setString(7,mbean.getAge());
					pstmt.setString(8,mbean.getInfo());
					
					//4.오라클에서 퀴리를 실행 하시오 insert, update,delete 시 사용하는 메소드
					pstmt.executeUpdate();
					
					//5.자원 반납 
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	}
	
}
