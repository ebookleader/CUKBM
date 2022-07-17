<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/signupresult.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>SingUpResult</title>
</head>
<body>
	<section>
		<div class="logo">
  			<span>CUKBM</span><br> 	
  		</div>		
	</section>
<header>
  <nav>
  	<nav>
    <a href="CUKBM_FrontPage.jsp">HOME</a>
	<a href="Login.jsp">LOGIN</a>
	<a href="Agreement.jsp">JOINUS</a>
  </nav>							
  </nav>
</header>
<article>
 		<c:choose>
 			<c:when test="${param.result==1}">
 				<div class="tologin">
 				<p class="wc">ȸ�������� ȯ���մϴ�!</p>
 				<p>�α����� �پ��� ������ ��Ī�� ã�ƺ�����</p>
 				</div>	
 				<br><br><br>
 				<a class="login" href="Login.jsp">Login</a>
 				<div class="no"> </div>
 			</c:when>
 			<c:otherwise>
 				<div class="tologin">
 				<p class="wc">���̵� �ߺ����� ȸ�����Կ� �����Ͽ����ϴ�.</p>
 				<p class="wc">�ٸ� ���̵� ������ּ���.</p>
 				</div>	
 				<br><br><br>
 				<a class="login" href="Agreement.jsp">JOIN US</a>
 				<div class="no"> </div>
 			</c:otherwise>
 		</c:choose>	
</article>
</body>
</html>