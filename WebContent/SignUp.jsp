<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/signup.css" type="text/css" rel="stylesheet">
<meta charset="EUC-KR">
<title>SingUpForm</title>
<script type="text/javascript">
	function regi(){
		if(document.join.id.value==''){
			alert("아이디를 입력하세요");
			document.join.id.focus();
		}
		else if(document.join.password.value==''){
			alert("비밀번호를 입력하세요");
			document.join.password.focus();
		}
		else if(document.join.major.value==''){
			alert("전공을 입력하세요");
			document.join.major.focus();
		}
		else if(document.join.age.value==''){
			alert("나이를 입력하세요");
			document.join.age.focus();
		}
		else if(document.join.phone.value==''){
			alert("핸드폰 번호를 입력하세요");
			document.join.phone.focus();
		}
		else if(document.join.pr.value==''){
			alert("자기소개를 입력하세요");
			document.join.pr.focus();
		}
		else if(!(join.photo[0].checked||join.photo[2].checked||join.photo[3].checked
				||join.photo[4].checked||join.photo[5].checked||join.photo[6].checked
				||join.photo[7].checked||join.photo[8].checked||join.photo[1].checked)){
			alert("사진을 선택하세요");
		}		
		else{
			document.join.submit();
			return true;
		}
	}
</script>
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
	<div class="title"><h2>Join Member</h2></div>
	<div class=join>
	<form name="join" action="/cukbm/signUp" method="post" onSubmit="regi();return false">
		<table class="first">
			<tbody>
				<tr><td class="tag">아이디</td>
				<td class="t"><input type=text id="id" name="id" maxlength=16><span class="max">(영문 대소문자/숫자 최대 16자)</span><br></td></tr>
				<tr><td class="tag">패스워드</td><td class="t"><input type=password name="password" maxlength=16><span class="max">(최대 16자)</span></td></tr>
				<tr>
					<td class="tag">학과</td>
					<td class="t">
						<select name="major" size="1">
							<option value="경영학부">경영학부</option>
							<option value="국제학부">국제학부</option>
							<option value="동아시아언어문화학부">동아시아언어문화학부</option>
							<option value="미디어기술콘텐츠학과">미디어기술콘텐츠학과</option>
							<option value="법정경학부">법정경학부</option>
							<option value="사회과학부">사회과학부</option>
							<option value="생명환경학부">생명환경학부</option>
							<option value="생활과학부">생활과학부</option>
							<option value="영어영문학부">영어영문학부</option>
							<option value="음악과">음악과</option>
							<option value="인문학부">인문학부</option>
							<option value="자연과학부">자연과학부</option>
							<option value="정보통신전자공학부">정보통신전자공학부</option>
							<option value="종교학과">종교학과</option>
							<option value="컴퓨터정보공학부">컴퓨터정보공학부</option>
							<option value="특수교육과">특수교육과</option>
							<option value="프랑스어문화학과">프랑스어문화학과</option>
						</select>
					</td>
				</tr>
				<tr><td class="tag">나이</td><td class="t"><input type=text name="age" maxlength=2><span class="max">살</span></td></tr>
				<tr><td class="tag">핸드폰 번호</td><td class="t"><input type=text name="phone" maxlength=13 placeholder="010-xxxx-xxxx-"><span class="max">('-'를 포함해 입력해주세요)</span></td></tr>
				<tr><td class="tag">자기소개</td><td class="t"><textarea cols=40 rows=10 name=pr></textarea></td></tr>
				<tr><td colspan='2'><span class="maxt">(다른사용자들이 열람할 수 있는 글입니다. 신중하게 작성해주세요.)</span></td></tr>
			</tbody>
		</table>
		<br><br>
		<table class="second">
			<tbody>
				<tr><td class="t_text"><div>프로필 사진을 선택하세요</div></td></tr>
				<tr>
					<td class="t_pic">
						<img src="img/icon/man1.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man1">
						<img src="img/icon/man2.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man2">
						<img src="img/icon/man3.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man3"><br>
						<img src="img/icon/man4.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man4">
						<img src="img/icon/man5.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man5">
						<img src="img/icon/man6.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man6"><br>
						<img src="img/icon/man7.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man7">
						<img src="img/icon/man8.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man8">
						<img src="img/icon/man9.jpg" width="130" height="130">
						<input type="radio" name="photo" value="man9"><br>
					</td>
				</tr>
			</tbody>
		</table>
		<br><br><br>
		<input type="submit" value="회원가입">	
		</form>		
	</div>
		<div class="et"></div>	
</article>
</body>
</html>
