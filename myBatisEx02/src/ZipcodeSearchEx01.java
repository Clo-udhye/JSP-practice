import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ZipcodeSearchEx01 {

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
			
			ArrayList<ZipcodeTO> lists = (ArrayList)sqlSession.selectList("selectList1", "신사%");
			for(ZipcodeTO to : lists) {
				System.out.printf("[%s] %s %s %s %s %s%n",
						to.getZipcode(), to.getSido(), to.getGugun(), to.getDong(), to.getRi(), to.getBunji());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(sqlSession!=null) sqlSession.close();
			if(is!=null) try { is.close(); } catch (IOException e) {}
		}
	}

}
