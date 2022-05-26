package eschool.teacher.crud;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eschool.teacher.service.Service;

/**
 * Servlet implementation class UpdateTeacher
 */
@WebServlet("/UpdateTeacher")
public class UpdateTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int teacherID = Integer.parseInt(request.getParameter("teacherID"));
		String name = request.getParameter("name");
		java.sql.Date dob = java.sql.Date.valueOf(request.getParameter("DOB"));
		String address = request.getParameter("address");
		String phone = request.getParameter("phonenumber");
		String password = request.getParameter("password");
		Service.updateTeacher(teacherID, name, address, phone, dob, password);
		response.sendRedirect("teachers-all.jsp");
	}

}
