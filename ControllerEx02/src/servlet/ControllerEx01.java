package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerEx01
 */
@WebServlet("*.do")
public class ControllerEx01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {
		 // http://localhost:8080/프로젝트명/view1.do	- view1.jsp
		 // http://localhost:8080/프로젝트명/view2.do	- view2.jsp
		
		//System.out.println(request.getRequestURI());
		//System.out.println(request.getContextPath());
		try {
			request.setCharacterEncoding("utf-8");
			
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			
			String url = "";
			if(path.equals("/*.do") || path.equals("/view1.do")) {
				url = "/WEB-INF/views/view1.jsp";
			} else if(path.equals("/view2.do")) {
				url = "/WEB-INF/views/view2.jsp";
			} else {
				
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
