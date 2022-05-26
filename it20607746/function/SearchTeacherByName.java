package eschool.teacher.function;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eschool.teacher.model.Teacher;
import eschool.teacher.service.Service;

/**
 * Servlet implementation class SearchTeacherByName
 */
@WebServlet("/SearchTeacherByName")
public class SearchTeacherByName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTeacherByName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		ArrayList<Teacher> list = Service.getTeacherByName(search);
		request.setAttribute("searchTeacherByName", list);
		RequestDispatcher rd = request.getRequestDispatcher("teachers-all.jsp");
		rd.forward(request, response);
	}

}
