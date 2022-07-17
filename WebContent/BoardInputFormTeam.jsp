<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/boardinputformteam.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>게시판 - 팀</title>
</head>
<body>
	<div class="logo">
  			<span>CUKBM</span><br> 	
   </div>	
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
	<div class="container" id="main">
  <div id="wrap" class="row-fluid wrap">
    <!--Sidebar content-->
    <aside class="well span3 oc" id="side-menu" role="navigation">
      <ul class="nav nav-list">
        <li class="nav-header">SOCCER</li>
        <li><a href="/cukbm/Board?SUBJECT=soccer&TEAM=0">1:1 경기</a></li>
        <li><a href="/cukbm/Board?SUBJECT=soccer&TEAM=1">팀경기</a></li>
        <li class="nav-header">BASKETBALL</li>
        <li><a href="/cukbm/Board?SUBJECT=basketball&TEAM=0">1:1 경기</a></li>
        <li><a href="/cukbm/Board?SUBJECT=basketball&TEAM=1">팀경기</a></li>
        <li class="nav-header">TABLE TENNIS</li>
        <li><a href="/cukbm/Board?SUBJECT=tabletennis&TEAM=0">1:1 경기</a></li>
        <li><a href="/cukbm/Board?SUBJECT=tabletennis&TEAM=1">팀경기</a></li>
        <li class="nav-header">ESPORTS</li>
        <li><a href="/cukbm/Board?SUBJECT=esports&TEAM=0">1:1 경기</a></li>
        <li><a href="/cukbm/Board?SUBJECT=esports&TEAM=1">팀경기</a></li>
        <li class="nav-header">BADMINTON</li>
        <li><a href="/cukbm/Board?SUBJECT=badminton&TEAM=0">1:1 경기</a></li>
        <li><a href="/cukbm/Board?SUBJECT=badminton&TEAM=1">팀경기</a></li>
        <li class="nav-header">FREE</li>
        <li><a href="/cukbm/freeBoard?SUBJECT=free">자유게시판</a></li>
      </ul>
    </aside>
    
    <!--Body content-->
    <section class="well span9 ">
      <div class="write">MATCH</div><br>
      <form name="write" action=BoardWriter method=post>
      <table class="main">
      <tr><td class="tag">제목</td><td class="ct"><input type=text name=title required></td></tr>
      <tr><td class="tag">작성자</td><td class="ct">${sessionScope.LOGIN_ID}님</td></tr>
      <tr>
      	<td class="tag">카테고리</td>
      	<td class="ct">
      		<select name="subject" size="1">
                     <option value="soccer">축구 게시판</option>
                     <option value="basketball">농구 게시판</option>
                     <option value="tabletennis">탁구 게시판</option>
                     <option value="esports">e-sports 게시판</option>
                     <option value="badminton">배드민턴 게시판</option>                   
                     <option value="free">자유 게시판</option>
            </select><br>
      	</td>
      </tr>
      <tr><td class="tag">참여 가능 인원</td><td class="ct"><input type=number name=attend min=0 max=50 size=3 required>명</td></tr>
      <tr><td class="tag">오픈카카오톡 주소</td><td class="ct"><input type=text name=kakao required></td></tr>
      <tr><td colspan='2' class="tagp">(매칭 확정 후 참가자들에게 오픈카카오톡 주소가 전송됩니다)</td></tr>
      <tr><td></td><td></td></tr>
      <tr><td colspan='2' class="tarea"><textarea cols=300= rows=20 name=content required></textarea></td></tr>
	  </table>
      <input type=hidden name=team value=1>
      <input type=hidden name=min value=1>
      <br>
      <div class="input_wrap">
      	<input type=submit value='저장'>      
      </div>    
       </form>   
     </section> 
  </div>
</div>
</body>
</html>