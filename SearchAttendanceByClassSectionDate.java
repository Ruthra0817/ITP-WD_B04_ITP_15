package eschool.attendance.function;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eschool.attendance.model.Attendance;
import eschool.attendance.service.Service;

/**
 * Servlet implementation class SearchAttendanceByClassSectionDate
 */
@WebServlet("/SearchAttendanceByClassSectionDate")
public class SearchAttendanceByClassSectionDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAttendanceByClassSectionDate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int year = Integer.parseInt(request.getParameter("class"));
		String section = request.getParameter("section");
		java.sql.Date date = java.sql.Date.valueOf(request.getParameter("date"));
		ArrayList<Attendance> list = Service.getAttendanceBySectionClassDate(year, section, date);
		request.setAttribute("searchAttendanceByClassSectionDate", list);
		RequestDispatcher rd = request.getRequestDispatcher("attendances-list.jsp");
		rd.forward(request, response);
	}

}
