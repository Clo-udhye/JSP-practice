package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GugudanEx01 extends HttpServlet {	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=utf-8");
		String str_startDan = req.getParameter("startDan");
		String str_endDan = req.getParameter("endDan");	
		
		PrintWriter out = resp.getWriter();
		
		out.println("<!doctype html>");
		out.println("<head>");
		out.println("<meta charset='utf-8' />");
		out.println("</head>");
		out.println("<body>");
		
		out.println("<form action='./gugudan01' method='post'>");
		out.println("시작단<input type='text' name='startDan' />");
		out.println("끝단<input type='text' name='endDan' />");
		out.println("<input type='submit' value='구구단출력' />");
		out.println("</form>");
		
		out.println("<br /><hr /><br />");
		
		if(str_startDan!=null && str_endDan!=null && !str_startDan.equals("") && !str_endDan.equals("")) {
			int startDan = Integer.parseInt(req.getParameter("startDan"));
			int endDan = Integer.parseInt(req.getParameter("endDan"));
		
			out.println("<table border='1' width='800'>");
			for(int i=startDan-1; i<=endDan; i++) {
				out.println("<tr>");
				for(int j=0; j<=9; j++) {
					out.println("<td>");
					if(i==startDan-1 && j==0) {
						out.println("");
					} else if(i==startDan-1) {
						out.println("x"+j);
					} else if(j==0) {
						out.println(i+"단");
					} else {
						out.println(i + " x " + j + " = " + (i*j));
					}
					out.println("</td>");
				}
				out.println("</tr>");
			}
			out.println("</table>");
		}
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}
}
