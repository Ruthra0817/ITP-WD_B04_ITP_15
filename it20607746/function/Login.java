package eschool.teacher.function;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eschool.teacher.model.*;
import eschool.teacher.service.Service;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		int teacherID = Integer.parseInt(request.getParameter("teacherID"));
		String password = request.getParameter("password");
		Teacher t = Service.getTeacherByID(teacherID);
		if(t == null) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('id incorrect');");
			out.println("location='login.jsp';");
			out.println("</script>");
		}else if(!t.getPassword().equals(password)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('password incorrect');");
			out.println("location='login.jsp';");
			out.println("</script>");
		}else if(t.getPassword().equals(password) && t.getTeacherID() == teacherID) {
			HttpSession session=request.getSession();  
	        session.setAttribute("name",t.getName());
	        session.setAttribute("id",t.getTeacherID());
	        response.sendRedirect("index.jsp");
		}
	}

}
