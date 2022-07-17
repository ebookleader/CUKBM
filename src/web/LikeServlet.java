
package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LikeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGIN_ID"); //사용자 id
		if(id==null)
			throw new ServletException("회원 정보가 없습니다.");
		int sequence = Integer.parseInt(request.getParameter("seqno")); //좋아요 할 글 번호
		Connection conn = null;
		Statement stmt = null;
		String title=null; //제목
		String subject=null; //카테고리
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			if(conn==null)
				throw new ServletException("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from boarddb where seqno="+sequence+";");
			if(rs.next()) {
				title = rs.getString("title");
				subject = rs.getString("subject");
			}
			ResultSet rs1 = stmt.executeQuery("select * from likedb where like_seqno = '"+sequence+"' AND like_id = '"+id+"';");
			if(!rs1.next()) {
				int rowNum = stmt.executeUpdate("insert into likedb values(null,'"+id+"',"+sequence+",'"+title+"','"+subject+"');");
				if(rowNum<1)
					throw new Exception("데이터를 db에 입력할 수 없습니다.");
				rowNum = stmt.executeUpdate("update boarddb set heart = heart+1 where seqno="+sequence+";");
				if(rowNum<1)
					throw new Exception("데이터를 db에 입력할 수 없습니다.");
				response.sendRedirect("LikeResult.jsp");
			} else {
				response.sendRedirect("LikeFail.jsp");
			}
			
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
