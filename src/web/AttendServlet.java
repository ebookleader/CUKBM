package web;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AttendServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws
	IOException, ServletException {
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("LOGIN_ID");
		int postno = Integer.parseInt(request.getParameter("seqno"));
		RequestDispatcher dispatcher = null;
		Connection conn = null;
		Statement stmt = null;
		Statement stmt0= null;
		Statement stmt1 = null; 
		Statement stmt2 = null;
		Statement stmt3 = null;
		int result;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			stmt = conn.createStatement();
			stmt0 = conn.createStatement();
			stmt1 = conn.createStatement();			
			stmt2 = conn.createStatement();
			stmt3 = conn.createStatement();
			String writer="";
			String title ="";
			
			rs = stmt.executeQuery("select * from forcedb where user = '"+user+"' and postno="+postno);
			
			if(rs.next()) {
				result=3;
				response.sendRedirect("attendResult.jsp?result="+result);
			}
			else {
			rs1 = stmt1.executeQuery("select * from boarddb where seqno="+postno+";");
			if(rs1.next()) {
				writer = rs1.getString("writer"); //���ۼ���
				title = rs1.getString("title");//�۳���
				int attend_min = rs1.getInt("attend_min");
				int attend_max = rs1.getInt("attend_max");
				if(attend_min>=attend_max) {
					result=0;
					dispatcher = request.getRequestDispatcher("attendResult.jsp?result="+result);
					dispatcher.forward(request, response);
				}
				else {
					String command0 = String.format("INSERT INTO postdb(postno, user) VALUES (%s,'%s');", postno, user);
					int rowNum = stmt0.executeUpdate(command0);
					if(rowNum<1)
						throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�.");
					String command1 = String.format("UPDATE boarddb SET attend_min = attend_min+1 WHERE seqno = %d", postno);	//���� ���ȣ�� �����ο�+1
					int rowNum1 = stmt1.executeUpdate(command1);
					if(rowNum1<1)
						throw new Exception("DB�� �ԷºҰ�");
					int rowNum2 = stmt2.executeUpdate("insert into msgdb "
							+ "values(null,'"+user+"','"+writer+"','"+user+"���� �Խñ� "+postno+"�� ["+title+"] ��Ī�� �����Ͽ����ϴ�.','����');");
					if(rowNum2<1)
						throw new Exception("DB�� �ԷºҰ�");
					rs2 = stmt1.executeQuery("select * from boarddb where seqno = "+postno+";");
					if(rs2.next()) {
						int min = rs2.getInt("attend_min");
						int max = rs2.getInt("attend_max");
						if(min==max) {
							int rowNum3 = stmt3.executeUpdate("insert into msgdb "
									+ "values(null,'"+writer+"','"+writer+"','�Խñ� "+postno+"�� ["+title+"] ��Ī�� ���� �ο��� �����Ǿ����ϴ�.<br>��Ī�� Ȯ�����ּ���.','����');");
							if(rowNum3<1)
								throw new Exception("DB�� �ԷºҰ�");
						}
					}	
					
					result=1;
					response.sendRedirect("attendResult.jsp?result="+result);
				}
			}
			}			
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			try {
				stmt.close();
				stmt0.close();
				stmt1.close();
				stmt2.close();
				stmt3.close();
			} catch (Exception e) {}
			try {
				conn.close();
			} catch (Exception e) {}
		}
	}

}
