package model2;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model1.BoardDAO;
import model1.BoardTO;

public class WriteOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("WriteOkAction");

		String uploadPath = "C:/Java/jsp-workspace/PdsModel2Ex01/WebContent/upload";
		int maxFileSize = 1024 *1024 * 2; 
		String encType = "utf-8";

		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy());

			BoardTO to = new BoardTO();
			to.setSubject(multi.getParameter("subject"));
			to.setWriter(multi.getParameter("writer"));

			to.setMail("");
			if(!multi.getParameter("mail1").equals("") && !multi.getParameter("mail2").equals("")){
				to.setMail(multi.getParameter("mail1") + "@" + multi.getParameter("mail2"));
			}
			to.setPassword(multi.getParameter("password"));
			to.setContent(multi.getParameter("content"));
			
			to.setWip(request.getRemoteAddr());
			
			to.setFilename(multi.getFilesystemName("upload"));
			File file = multi.getFile("upload");
			to.setFilesize(0);
			if(file != null){
				to.setFilesize(file.length());
			}
			
			BoardDAO dao = new BoardDAO();
			int flag = dao.boardWriteOk(to);
			
			request.setAttribute("flag", flag);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
