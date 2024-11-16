<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Sharing</title>
<link href="css/about.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
<link href="css/about.css" rel="stylesheet" type="text/css">
</head>

<body>
<header>
  <div id="logo">
		<a href="main1.jsp"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
	<div class="up-menu">|<a href="main1.jsp" target=_parent>&nbsp;Home&nbsp;</a></div>
	<div class="up-menu">|<a href="Logout.jsp">&nbsp;로그아웃&nbsp;</a></div>
	<div class="up-menu">|<a href="mypage_main.jsp">&nbsp;MY PAGE&nbsp;</a></div>
	<div class="up-menu">|<a href="inCart.jsp">&nbsp;장바구니&nbsp;</a></div>
<div class="up-menu"><a href="InsertMember.jsp">&nbsp;회원가입&nbsp;</a></div>
  <!--메뉴-->
  <div id="menu">
		<ul>
			<li><a href="about.jsp">ABOUT</a></li>
			<li><a href="viewProduct.jsp?prdctg=category1">스튜디오</a></li>
			<li><a href="viewProduct.jsp?prdctg=category2">파티룸</a></li>
			<li><a href="viewProduct.jsp?prdctg=category3">회의실</a></li>
		</ul>
	</div>
</header>
<div id="main">
  <h1>About "Sharing"</h1>
  <div class="about-image1">
		<img src="images/about1.jpg" alt=""/>
	</div>
  <div class="about-box">
		<div class="about-text1">
			“누구나 원하는 곳에서 우리다운 시간을”
		</div>
		<div class="about-text2">
			누구나 원하는 공간에서 우리다운 시간을 보낼 수 있도록<br>
			나아가 모두에게 더 머물기 좋은 도시가 되도록<br>
			좋은 공간을 연결하고자 공간을 쉐어링하는 쉐어링입니다.
		</div>
	</div>
	<div class="about-image2">
    <img src="images/about2.jpg" alt=""/> </div>
	<div class="about-box">
		<div class="about-text1">
			“당신이 원하는 공간을 찾아보세요”
		</div>
		<div class="about-text2">
			파티룸부터 촬영 스튜디오와 워킹오피스까지<br>
			다양한 공간을 한눈에 둘러보고<br>
			내게 딱 맞는 라이프스타일을 경험해보세요.
		</div>
	</div>
</div>
<footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_index.jsp">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.</footer>
</body>
</html>
