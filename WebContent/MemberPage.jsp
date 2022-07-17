<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/memberpage.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>MEMBER PAGE</title>
<style>

</style>
</head>
<body>
	<section>
		<div class="logo">
  			<span>CUKBM</span><br> 	
  		</div>		
	</section>
<header>
  <nav>
    <c:choose>
		<c:when test="${sessionScope.LOGIN_ID == null }">
			<a href="CUKBM_FrontPage.jsp">HOME</a>
			<a href="Login.jsp">LOGIN</a>
			<a href="Agreement.jsp">JOINUS</a>
		</c:when>
		<c:otherwise>
			<a href="CUKBM_FrontPage.jsp">HOME</a>
			<a href="/cukbm/myPage">MYPAGE</a>
			<a href="/cukbm/msgReceive"><img src='img/icon/bell.png' width=30 height=30></a>
			<a href="/cukbm/logout">LOGOUT</a>		
		</c:otherwise>
	</c:choose>		
  </nav>
</header>
<article>
		<div>
		<br><br>
		<div class="out">		
		<h3>MEMBER PROFILE</h3>
		<hr style="margin-left: -200px; width:600px;"><br>
		<div class="inner">
			<img src="${photo}" width="200" height="200"><br>
			<br>
			<table class="myinfo">
				<tr>
					<td class="tag">ID</td><td>${id}</td>
				</tr>
				<tr>
					<td class="tag">MAJOR</td><td>${major}</td>
				</tr>
				
				<tr>
					<td class="tag">AGE</td><td>${age}살</td>
				</tr>
				<tr>
					<td class="tag">PHONE</td><td>${phone}</td>
				</tr>
				<tr>
					<td class="tag">자기소개</td><td>${pr}</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
		<div class="et"></div>	
</article>
</body>
</html>