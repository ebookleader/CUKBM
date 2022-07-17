package web;
import member.msgVO;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class msgReceiveServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws
	IOException, ServletException {
		HttpSession session = request.getSession();
		String receiver  = (String)session.getAttribute("LOGIN_ID");
		String strUpperSeqNo = request.getParameter("LAST_SEQ_NO");
		int upperSeqno;
		int last_seq_no;
		if (strUpperSeqNo == null || strUpperSeqNo=="") { //입력값이 없으면 int범위 최대값 사용
			last_seq_no = Integer.MAX_VALUE;
			upperSeqno = Integer.MAX_VALUE;
		}
		else
			upperSeqno=Integer.parseInt(strUpperSeqNo);
		msgVO msgvo = readDB(upperSeqno, receiver);
		last_seq_no = getLastSeqNum(upperSeqno, receiver);
		request.setAttribute("LAST_SEQ_NO",last_seq_no);
		request.setAttribute("MSG_VO", msgvo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("msgView.jsp?LAST_SEQ_NO="+last_seq_no);
		dispatcher.forward(request, response);
	}
	
	private msgVO readDB(int upperSeqno, String receiver) throws ServletException{
		msgVO msgvo = new msgVO();
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC","root","wjddms97");
			if(conn==null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT * FROM msgdb WHERE msgno < "+upperSeqno+" AND receiver = '"+receiver+"' order by msgno desc limit 21;");
			for(int cnt=0; cnt<20; cnt++) {
				if(!rs.next())
					break;
				msgvo.setMsgno(cnt, rs.getInt("msgno"));
				msgvo.setSender(cnt, rs.getString("sender"));
				msgvo.setReceiver(cnt, rs.getString("receiver"));
				msgvo.setContent(cnt, rs.getString("content"));
				msgvo.setKind(cnt, rs.getString("kind"));
			}
			if(!rs.next())
				msgvo.setLastPage(true);
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
		return msgvo;
	}
	
	private int getLastSeqNum(int upperSeqno, String receiver) throws ServletException{
		Connection conn = null;
		Statement stmt = null;
		int lastnum = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			if(conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery("select * from msgdb where msgno<"+upperSeqno+" and receiver='"+receiver+"' order by msgno desc limit 20;");
			for (int cnt = 0; cnt < 20; cnt++) {
				if(!rs.next())
					break;
				lastnum = rs.getInt("msgno");
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