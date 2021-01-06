package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletEx01
 */
@WebServlet(urlPatterns = "/ServletEx01", loadOnStartup = 1)
public class ServletEx01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init()
	 */
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("ServletEx01 init 호출");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ServletEx01 doGet 호출");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
