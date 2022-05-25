package eschool.attendance.crud;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eschool.attendance.service.Service;
import eschool.student.model.Student;

/**
 * Servlet implementation class NewAttendance
 */
@WebServlet("/NewAttendance")
public class NewAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		int year = Integer.parseInt(request.getParameter("class"));
		String section = request.getParameter("section");
		java.sql.Date date = java.sql.Date.valueOf(request.getParameter("date"));
		String status = request.getParameter("status");
		Student student = eschool.student.service.Service.getStudentByID(id);
		if(student.getYear() == year && student.getSection().equals(section)) {
			Service.newAttendance(id, date, status, year, section);
			response.sendRedirect("attendances-list.jsp");
		}
		else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('incorrect class and section for given student id');");
			out.println("location='attendances-list.jsp';");
			out.println("</script>");
		}
	}

}
