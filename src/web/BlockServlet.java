//방장이 마감했을 때
package web;

import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BlockServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws
	IOException, ServletException {
		HttpSession session = request.getSession();
		int seqno = Integer.parseInt(request.getParameter("seqno"));
		String id = (String)session.getAttribute("LOGIN_ID");
		String title="";
		String kakao="";
		request.setCharacterEncoding("euc-kr");
		Connection conn = null;
		Statement stmt =null;
		Statement stmt1 = null;
		Statement stmt2 = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			stmt = conn.createStatement();
			stmt1 = conn.createStatement();
			stmt2 = conn.createStatement();
			String writer = "";
			ResultSet rs = stmt.executeQuery("select * from boarddb where seqno = "+seqno+";");
			if(rs.next()) {
				writer = rs.getString("writer");
				title = rs.getString("title");
				kakao = rs.getString("kakao");
			}
			if(id.equals(writer)) {
				int rowNum = stmt.executeUpdate("update boarddb set close = 1 where seqno = "+seqno+";");
				if(rowNum<1)
					throw new Exception("데이터를 DB에 입력할 수 없습니다.");
				//참가중인 사용자들 아이디 가져옴
				ResultSet rs1 = stmt1.executeQuery("select * from postdb where postno = "+seqno+";");
				while(rs1.next()) {
					String receiver = rs1.getString("user");
					int rowNum2 = stmt2.executeUpdate("insert into msgdb "
							+ "values(null,'"+writer+"','"+receiver+"', '게시글 "+seqno+"번 ["+title+"] 매칭이 확정되었습니다.<br>오픈카카오톡주소 "+kakao+"','확정');");
					if(rowNum2<1)
						throw new Exception("데이터 DB 입력 불가능");
				}
				int rowNum3 = stmt2.executeUpdate("insert into msgdb "
						+ "values(null,'"+writer+"','"+writer+"', '게시글 "+seqno+"번 ["+title+"] 매칭이 확정되었습니다.<br>오픈카카오톡주소  "+kakao+"','확정');");
				if(rowNum3<1)
					throw new Exception("데이터 DB 입력 불가능");
				response.sendRedirect("block.jsp?RESULT=1");
			}
			else {
				response.sendRedirect("block.jsp?RESULT=0");
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			try {
				stmt.close();
				stmt1.close();
			} catch(Exception ig) {}
			try {
				conn.close();
			} catch(Exception ig) {}
		}		
	}
}
