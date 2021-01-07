package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class ModifyOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ModifyOkAction");
		
		String cpage = request.getParameter("cpage");
		String seq = request.getParameter("seq");
		
		BoardTO to = new BoardTO();
		to.setSeq(seq);
		to.setPassword(request.getParameter("password"));		
		to.setSubject(request.getParameter("subject"));
		to.setContent(request.getParameter("content"));
		to.setMail("");
		if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
			to.setMail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));
		}

		BoardDAO dao = new BoardDAO();
		int flag = dao.boardModifyOk(to);
		
		request.setAttribute("flag", flag);
		request.setAttribute("cpage", cpage);
		request.setAttribute("seq", seq);
	}

}
