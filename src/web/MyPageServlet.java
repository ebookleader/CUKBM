package web;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
//
import member.BoardList;
//
public class MyPageServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws IOException, ServletException{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGIN_ID");
		String strUpperSeqNo = request.getParameter("LAST_SEQ_NO");
		int upperSeqNo;
		int last_seq_no;
		if (strUpperSeqNo == null || strUpperSeqNo=="") { //입력값이 없으면 int범위 최대값 사용
			last_seq_no = Integer.MAX_VALUE;
			upperSeqNo = Integer.MAX_VALUE;
		}
		else
			upperSeqNo = Integer.parseInt(strUpperSeqNo); //입력값 있으면 upperSeqno = last sequence number
		BoardList list = new BoardList();	
		Connection conn = null;
		Statement stmt = null;	
		Statement stmt1 = null;
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC","root","wjddms97");
			if(conn==null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
			stmt = conn.createStatement();
			stmt1 = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from userinfo where id='"+id+"';");
			ResultSet rs1 = null;
			if(rs.next()) {
				request.setAttribute("id", rs.getString("id"));
				request.setAttribute("major", rs.getString("major"));
				request.setAttribute("age", rs.getString("age"));
				request.setAttribute("phone", rs.getString("phone"));
				request.setAttribute("photo", rs.getString("photo"));
				request.setAttribute("pr", rs.getString("pr"));
			}
			rs1 = stmt1.executeQuery("select * from likedb where like_no < "+upperSeqNo
						+" and like_id='"+id+"' order by like_no desc limit 6;");
			for(int cnt=0;cnt<5;cnt++) {
				if(!rs1.next())
					break;
				list.setSeqNo(cnt, rs1.getInt("like_seqno"));
				list.setTitle(cnt, rs1.getString("like_title"));
				list.setSubject(cnt, rs1.getString("like_subject"));
			}
			if (!rs1.next())
				list.setLastPage(true);			
			request.setAttribute("Board_List", list);
			last_seq_no = getLastSeqNum(upperSeqNo, id);
			request.setAttribute("LAST_SEQ_NO",last_seq_no);
		}
		catch(Exception e) {
			throw new ServletException(e);
		}
		finally {
			try {
				stmt.close();
				stmt1.close();
			}
			catch(Exception ignored) {
			}
			try {
				conn.close();
			}
			catch(Exception ignored) {
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("MyPage.jsp?LAST_SEQ_NO="+last_seq_no);
		dispatcher.forward(request, response);
	}
	
	private int getLastSeqNum(int upperSeqNo, String id) throws ServletException{
		Connection conn = null;
		Statement stmt = null;
		int lastnum = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			if(conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery("select like_no from likedb "
			 		+ "where like_no<"+upperSeqNo+" and like_id = '"+id+"' order by like_no desc limit 5;");
			for (int cnt = 0; cnt < 20; cnt++) {
				if(!rs.next())
					break;
				lastnum = rs.getInt("like_no");
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
		return lastnum;
	}
	}