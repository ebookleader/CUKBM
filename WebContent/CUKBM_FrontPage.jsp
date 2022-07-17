<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="css/main.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Welcome to CUKBM</title>
<script>
	function hover1(element) {
	  element.setAttribute('src', 'img/front/liverpool.jpg');
	}

	function unhover1(element) {
	  element.setAttribute('src', 'img/front/soccer.jpg');
	}
	function hover2(element) {
		  element.setAttribute('src', 'img/front/nba.jpg');
		}

	function unhover2(element) {
		  element.setAttribute('src', 'img/front/basketball.jpg');
		}
	function hover3(element) {
			  element.setAttribute('src', 'img/front/ttcrew.PNG');
			}

	function unhover3(element) {
			  element.setAttribute('src', 'img/front/tabletennis.jpg');
			}
	function hover4(element) {
		  element.setAttribute('src', 'img/front/esports.jpg');
		}

	function unhover4(element) {
		  element.setAttribute('src', 'img/front/lol.jpg');
		}
	function hover5(element) {
		  element.setAttribute('src', 'img/front/badminton3.jpg');
		}
	function unhover5(element) {
		  element.setAttribute('src', 'img/front/badminton.jpg');
		}
</script>
</head>
<body>
	<section>
		<div class="logo">
			<img src="img/logo.png" width="300" height="210"/><br>
  			<span>BIG MATCH</span><br> 	
  		</div><br><br>
  		<hr><br><hr>
  		<div class="logo_start">
  			<a href="#main">START</a>
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
<article id="main">
	<h1 class="tt">Find Players!</h1>
  <div class="">  
  <article class="mpic">
    <img src="img/front/soccer.jpg" width="480px" height="330" onmouseover="hover1(this);" onmouseout="unhover1(this);">
    <div class="text">
      <h3>SOCCER</h3>
      <div class="go"><a href="/cukbm/Board?SUBJECT=soccer&TEAM=0">1:1 MATCH</a></div>
      <div class="go"><a href="/cukbm/Board?SUBJECT=soccer&TEAM=1">TEAM MATCH</a></div>
    </div>
  </article>
  
  <article class="mpic">
    <img src="img/front/basketball.jpg" width="480px" height="330" onmouseover="hover2(this);" onmouseout="unhover2(this);">
    <div class="text">
      <h3>BASKETBALL</h3>
      <div class="go"><a href="/cukbm/Board?SUBJECT=basketball&TEAM=0">1:1 MATCH</a></div>
      <div class="go"><a href="/cukbm/Board?SUBJECT=basketball&TEAM=1">TEAM MATCH</a></div>
    </div>
  </article>
  
  <article class="mpic">
     <img src="img/front/tabletennis.jpg" width="480px" height="330" onmouseover="hover3(this);" onmouseout="unhover3(this);">
    <div class="text">
      <h3>TABLE TENNIS</h3>
      <div class="go"><a href="/cukbm/Board?SUBJECT=tabletennis&TEAM=0">1:1 MATCH</a></div>
      <div class="go"><a href="/cukbm/Board?SUBJECT=tabletennis&TEAM=1">TEAM MATCH</a></div>
    </div>
  </article>
  
  <article class="mpic">
     <img src="img/front/lol.jpg" width="480px" height="330" onmouseover="hover4(this);" onmouseout="unhover4(this);">
    <div class="text">
      <h3>ESPORTS</h3>
      <div class="go"><a href="/cukbm/Board?SUBJECT=esports&TEAM=0">1:1 MATCH</a></div>
      <div class="go"><a href="/cukbm/Board?SUBJECT=esports&TEAM=1">TEAM MATCH</a></div>
    </div>
  </article>
  
  <article class="mpic">
     <img src="img/front/badminton.jpg" width="480px" height="330" onmouseover="hover5(this);" onmouseout="unhover5(this);">
    <div class="text">
      <h3>BADMINTON</h3>
      <div class="go"><a href="/cukbm/Board?SUBJECT=badminton&TEAM=0">1:1 MATCH</a></div>
      <div class="go"><a href="/cukbm/Board?SUBJECT=badminton&TEAM=1">TEAM MATCH</a></div>
    </div>
  </article>
  
	<article class="mpic">
     <img src="img/front/free3.jpg" width="480px" height="330">
    <div class="text">
      <h3>자유게시판</h3>
      <div class="go"><a href="/cukbm/freeBoard?SUBJECT=free">Lets' Start!</a></div>
    </div>
  </article>
  </div>
</article>

</body>
</html>