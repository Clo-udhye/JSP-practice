package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class FirstListener implements ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		// 서버의 시작과 관련
		System.out.println("contextInitialized(ServletContextEvent sce) 호출");
	}
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		// 서버의 종료와 관련
		System.out.println("contextDestroyed(ServletContextEvent sce) 호출");
	}
}
