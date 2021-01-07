package model2;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model1.BoardDAO;
import model1.BoardTO;

public class ModifyOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ModifyOkAction");
		
		String uploadPath = "C:/Java/jsp-workspace/PdsModel2Ex01/WebContent/upload";
		int maxFileSize = 1024 *1024 * 2; 
		String encType = "utf-8";

		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy());
			
			BoardTO to = new BoardTO();
			to.setSeq(multi.getParameter("seq"));
			to.setPassword(multi.getParameter("password"));
			
			to.setSubject(multi.getParameter("subject"));
			to.setContent(multi.getParameter("content"));
			to.setMail("");
			if(!multi.getParameter("mail1").equals("") && !multi.getParameter("mail2").equals("")){
				to.setMail(multi.getParameter("mail1") + "@" + multi.getParameter("mail2"));
			}
			
			String newFilename = multi.getFilesystemName("upload");
			long newFilesize = 0;
			File newFile = multi.getFile("upload");
			if(newFile != null){
				newFilesize = newFile.length();
			}
			
			to.setFilename(newFilename);
			to.setFilesize(newFilesize);
			
			BoardDAO dao = new BoardDAO();
			int flag = dao.boardModifyOk(to);
			
			request.setAttribute("to", to);
			request.setAttribute("flag", flag);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
