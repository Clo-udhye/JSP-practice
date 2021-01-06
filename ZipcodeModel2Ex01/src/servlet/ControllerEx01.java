package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.ActionModel;
import model2.ZipcodeAction;
import model2.ZipcodeOkAction;

/**
 * Servlet implementation class ControllerEx01
 */
@WebServlet("/controller")
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
		/*
			controller?action=zipcode	=> zipcode.jsp
			controller?action=zipcode_ok => zipcode_ok.jsp
		 */
		try {
			request.setCharacterEncoding("utf-8");
			
			String action = request.getParameter("action") == null ? "" : request.getParameter("action");
			
			String url = "";
			
			ActionModel model = null;
			if(action.equals("") || action.equals("zipcode")) {
				// 특별히 할일 없음 
				model = new ZipcodeAction();
				model.execute(request, response);
				url = "/WEB-INF/views/zipcode.jsp";
			} else if(action.equals("zipcode_ok")) {
				// 데이터베이스 선택
				model = new ZipcodeOkAction();
				model.execute(request, response);
				
				url = "/WEB-INF/views/zipcode_ok.jsp";
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
