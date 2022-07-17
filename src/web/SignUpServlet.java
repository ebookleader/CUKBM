package web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SignUpServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws
	IOException, ServletException {
	request.setCharacterEncoding("euc-kr");	
	String ID=request.getParameter("id");
	String PASSWORD=request.getParameter("password");
	String MAJOR=request.getParameter("major");
	String  AGE=request.getParameter("age");
	String PHONE=request.getParameter("phone");	
	String PHOTO = request.getParameter("photo");
	String PR = request.getParameter("pr");
	PHOTO = "img/icon/"+PHOTO+".jpg";
	boolean IdCheck = false;
	int result = 0;
	
	Connection conn =null;
	Statement stmt =null;
	Statement stmt1 =null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
		if(conn==null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		
		stmt1 = conn.createStatement();
		ResultSet rs = stmt1.executeQuery("select id from userinfo where id = '" + ID + "';");
		if(rs.next()) {
			IdCheck = false;
		}
		else if(!rs.next()) { 
			IdCheck = true;
		}
		if(IdCheck == true) {
			result = 1;
			stmt = conn.createStatement();
			String command = String.format("insert into userinfo values('%s', '%s', '%s', '%s', '%s', '%s','%s');", ID, PASSWORD, MAJOR, AGE, PHONE, PHOTO,PR);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
				throw new Exception("DB에 입력할 수 없습니다.");
		}
		 else if(IdCheck == false){
	         result = 0;
	      }
	} catch(Exception e) {
		System.out.println(e.toString());
	} finally {
		try {
		stmt.close();
	} catch (Exception ignored) {}
		try {
		conn.close();
		} catch (Exception ignored) {}
	}
	if(result == 1) {
		response.sendRedirect("SignUpRst.jsp?result=1");
	}
	else if(result == 0) {
		response.sendRedirect("SignUpRst.jsp?result=0");
	}
}
}
