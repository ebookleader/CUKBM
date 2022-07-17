package web;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
//
import member.BoardList;
//
public class MemberPageServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws IOException, ServletException{
		String id = request.getParameter("id"); //참가자 id
		BoardList list = new BoardList();
		Connection conn = null;
		Statement stmt = null;	
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC","root","wjddms97");
			if(conn==null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
			stmt = conn.createStatement();			
			ResultSet rs = stmt.executeQuery("select * from userinfo where id='"+id+"';");
			if(rs.next()) {
				request.setAttribute("id", rs.getString("id"));
				request.setAttribute("major", rs.getString("major"));
				request.setAttribute("age", rs.getString("age"));
				request.setAttribute("phone", rs.getString("phone"));
				request.setAttribute("photo", rs.getString("photo"));
				request.setAttribute("pr", rs.getString("pr"));
			}
			request.setAttribute("Board_List", list);
		}
		catch(Exception e) {
			throw new ServletException(e);
		}
		finally {
			try {
				stmt.close();
			}
			catch(Exception ignored) {
			}
			try {
				conn.close();
			}
			catch(Exception ignored) {
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("MemberPage.jsp");
		dispatcher.forward(request, response);
	}	
	}