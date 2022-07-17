package web;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FreeWriteServlet extends HttpServlet{		
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
				
		String title = request.getParameter("title");	//title
		String writer = (String) session.getAttribute("LOGIN_ID");	//writer
		String subject = request.getParameter("subject"); //subject
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDT = dayTime.format(System.currentTimeMillis());	//date
		String content  = request.getParameter("content");	//content
		int master = 1;	//방장여부
		int heart = 0;	//좋아요 수
		Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			stmt = conn.createStatement();
			String command  = String.format("insert into boarddb(title, writer, date, content, heart, master, subject) values('%s', '%s', '%s', '%s', %s, %s, '%s');",
					title, writer, currentDT, content, heart, master,subject);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		finally {
			try {
				stmt.close();
			}
			catch (Exception ignored) {}
			try {
				conn.close();
			}
			catch (Exception ignored) {}
		}
		
		response.sendRedirect("/cukbm/freeBoard?SUBJECT="+subject);
	}
}