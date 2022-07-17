package web;

import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import member.BoardItem;

public class FreeItemServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {		
		BoardItem item = new BoardItem();
		int seqno = Integer.parseInt(request.getParameter("SEQ_NO"));
		String subject = request.getParameter("SUBJECT");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGIN_ID"); 
		Connection conn = null;
		Statement stmt = null;
		Statement stmt1 = null;
		Statement stmt2 = null;
		Statement stmt3 = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			if(conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			stmt1 = conn.createStatement();
			stmt2 = conn.createStatement();
			stmt3 = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from boarddb where seqno = " + seqno + ";");
			if(rs.next()) {
				item.setTitle(rs.getString("title"));
				item.setContent(rs.getString("content"));
				item.setWriter(rs.getString("writer"));
				item.setDate(rs.getString("date"));
			}
			request.setAttribute("boardItem", item);
			request.setAttribute("SEQ_NO", seqno);
		}
		catch(Exception e) {
			throw new ServletException(e);
		}
		finally {
			try {
				stmt.close();
				stmt1.close();
				stmt2.close();
				stmt3.close();
			}
			catch(Exception ignored	) {
			}
			try {
				conn.close();
			}
			catch(Exception ignored) {
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("FreeItemView.jsp?SEQ_NO="+seqno+"&SUBJECT="+subject);
		dispatcher.forward(request, response);
	}
}