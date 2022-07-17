<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/signup.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>SingUpForm</title>
<script type="text/javascript">
	function regi(){
		if(document.join.id.value==''){
			alert("���̵� �Է��ϼ���");
			document.join.id.focus();
		}
		else if(document.join.password.value==''){
			alert("��й�ȣ�� �Է��ϼ���");
			document.join.password.focus();
		}
		else if(document.join.major.value==''){
			alert("������ �Է��ϼ���");
			document.join.major.focus();
		}
		else if(document.join.age.value==''){
			alert("���̸� �Է��ϼ���");
			document.join.age.focus();
		}
		else if(document.join.phone.value==''){
			alert("�ڵ��� ��ȣ�� �Է��ϼ���");
			document.join.phone.focus();
		}
		else if(document.join.pr.value==''){
			alert("�ڱ�Ұ��� �Է��ϼ���");
			document.join.pr.focus();
		}
		else if(!(join.photo[0].checked||join.photo[2].checked||join.photo[3].checked
				||join.photo[4].checked||join.photo[5].checked||join.photo[6].checked
				||join.photo[7].checked||join.photo[8].checked||join.photo[1].checked)){
			alert("������ �����ϼ���");
		}		
		else{
			document.join.submit();
			return true;
		}
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
	<form name="join" action="/cukbm/signUp" method="post" onSubmit="regi();return false">
		<table class="first">
			<tbody>
				<tr><td class="tag">���̵�</td>
				<td class="t"><input type=text id="id" name="id" maxlength=16><span class="max">(���� ��ҹ���/���� �ִ� 16��)</span><br></td></tr>
				<tr><td class="tag">�н�����</td><td class="t"><input type=password name="password" maxlength=16><span class="max">(�ִ� 16��)</span></td></tr>
				<tr>
					<td class="tag">�а�</td>
					<td class="t">
						<select name="major" size="1">
							<option value="�濵�к�">�濵�к�</option>
							<option value="�����к�">�����к�</option>
							<option value="���ƽþƾ�ȭ�к�">���ƽþƾ�ȭ�к�</option>
							<option value="�̵�����������а�">�̵�����������а�</option>
							<option value="�������к�">�������к�</option>
							<option value="��ȸ���к�">��ȸ���к�</option>
							<option value="����ȯ���к�">����ȯ���к�</option>
							<option value="��Ȱ���к�">��Ȱ���к�</option>
							<option value="������к�">������к�</option>
							<option value="���ǰ�">���ǰ�</option>
							<option value="�ι��к�">�ι��к�</option>
							<option value="�ڿ����к�">�ڿ����к�</option>
							<option value="����������ڰ��к�">����������ڰ��к�</option>
							<option value="�����а�">�����а�</option>
							<option value="��ǻ���������к�">��ǻ���������к�</option>
							<option value="Ư��������">Ư��������</option>
							<option value="�������ȭ�а�">�������ȭ�а�</option>
						</select>
					</td>
				</tr>
				<tr><td class="tag">����</td><td class="t"><input type=text name="age" maxlength=2><span class="max">��</span></td></tr>
				<tr><td class="tag">�ڵ��� ��ȣ</td><td class="t"><input type=text name="phone" maxlength=13 placeholder="010-xxxx-xxxx-"><span class="max">('-'�� ������ �Է����ּ���)</span></td></tr>
				<tr><td class="tag">�ڱ�Ұ�</td><td class="t"><textarea cols=40 rows=10 name=pr></textarea></td></tr>
				<tr><td colspan='2'><span class="maxt">(�ٸ�����ڵ��� ������ �� �ִ� ���Դϴ�. �����ϰ� �ۼ����ּ���.)</span></td></tr>
			</tbody>
		</table>
		<br><br>
		<table class="second">
			<tbody>
				<tr><td class="t_text"><div>������ ������ �����ϼ���</div></td></tr>
				<tr>
					<td class="t_pic">
						<img src="img/icon/man1.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man1">
						<img src="img/icon/man2.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man2">
						<img src="img/icon/man3.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man3"><br>
						<img src="img/icon/man4.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man4">
						<img src="img/icon/man5.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man5">
						<img src="img/icon/man6.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man6"><br>
						<img src="img/icon/man7.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man7">
						<img src="img/icon/man8.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man8">
						<img src="img/icon/man9.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man9"><br>
					</td>
				</tr>
			</tbody>
		</table>
		<br><br><br>
		<input type="submit" value="ȸ������">	
		</form>		
	</div>
		<div class="et"></div>	
</article>
</body>
</html>
