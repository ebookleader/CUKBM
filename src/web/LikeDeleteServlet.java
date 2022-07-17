package web;

import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LikeDeleteServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {		
		int seqno = Integer.parseInt(request.getParameter("SEQ_NO"));
		String id = request.getParameter("ID");
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			if(conn==null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			String command = "delete from likedb where like_seqno="+seqno+" and like_id = '"+id+"';";
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
				throw new Exception("데이터를 입력할 수 없습니다.");
			response.sendRedirect("/cukbm/myPage");
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
