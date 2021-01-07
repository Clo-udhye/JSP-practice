package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardListTO;
import model1.BoardTO;

public class ListAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ListAction");
		
		BoardListTO listTO = new BoardListTO();
		listTO.setCpage(request.getParameter("cpage")==null? 1 : Integer.parseInt(request.getParameter("cpage")));
		
		BoardDAO dao = new BoardDAO();
		listTO = dao.boardList(listTO);
		
		request.setAttribute("listTO", listTO);
	}

}
