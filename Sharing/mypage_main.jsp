<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>관리자 로그인 결과</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
</head>

 <body>
 <header>
  <div id="logo">
		<a href="main1.jsp"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
		<div class="up-menu">|<a href="main1.jsp">&nbsp;Home&nbsp;</a></div>
	<div class="up-menu">|<a href="Login.jsp">&nbsp;로그인&nbsp;</a></div>
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
 <center>

<%
	String id = (String)session.getAttribute("sid");      

 %>
     <br><br><br>
     <p><img src="./images/logo.png">
	  <font size=3>
      <table  cellpadding="5" style="font-size:10pt">
	  <tr><td ><font size="5"><strong><회원정보></strong></font></td><tr>
	  <tr><td><a href="updateMember.jsp?id=<%=id%>"><img src="images/updatemember.png"></a></td></tr>
	  <tr><td><a href="deleteMember1.jsp?id=<%=id%>"><img src="images/deletemember.png"></a></td></tr>
	  <tr><td><font size="5"><strong><주문정보></strong></font></td></tr>
	  <tr><td><a href="selectAllorder.jsp?id=<%=id%>"><img src="images/1.png"></a></td></tr>
	  </table>
	  <br><br><br>
	
</center>
<footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_index.jsp">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.
</footer>
</body>
</html>