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

public class MyBatisEx08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String resource = "myBatisConfig.xml";
		
		InputStream is = null;
		SqlSession sqlSession = null;
		
		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
			System.out.println("호출 성공");
		
			sqlSession = sqlSessionFactory.openSession();
			System.out.println("연결 성공");
			
			List<Map> lists = sqlSession.selectList("selectList6");
			System.out.println(lists.size());
			
			for(int i=0; i<lists.size(); i++) {
				Map map = lists.get(i);
				System.out.print(map.get("empno")+" ");
				System.out.print(map.get("ename")+" ");
				System.out.println(map.get("grade"));
			}
			
			/*
			for(Map map : lists) {
				Set keys = map.keySet();
				for(Object key : keys) {
					String s_key = (String)key;
					System.out.print(map.get(s_key) + " ");
				}
				System.out.println();
			}
			*/
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : " + e.getMessage());
		} finally {
			if(sqlSession!=null) sqlSession.close();
			if(is!=null) try { is.close(); } catch (IOException e) {}
		}
	}

}
