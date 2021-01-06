package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.View1Model;
import model1.View2Model;
import model1.ViewModel;

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
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
			
			String action = request.getParameter("action");
			
			String url = "";
			
			ViewModel model = null;
			if(action==null || action.equals("") || action.equals("view1")) {
				System.out.println("view1 호출");
				
				//View1Model model = new View1Model();
				//model.execute();
				
				model = new View1Model();
				model.execute(request,response);
				
				url = "/WEB-INF/views/view1.jsp";
			} else if(action.equals("view2")) {
				System.out.println("view2 호출");
				
				//View2Model model = new View2Model();
				//model.execute();
				
				model = new View2Model();
				model.execute(request,response);
				
				url = "/WEB-INF/views/view2.jsp";
			}
			
			//jsp:forword와 같은 기능 : (url에서 실행된 화면을 보여줌)
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
