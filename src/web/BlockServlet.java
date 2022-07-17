//������ �������� ��
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
					throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�.");
				//�������� ����ڵ� ���̵� ������
				ResultSet rs1 = stmt1.executeQuery("select * from postdb where postno = "+seqno+";");
				while(rs1.next()) {
					String receiver = rs1.getString("user");
					int rowNum2 = stmt2.executeUpdate("insert into msgdb "
							+ "values(null,'"+writer+"','"+receiver+"', '�Խñ� "+seqno+"�� ["+title+"] ��Ī�� Ȯ���Ǿ����ϴ�.<br>����īī�����ּ� "+kakao+"','Ȯ��');");
					if(rowNum2<1)
						throw new Exception("������ DB �Է� �Ұ���");
				}
				int rowNum3 = stmt2.executeUpdate("insert into msgdb "
						+ "values(null,'"+writer+"','"+writer+"', '�Խñ� "+seqno+"�� ["+title+"] ��Ī�� Ȯ���Ǿ����ϴ�.<br>����īī�����ּ�  "+kakao+"','Ȯ��');");
				if(rowNum3<1)
					throw new Exception("������ DB �Է� �Ұ���");
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
