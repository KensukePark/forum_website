package Member_Package;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class MemoDao {
	private static MemoDao instance = new MemoDao();
	
	private MemoDao() {	}
	
	public static MemoDao getInstance() {
		return instance;
	}
	
	public ArrayList<MemoDto> getList() {
		ArrayList<MemoDto> dtos = new ArrayList<MemoDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			String query = "select * from text2 order by NUM desc";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				String bnamae = resultSet.getString("namae");
				String btitle = resultSet.getString("title");
				int bnum = resultSet.getInt("num");
							
				MemoDto dto = new MemoDto(bnamae, btitle, bnum);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	public int deleteMemo(int num){
		int ri = 0;		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "delete text2 where num=?";		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, num);
			ri = pstmt.executeUpdate();  
			// 업데이트 한 결과를 정수로 반환 1 이면 정상
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return ri;   // 리턴 1이면 정상, 0 이면 에러 
	}
	public int insertMemo(MemoDto dto) {
		int ri = 0;   // 지역 변수 
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into text2 values (auto_num.NEXTVAL,?,?)";	
		try {
			connection = getConnection();  // 호출 - 맨뒤에 있음
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getNamae());  // 데이터 저장
			pstmt.setString(2, dto.getTitle());
			pstmt.executeUpdate();  // 실행
			
		/*select 가 아니므로 resultSet 객체가 없고 반환형이 int 형이다.*/
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return ri;   
	}  /* ri  select 가 아니므로 resultSet 객체가 없고 반환형이 int 형이다.*/	
	
	private Connection getConnection() {
		
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			// 오라클 DB를 사용하기 위한 객체 context 생성
			
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			// context 객체로 lookup 메소드에 매개변수를 이용하여 리소스를 획득한다.
			// 오라클 DB 이름은 기본적으로 java:comp/env 에 등록되어 있다.
			// 해당 영역에서 jdbc/Oracle11g 로 설정된 이름을 얻어온다.
		
			connection = dataSource.getConnection();
			// ds 객체로부터 Connection  객체 얻어온다.
			// 지금부터는 이 객체는 웹 컨테이너의 DBCP 에 의해 관리된다.
			 
			} catch (Exception e) {
				e.printStackTrace();
			}	
			return connection;
		}
}
