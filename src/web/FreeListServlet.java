package web;

import javax.servlet.http.*; 
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import member.BoardList;

public class FreeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,
			          HttpServletResponse response)
	                  throws IOException, ServletException {
		String subject = request.getParameter("SUBJECT");
		String strUpperSeqNo = request.getParameter("LAST_SEQ_NO");
		int upperSeqNo;
		int last_seq_no;
		if (strUpperSeqNo == null || strUpperSeqNo=="") { //입력값이 없으면 int범위 최대값 사용
			last_seq_no = Integer.MAX_VALUE;
			upperSeqNo = Integer.MAX_VALUE;
		}
		else
			upperSeqNo = Integer.parseInt(strUpperSeqNo); //입력값 있으면 upperSeqno = last sequence number
		BoardList list = readDB(upperSeqNo,subject);
		last_seq_no = getLastSeqNum(upperSeqNo, subject);
		request.setAttribute("Board_List", list);
		request.setAttribute("LAST_SEQ_NO",last_seq_no);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FreeListView.jsp?LAST_SEQ_NO="+last_seq_no+"&SUBJECT="+subject); 
		dispatcher.forward(request, response);
	}

	private BoardList readDB(int upperSeqNo, String subject) 
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
			 ResultSet rs = stmt.executeQuery("select * from boarddb where seqno<"+upperSeqNo+
					 " and subject='"+subject+"' order by seqno desc limit 21");
			for (int cnt = 0; cnt < 20; cnt++) {
				if(!rs.next())
					break;
				list.setSeqNo(cnt, rs.getInt("seqno"));
				list.setWriter(cnt, rs.getString("writer"));
				list.setTitle(cnt, rs.getString("title"));
				list.setDate(cnt, rs.getString("date"));
				list.setContent(cnt, rs.getString("content"));
				list.setHeart(cnt, rs.getInt("heart"));
				list.setMaster(cnt, rs.getInt("master"));
			}
			if (!rs.next())
				list.setLastPage(true);
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
	
	private int getLastSeqNum(int upperSeqNo, String subject) throws ServletException{
		Connection conn = null;
		Statement stmt = null;
		int lastnum = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			if(conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery("select seqno from boarddb where seqno<"+upperSeqNo+
					 " and subject='"+subject+"' order by seqno desc limit 20");
			for (int cnt = 0; cnt < 20; cnt++) {
				if(!rs.next())
					break;
				lastnum = rs.getInt("seqno");
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