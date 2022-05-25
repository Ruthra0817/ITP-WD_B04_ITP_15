package eschool.attendance.crud;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eschool.attendance.service.Service;

/**
 * Servlet implementation class UpdateAttendance
 */
@WebServlet("/UpdateAttendance")
public class UpdateAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int studentID = Integer.parseInt(request.getParameter("studentID"));
		String status = request.getParameter("status");
		java.sql.Date date = java.sql.Date.valueOf(request.getParameter("date"));
		Service.updateAttaendance(status, studentID, date);
		response.sendRedirect("attendances-list.jsp");
	}

}
