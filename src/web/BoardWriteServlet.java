package web;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardWriteServlet extends HttpServlet{			//�۾��� ������ �Է¹�ư ������ �Ѿ�� ����
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
		String kakao = request.getParameter("kakao"); //open kakaotalk
		int team = Integer.parseInt(request.getParameter("team")); //1�̸� �����, 0�̸� ���ΰ��
		int master = 1;	//���忩��
		int heart = 0;	//���ƿ� ��
		int attend_max = Integer.parseInt(request.getParameter("attend")); //�ִ� �����ο� ��
		int attend_min = Integer.parseInt(request.getParameter("min"));
		int close = 0;	//0�̸� �� ���X, 1�̸� �� ���O.
		Connection conn = null;
		Statement stmt = null;
		
		try {
			if( attend_max == 0 || attend_max == 1) {
		         RequestDispatcher dispatcher = request.getRequestDispatcher("BoardInputFormFail.jsp"); 
		         dispatcher.forward(request, response);
		      }
		      else {   
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cukbm?serverTimezone=UTC", "root", "wjddms97");
			stmt = conn.createStatement();
			String command  = String.format("insert into boarddb(title, writer, date, content, heart, master, attend_max, close, attend_min, subject, team, kakao) values('%s', '%s', '%s', '%s', %s, %s, %s, %s, %s,'%s',%s,'%s');",
					title, writer, currentDT, content, heart, master, attend_max, close, attend_min, subject,team,kakao);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
				throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�.");
			else if(attend_max==0)
				throw new Exception("�����ο��� �����ϼ���.");
		      }
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
		
		response.sendRedirect("/cukbm/Board?SUBJECT="+subject+"&TEAM="+team);
	}
}
