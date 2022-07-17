
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mypage.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>MYPAGE</title>
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
		<h3>MY PAGE</h3>
		<hr style="margin-left: -200px; width:600px;"><br>
		<div class="inner">
			<img src="${sessionScope.LOGIN_IMG}" width="200" height="200"><br>
			<br>
			<table class="myinfo">
				<tr>
					<td class="tag">ID</td><td>${id}</td>
				</tr>
				<tr>
					<td class="tag">MAJOR</td><td>${major}</td>
				</tr>
				
				<tr>
					<td class="tag">AGE</td><td>${age}��</td>
				</tr>
				<tr>
					<td class="tag">PHONE</td><td>${phone}</td>
				</tr>
				<tr>
					<td class="tag">�ڱ�Ұ�</td><td>${pr}</td>
				</tr>
			</table>
			
			<br><hr style="width:600px; margin-left: -200px"><br>
			<div class="like_title">���ƿ� &#x1f497; �Խñ�</div>
			<table class="like">
				<tr class="first">
					<td class="ca">ī�װ�</td>
					<td class="no">�۹�ȣ</td>
					<td class="tt">����</td>
					<td class="delete"></td>
				</tr>
				<c:if test="${(Board_List.listSize-1)>=0}">
					<c:forEach var="cnt" begin="0" end="${Board_List.listSize-1}">
     			 	<tr>
     			 		<td class="ca">${Board_List.subject[cnt]}</td>
         				<td class="no">${Board_List.seqNo[cnt]}</td>
         				<td class="tt"><a href="BoardItem?SEQ_NO=${Board_List.seqNo[cnt]}&SUBJECT=${Board_List.subject[cnt]}">${Board_List.title[cnt]}</a></td>
						<td class="delete"><a href="likeDelete?SEQ_NO=${Board_List.seqNo[cnt]}&ID=${id}">����</a></td>
					</tr>
	 				</c:forEach>
				</c:if>	
			</table>
			<c:if test="${!Board_List.lastPage}">
   			<div class="next_page">
   				<a href='myPage?LAST_SEQ_NO=${param.LAST_SEQ_NO}'>����������</a>
   			</div>   
			</c:if>			
		</div>
	</div>
	</div>
		<div class="et"></div>	
</article>
</body>
</html>