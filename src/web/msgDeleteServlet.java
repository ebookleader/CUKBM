package web;

import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class msgDeleteServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {		
	
		String msgno = request.getParameter("msgno");
		
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			if(conn==null)
				throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
			stmt = conn.createStatement();
			String command = "delete from msgdb where msgno=" + msgno +";";
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
				throw new Exception("�����͸� �Է��� �� �����ϴ�.");
			response.sendRedirect("/cukbm/msgReceive");
		}
		catch(Exception e) {
			throw new ServletException(e);
		}
		finally {
			try {
				stmt.close();
			}
			catch(Exception ignored){
			}
			try {
				conn.close();
			}
			catch(Exception ignored){
			}
		}
	}
}
