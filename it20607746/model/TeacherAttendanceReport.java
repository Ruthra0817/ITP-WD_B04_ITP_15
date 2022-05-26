package eschool.teacher.model;

public class TeacherAttendanceReport {
	
	private java.sql.Date date;
	private String status;
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
