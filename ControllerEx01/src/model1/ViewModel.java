package model1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ViewModel {
	
	public void execute(HttpServletRequest request, HttpServletResponse response);
		
}	
