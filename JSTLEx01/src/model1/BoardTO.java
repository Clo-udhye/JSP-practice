package model1;

public class BoardTO {
	private String subject;
	private String writer;
	
	public BoardTO() {
		// TODO Auto-generated constructor stub
		System.out.println("생성자 호출");
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
}
