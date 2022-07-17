<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/order.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>게시판</title>
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
      <h2><%=request.getParameter("SUBJECT") %> 게시판</h2>
      <div class="write">
      	<c:choose>
		<c:when test="${param.TEAM==0}">
		<a href="BoardInputForm.jsp">글쓰기</a>
		</c:when>
		<c:otherwise>
			<a href="BoardInputFormTeam.jsp">글쓰기</a>	
		</c:otherwise>
	</c:choose>
      </div>   
      <br> 
    <a class="a_heart" title="상위  인기게시글 30개를 확인할 수 있습니다" href="/cukbm/orderedBoard?SUBJECT=${param.SUBJECT}&TEAM=${param.TEAM}">&#9873;인기 게시글</a>
     <a class="a_new" href="/cukbm/Board?SUBJECT=${param.SUBJECT}&TEAM=${param.TEAM}">&#9872;최신순</a>
     <br>
	<table border=1 class="content_list">
	<tr class="clist_title">
		<td width=60>글번호</td>
		<td width=300>제목</td>
		<td width=80>작성자</td>
		<td width=100>작성일자</td>
		<td width=50>&#x1f493;</td>
		<td width=90>현재참여인원</td>
		<td width=90>최대참여인원</td>
	</tr>
	<c:if test="${(Board_List.listSize-1)>=0}">
		<c:forEach var="cnt" begin="0" end="${Board_List.listSize-1}">
      <tr>
         <td>${Board_List.seqNo[cnt]}</td>
         <td><a href='BoardItem?SEQ_NO=${Board_List.seqNo[cnt]}&SUBJECT=${param.SUBJECT}'>${Board_List.title[cnt]}</a></td>
         <td>${Board_List.writer[cnt]}</td>
         <td>${Board_List.date[cnt]}</td>
		 <td>${Board_List.heart[cnt]}</td>		 
		 <td>${Board_List.attend_min[cnt]}</td>
		 <td>${Board_List.attend_max[cnt]}</td>
		</tr>
	 </c:forEach>
	</c:if>	
</table>
    </section>
    
  </div>
</div>

</body>
</html>