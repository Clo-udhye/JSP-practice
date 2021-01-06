package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/servlet02", "/servlet02_2"})
public class ServletEx02 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) {
		try {
			// 입력 : getParameter
			req.setCharacterEncoding("utf-8");
			
			// 출력 : out
			resp.setContentType("text/html;charset=utf-8");
			StringBuffer html = new StringBuffer();
			
			html.append("<!doctype html>");
			html.append("<html>");
			html.append("<head>");
			html.append("<meta charset='utf-8' />");
			html.append("</head>");
			html.append("<body>");
			html.append("Hello Servlet");
			html.append("</body>");
			html.append("</html>");
			
			PrintWriter out = resp.getWriter();
			out.println(html);
			out.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
