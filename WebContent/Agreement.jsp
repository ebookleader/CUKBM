<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/agreement.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>AgreementForm</title>
<script type="text/javascript">
	function check(){
		var req = document.form.req.checked;
		var num=0;
		if(req==true) num=1;
		if(num==1)
			document.form.submit();
		else
			alert("�̿� ����� �����ϼž� �մϴ�.")
	}
	function nocheck(){
		alert("�������� ������ �����Ͻ� �� �����ϴ�.")
		location.href="Agreement.jsp;"
	}
</script>
</head>
<body>
	<section>
		<div class="logo">
  			<span>CUKBM</span><br> 	
  		</div>		
	</section>
<header>
  <nav>
    <a href="CUKBM_FrontPage.jsp">HOME</a>
	<a href="Login.jsp">LOGIN</a>
	<a href="Agreement.jsp">JOINUS</a>
  </nav>
</header>
<article>
	<div class="title"><h2>Join Member</h2></div>
	<div class=join>
	<form action="SignUp.jsp" method="post" name="form">
		<table>
			 <tfoot>
			 	 <tr>
			 	 	<td>
			 	 		<input type="checkbox" name="req"> ��ü ����� �����մϴ�.<br><br>
			 	 		<input type="button" value="����" onclick="check()"/>&nbsp;&nbsp;&nbsp;
   		 				<input type="button" value="���Ǿ���" onclick="nocheck()"/>
			 	 	</td>
			 	 </tr>	 
			 	 </tfoot>
			<tbody>
			 <tr><th class="ft">[�ʼ�] �̿� ��� ����</th></tr>
			 <tr>
			 	<td>
			 	<p class="pinfo">
			 	 �� ȸ�������� �� ����Ʈ�� ��� ���ؼ��� ���˴ϴ�.<br>
			 	 �� �� ����Ʈ�� ���� ��� �����ϴ� ȸ���� Ż�� ó���մϴ�.<br>
			 	 </p>
			 	</td>
			 </tr>
			 <tr><th class="ft">[�ʼ�] �������� ���� �� �̿� ����</th></tr>
			 <tr>
			 	<td>
			 	 <p class="pinfo">
			 	 �� ���������� ���� �� �̿����<br>
				�� ����Ʈ�� ������ ���������� ������ ������ ���� Ȱ���մϴ�.<br>
				�� ���� ������ ���� ��� ����<br>
				�� ȸ�� ����<br>
				ȸ���� ���� �̿뿡 ���� ����Ȯ�� , ���� �ĺ� , ����Ȯ�� , �������� ����<br>
				�� ������ �� ���� Ȱ��<br>
				���� �� �ľ� �Ǵ� ȸ���� ���� �̿뿡 ���� ���<br><br>
				�� ���������� ���� �� �̿�Ⱓ<br>
				ȸ��� �������� ���� �� �̿������ �޼��� �Ŀ��� ���� ���� �ش� ������ ��ü ���� �ı��մϴ�.<br><br>
				�� ���������� ��3�� ������ ���� ����<br>
				�� ����Ʈ�� ������ü�� ����, ������ Ư���� ���� �� �������� ��ȣ�� ��17�� �� ��18���� �ش��ϴ� ��쿡�� ���������� ��3�ڿ��� �����մϴ�.<br>
				o �����޴� ���� �������� �̿����<br>
				�α���ID, �������, �޴���ȭ��ȣ, ���� �̿� ���, �а�, ����
			 	 </p><br>		 	 		 	 
			 	</td>
			 </tr>	
			</tbody>
		</table>	
	</form>
	</div>
		<div class="et"></div>	
</article>
</body>
</html>