<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/boarditemview.css" type="text/css" rel="stylesheet">
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
      	
      	<table class="button"> 
	  		<tr>
	  		<c:choose>
	  			<c:when test="${param.enterbt==0 && param.force==0}">
	  				<c:choose>
						<c:when test="${param.ENTER==1}">
						<td>
	  					<form class="submit" action="/cukbm/AttendCancel?seqno=${param.SEQ_NO}" method=post>
							<input type='submit' value='�������'>
	  					</form>
	  					</td>
						</c:when>
						<c:otherwise>
						<td>
	  					<form class="submit" action="/cukbm/Attend?seqno=${param.SEQ_NO}" method=post>
							<input type='submit' value='������û'>
	  					</form>
	  					</td>
						</c:otherwise>
					</c:choose>	
				</c:when>
				<c:when test="${param.enterbt==1 && param.force==0}">
					<td class="enterexit">������ ������ ���Դϴ�</td>
				</c:when>
				<c:when test="${param.enterbt==1 && param.force==1 }">
					<td class="enterexit">����</td><td></td><td class="enterexit">���� ����</td>
				</c:when>
				<c:otherwise>
					<td class="enterexit">����</td><td></td><td class="enterexit">���� ������</td>
				</c:otherwise>
			</c:choose>		
	  			<td>
	  				<div>
	  				<a  href="#" onClick='window.open("/cukbm/like?seqno=${param.SEQ_NO}","like_list","width=400,height=150").focus()'>���ƿ�</a> 
	  				</div>
	  			</td>
	  			<c:choose>
	  			<c:when test="${param.block==1}">
	  			<td>
	  				<div>
	  				<a href="/cukbm/block?seqno=${param.SEQ_NO}">��Ī Ȯ��</a>
	  				</div>
	  			</td>
	  			</c:when>	  			
	  			</c:choose>
	  		</tr>
	  	</table>
      	<br>
      	
		<table class="main_content">
		<tr><td class="first">����</td><td class="second">${boardItem.title}</td></tr>
		<tr><td class="first">�ۼ���</td><td class="second">${boardItem.writer}</td></tr>
		<tr><td class="first">�ۼ���</td><td class="second">${boardItem.date}</td></tr>
		<tr><td colspan='2' class="third">${boardItem.content}</td></tr>
		</table>
		<br><br>
		<table class="member">
			<tr><td class="member_first">��Ī ������<br><div class="infoview">[������ ���̵� Ŭ���� ������ ������ �� �� �ֽ��ϴ�]</div></td></tr>			
			<c:if test="${boardItem.attend_min>1}">		
			<c:forEach var="cnt" begin="0" end="${boardItem.attend_min-2}">
			<tr>
				<td class="member_second">
					<img src="${IDVO.photolist[cnt]}" width="150" height="150"><br>
					<br>
					<a class="member_a" href="/cukbm/memberPage?id=${IDVO.idlist[cnt]}">${IDVO.idlist[cnt]} ��</a>
					<c:choose>
						<c:when test="${param.force==1 && param.close==0}">
							<a class="memberexit" href="forcedExit?ID=${IDVO.idlist[cnt]}&seqno=${param.SEQ_NO}">����</a>	
						</c:when>
					</c:choose>	
				</td>
				</tr>
				</c:forEach>
			</c:if>			
		</table>
    </section>  
  </div>
</div>
</body>
</html>