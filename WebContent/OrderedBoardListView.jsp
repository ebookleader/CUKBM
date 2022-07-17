<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/order.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>�Խ���</title>
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
      <div class="write">
      	<c:choose>
		<c:when test="${param.TEAM==0}">
		<a href="BoardInputForm.jsp">�۾���</a>
		</c:when>
		<c:otherwise>
			<a href="BoardInputFormTeam.jsp">�۾���</a>	
		</c:otherwise>
	</c:choose>
      </div>   
      <br> 
    <a class="a_heart" title="����  �α�Խñ� 30���� Ȯ���� �� �ֽ��ϴ�" href="/cukbm/orderedBoard?SUBJECT=${param.SUBJECT}&TEAM=${param.TEAM}">&#9873;�α� �Խñ�</a>
     <a class="a_new" href="/cukbm/Board?SUBJECT=${param.SUBJECT}&TEAM=${param.TEAM}">&#9872;�ֽż�</a>
     <br>
	<table border=1 class="content_list">
	<tr class="clist_title">
		<td width=60>�۹�ȣ</td>
		<td width=300>����</td>
		<td width=80>�ۼ���</td>
		<td width=100>�ۼ�����</td>
		<td width=50>&#x1f493;</td>
		<td width=90>���������ο�</td>
		<td width=90>�ִ������ο�</td>
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