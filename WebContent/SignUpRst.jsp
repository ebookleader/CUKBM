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
 				<p class="wc">회원가입을 환영합니다!</p>
 				<p>로그인후 다양한 스포츠 매칭을 찾아보세요</p>
 				</div>	
 				<br><br><br>
 				<a class="login" href="Login.jsp">Login</a>
 				<div class="no"> </div>
 			</c:when>
 			<c:otherwise>
 				<div class="tologin">
 				<p class="wc">아이디 중복으로 회원가입에 실패하였습니다.</p>
 				<p class="wc">다른 아이디를 사용해주세요.</p>
 				</div>	
 				<br><br><br>
 				<a class="login" href="Agreement.jsp">JOIN US</a>
 				<div class="no"> </div>
 			</c:otherwise>
 		</c:choose>	
</article>
</body>
</html>