package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GugudanEx02 extends HttpServlet {	
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
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp){
		// TODO Auto-generated method stub
		try {
			req.setCharacterEncoding("utf-8");
			
			String startDan = req.getParameter("startDan") == null? "" : req.getParameter("startDan");
			String endDan = req.getParameter("endDan") == null? "" : req.getParameter("endDan");	
			
			resp.setContentType("text/html;charset=utf-8");
			
			StringBuffer html = new StringBuffer();
			html.append("<!DOCTYPE html>");
			html.append("<html>");
			html.append("<head>");
			html.append("<meta charset='utf-8' />");
			html.append("<title></title>");
			html.append("</head>");
			
			html.append("<body>");
			html.append("<form action='./gugudan02' method='post'>");
			html.append("시작단<input type='text' name='startDan' />");
			html.append(" - ");
			html.append("끝단<input type='text' name='endDan' />");
			html.append(" <input type='submit' value='구구단출력' />");
			html.append("</form>");
			
			html.append("<br /><hr /><br />");
			
			if(!startDan.equals("") && !endDan.equals("")) {
				int iStartDan = Integer.parseInt(startDan);
				int iEndDan = Integer.parseInt(endDan);
			
				html.append("<table border='1' width='800'>");
				for(int i=iStartDan-1; i<=iEndDan; i++) {
					html.append("<tr>");
					for(int j=0; j<=9; j++) {
						html.append("<td>");
						if(i==iStartDan-1 && j==0) {
							html.append("");
						} else if(i==iStartDan-1) {
							html.append("x"+j);
						} else if(j==0) {
							html.append(i+"단");
						} else {
							html.append(i + " x " + j + " = " + (i*j));
						}
						html.append("</td>");
					}
					html.append("</tr>");
				}
				html.append("</table>");
			}
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
