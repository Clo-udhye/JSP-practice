import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisEx01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String resource = "myBatisConfig.xml";
		
		InputStream is = null;
		SqlSession sqlSession = null;
		
		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
			System.out.println("호출 성공");
		
			sqlSession = sqlSessionFactory.openSession(true); //자동 커밋
			System.out.println("연결 성공");
			
			//String sql = "create table tbl (col1 varchar(10))";
			//int result = sqlSession.update("createTable1", sql);
			
			//int result = sqlSession.update("createTable2", "tbl2");
			
			int result = sqlSession.update("dropTable1", "tbl2");
			
			if(result == 0) {
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : " + e.getMessage());
		} finally {
			if(sqlSession!=null) sqlSession.close();
			if(is!=null) try { is.close(); } catch (IOException e) {}
		}
	}

}
