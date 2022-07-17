<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/loginresult.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>WELCOME</title>
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
	<div class="login">		
			<c:choose>
				<c:when test = "${param.LOGIN_RESULT=='SUCCESS'}">	
				<br><br>
				<table class="welcome">
					<tr><td class="text1">WELCOME!</td></tr>
					<tr><td><img src="${sessionScope.LOGIN_IMG}" width="180" height="180"></td></tr>
					<tr><td class="text2">${sessionScope.LOGIN_ID}님</td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td class="info_go"><a href="/cukbm/myPage">GO TO MYPAGE</a></td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td class="info_go"><a href="CUKBM_FrontPage.jsp">HOME</a></td></tr>
				</table>		
				<br><br>	
				</c:when>
				<c:otherwise>
					<br><br><br><br>
						<div class="info_fail">
						로그인에 실패했습니다 <br><br>
						아이디와 패스워드를 체크하세요!
						</div><br>
						<div class="info_inner">
							<div class="info_go_fail">
							<a href="Login.jsp">LOGIN</a>
							</div><br>
							<div class="info_go_fail">
							<a href="Agreement.jsp">JOIN MEMBER</a>
							</div>
						</div>
				</c:otherwise>
			</c:choose>
		</div>	
		<div class="et"></div>	
</article>
</body>
</html>