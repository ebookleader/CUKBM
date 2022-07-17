<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/freeitemview.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>�Խñ� �б�</title>
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
        <li><a href="/cukbm/Board?SUBJECT=soccer&TEAM=0">1:1 ���</a></li>
        <li><a href="/cukbm/Board?SUBJECT=soccer&TEAM=1">�����</a></li>
        <li class="nav-header">BASKETBALL</li>
        <li><a href="/cukbm/Board?SUBJECT=basketball&TEAM=0">1:1 ���</a></li>
        <li><a href="/cukbm/Board?SUBJECT=basketball&TEAM=1">�����</a></li>
        <li class="nav-header">TABLE TENNIS</li>
        <li><a href="/cukbm/Board?SUBJECT=tabletennis&TEAM=0">1:1 ���</a></li>
        <li><a href="/cukbm/Board?SUBJECT=tabletennis&TEAM=1">�����</a></li>
        <li class="nav-header">ESPORTS</li>
        <li><a href="/cukbm/Board?SUBJECT=esports&TEAM=0">1:1 ���</a></li>
        <li><a href="/cukbm/Board?SUBJECT=esports&TEAM=1">�����</a></li>
        <li class="nav-header">BADMINTON</li>
        <li><a href="/cukbm/Board?SUBJECT=badminton&TEAM=0">1:1 ���</a></li>
        <li><a href="/cukbm/Board?SUBJECT=badminton&TEAM=1">�����</a></li>
        <li class="nav-header">FREE</li>
         <li><a href="/cukbm/freeBoard?SUBJECT=free">�����Խ���</a></li>
      </ul>
    </aside>
    
    <!--Body content-->
    <section class="well span9 ">
      <h2><%=request.getParameter("SUBJECT") %> �Խ���</h2>
      	<br>
		<table class="main_content">
		<tr><td class="first">����</td><td class="second">${boardItem.title}</td></tr>
		<tr><td class="first">�ۼ���</td><td class="second">${boardItem.writer}</td></tr>
		<tr><td class="first">�ۼ���</td><td class="second">${boardItem.date}</td></tr>
		<tr><td colspan='2' class="third">${boardItem.content}</td></tr>
		</table>
		<br><br>
    </section>  
  </div>
</div>
</body>
</html>