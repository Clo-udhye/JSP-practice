package model1;

public class BoardTO {
	private String subject;
	private String writer;
	
	public String getSubject() {
		System.out.println("getSubject");
		return subject;
	}
	public void setSubject(String subject) {
		System.out.println("setSubject");
		this.subject = subject;
	}
	public String getWriter() {
		System.out.println("getWriter");
		return writer;
	}
	public void setWriter(String writer) {
		System.out.println("setWriter");
		this.writer = writer;
	}
}
