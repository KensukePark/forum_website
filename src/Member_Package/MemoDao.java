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
			// ������Ʈ �� ����� ������ ��ȯ 1 �̸� ����
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
		return ri;   // ���� 1�̸� ����, 0 �̸� ���� 
	}
	public int insertMemo(MemoDto dto) {
		int ri = 0;   // ���� ���� 
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into text2 values (auto_num.NEXTVAL,?,?)";	
		try {
			connection = getConnection();  // ȣ�� - �ǵڿ� ����
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getNamae());  // ������ ����
			pstmt.setString(2, dto.getTitle());
			pstmt.executeUpdate();  // ����
			
		/*select �� �ƴϹǷ� resultSet ��ü�� ���� ��ȯ���� int ���̴�.*/
			
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
	}  /* ri  select �� �ƴϹǷ� resultSet ��ü�� ���� ��ȯ���� int ���̴�.*/	
	
	private Connection getConnection() {
		
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			// ����Ŭ DB�� ����ϱ� ���� ��ü context ����
			
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			// context ��ü�� lookup �޼ҵ忡 �Ű������� �̿��Ͽ� ���ҽ��� ȹ���Ѵ�.
			// ����Ŭ DB �̸��� �⺻������ java:comp/env �� ��ϵǾ� �ִ�.
			// �ش� �������� jdbc/Oracle11g �� ������ �̸��� ���´�.
		
			connection = dataSource.getConnection();
			// ds ��ü�κ��� Connection  ��ü ���´�.
			// ���ݺ��ʹ� �� ��ü�� �� �����̳��� DBCP �� ���� �����ȴ�.
			 
			} catch (Exception e) {
				e.printStackTrace();
			}	
			return connection;
		}
}
