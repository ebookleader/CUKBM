<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/login.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Login</title>
</head>
<body>
	<section>
		<div class="logo">
  			<span>CUKBM</span><br> 	
  		</div>		
	</section>
<header>
  <nav>
    <a href="CUKBM_FrontPage.jsp">HOME</a>
	<a href="Login.jsp">LOGIN</a>
	<a href="Agreement.jsp">JOINUS</a>
  </nav>
</header>
<article>
	<div class="login">		
			<div class="login_text">ACCOUNT LOGIN</div>
			<form action="/cukbm/login" method=post>
				<div>
					<span>USERNAME</span><br>
					<input type="text" name=id size=12><br>
				</div>
				<div>
					<span>PASSWORD</span><br>
					<input type="password" name=password size=12><br>	
				</div>		
				<input type=submit value='LOGIN'>
				 	<a class="join" href="Agreement.jsp">JOIN MEMBER</a>				
			</form>	
		</div>	
		<div class="et"></div>	
</article>
</body>
</html>