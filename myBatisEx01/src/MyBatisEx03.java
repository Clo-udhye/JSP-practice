import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisEx03 {

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
			
			// sql 구문없이 mapper를 통해 select
			//DeptTO to = (DeptTO)sqlSession.selectOne("select1");
			//DeptTO to = (DeptTO)sqlSession.selectOne("select2", "10");
			
			DeptTO pto = new DeptTO();
			pto.setDeptno("10");
			pto.setDname("ACCOUNTING");
			DeptTO to = (DeptTO)sqlSession.selectOne("mybatis.select3", pto);
			
			System.out.println(to.getDeptno());
			System.out.println(to.getDname());
			System.out.println(to.getLoc());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : " + e.getMessage());
		} finally {
			if(sqlSession!=null) sqlSession.close();
			if(is!=null) try { is.close(); } catch (IOException e) {}
		}
	}

}
