package web;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AttendCancelServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws
	IOException, ServletException {
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("LOGIN_ID");
		int postno = Integer.parseInt(request.getParameter("seqno"));
		RequestDispatcher dispatcher = null;
		Connection conn = null;
		Statement stmt0= null;
		Statement stmt1 = null; 
		int result;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			stmt0 = conn.createStatement();
			stmt1 = conn.createStatement();			
			// 
			int rowNum = stmt0.executeUpdate("update boarddb set attend_min = attend_min-1 where seqno = "+postno+";");
			if(rowNum<1) 
				throw new Exception("데이터를 db에 업데이트 할 수 없습니다.");
			rowNum = stmt1.executeUpdate("delete from postdb where postno = "+postno+" and user = '"+user+"';");	
			if(rowNum<1) 
				throw new Exception("데이터를 db에 업데이트 할 수 없습니다.");
			result=2;
			dispatcher = request.getRequestDispatcher("attendResult.jsp?result="+result);
			dispatcher.forward(request, response);
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			try {
				stmt0.close();
				stmt1.close();
			} catch (Exception e) {}
			try {
				conn.close();
			} catch (Exception e) {}
		}
	}

}