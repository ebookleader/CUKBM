package web;

import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import member.BoardItem;
import member.IdVO;
public class BoardItemServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {		
		BoardItem item = new BoardItem();
		IdVO idvo = new IdVO();
		int seqno = Integer.parseInt(request.getParameter("SEQ_NO"));
		int enter; //참가여부
		String subject = request.getParameter("SUBJECT");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGIN_ID"); 
		int force = 0; //강퇴기능 부여 - 방장=1
		int block = 0; //매칭확정기능 부여 - 방장(force=1)이고 close=0인 상태만 1
		int enterbt = 0; //참가신청기능 - close아닐때만 0
		int close=0; //마감여부
		Connection conn = null;
		Statement stmt = null;
		Statement stmt1 = null;
		Statement stmt2 = null;
		Statement stmt3 = null;
		int attend_min=0;
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
				if(rs.getString("writer").equals(id)) {
					force=1;
					if(rs.getInt("close")==0)
						block=1;
				}
				if(rs.getInt("close")==1)
					enterbt = 1;
				item.setTitle(rs.getString("title"));
				item.setContent(rs.getString("content"));
				item.setWriter(rs.getString("writer"));
				item.setDate(rs.getString("date"));
				item.setHeart(rs.getInt("heart"));
				attend_min = rs.getInt("attend_min");
				item.setAttend_max(rs.getInt("attend_max"));
				item.setAttend_min(attend_min);
				close = rs.getInt("close");
			}
			//IDVO사용
			rs = stmt2.executeQuery("select * from postdb where postno = "+seqno+";");
			for(int cnt=0;cnt<attend_min;cnt++) {
				if(!rs.next())
					break;
				String user = rs.getString("user");
				idvo.setIdlist(cnt, user);
				ResultSet rs1 = stmt3.executeQuery("select photo from userinfo where id = '"+user+"';");
				if(rs1.next())
					idvo.setPhotolist(cnt, rs1.getString("photo"));
			}
			//참가여부 확인
			rs = stmt1.executeQuery("select * from postdb where postno = "+seqno+" and user = '"+id+"';");
			if(rs.next())
				enter = 1;
			else
				enter = 0;
			request.setAttribute("IDVO", idvo);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("BoardItemView.jsp?SEQ_NO="+seqno+"&SUBJECT="+subject+
				"&ENTER="+enter+"&force="+force+"&block="+block+"&enterbt="+enterbt+"&close="+close);
		dispatcher.forward(request, response);
	}
}