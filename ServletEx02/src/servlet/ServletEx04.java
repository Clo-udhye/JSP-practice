package servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/setvlet04"},
initParams = {
		@WebInitParam(name="id", value="tester"),
		@WebInitParam(name="password", value="123456"),
})
public class ServletEx04 extends HttpServlet {
	private String id;
	private String password;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		id = getInitParameter("id");
		password = getInitParameter("password");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("id : " + id);
		System.out.println("password : " + password);
	}
	
}
