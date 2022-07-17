package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import member.BoardList;

public class OrderByLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,
			          HttpServletResponse response)
	                  throws IOException, ServletException {
		String subject = request.getParameter("SUBJECT");
		int team = Integer.parseInt(request.getParameter("TEAM"));
		BoardList list = readDB(subject, team);
		request.setAttribute("Board_List", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("OrderedBoardListView.jsp"); //13-7 경로명
		dispatcher.forward(request, response);
	}

	private BoardList readDB(String subject, int team) 
		throws ServletException{
		BoardList list = new BoardList();
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			if(conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery(
		               "select * from boarddb where subject= '" + subject + "' AND team = "+team+" order by heart desc;");
			for (int cnt = 0; cnt < 30; cnt++) {
				if(!rs.next())
					break;
				list.setSeqNo(cnt, rs.getInt("seqno"));
				list.setWriter(cnt, rs.getString("writer"));
				list.setTitle(cnt, rs.getString("title"));
				list.setDate(cnt, rs.getString("date"));
				list.setContent(cnt, rs.getString("content"));
				list.setHeart(cnt, rs.getInt("heart"));
				list.setAttend_max(cnt, rs.getInt("attend_max"));
				list.setAttend_min(cnt, rs.getInt("attend_min"));
				list.setMaster(cnt, rs.getInt("master"));
				
			}
		}
		catch (Exception e) {
			throw new ServletException(e);
		}
		finally {
			try {
				stmt.close();
			}
			catch (Exception ignored) {
			}
			try {
				conn.close();
			}
			catch(Exception ignored) {
			}
		}
		return list;
	}
}