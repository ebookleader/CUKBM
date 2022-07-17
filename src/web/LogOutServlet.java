package web;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class LogOutServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws
	IOException, ServletException {	
		HttpSession session = request.getSession();
		session.removeAttribute("LOGIN_ID");
		response.sendRedirect("CUKBM_FrontPage.jsp");
	}
}
