<!doctype html>
<html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<head>
<meta charset="UTF-8">
<title>Sharing</title>
<link href="css/product.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
</head>

<body>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team"; 
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 

	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	request.setCharacterEncoding("UTF-8");

	String prdctg = request.getParameter("prdctg");  

	String jsql = "select * from goods where prdctg = ?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, prdctg);

	ResultSet rs = pstmt.executeQuery();
%>
<header>
  <div id="logo">
		<a href="main1.html"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
	<div class="up-menu">|<a href="main1.html">&nbsp;Home&nbsp;</a></div>
	<div class="up-menu">|<a href="Login.jsp">&nbsp;로그인&nbsp;</a></div>
	<div class="up-menu">|<a href="#">&nbsp;MY PAGE&nbsp;</a></div>
	<div class="up-menu"><a href="join.html">&nbsp;회원가입&nbsp;</a></div>
  <!--메뉴-->
  <div id="menu">
		<ul>
			<li><a href="about.html">ABOUT</a></li>
			<li><a href="studio.html">스튜디오</a></li>
			<li><a href="partyroom.html">파티룸</a></li>
			<li><a href="meeting.html">회의실</a></li>
		</ul>
	</div>
</header>
<%
	String category_name;

    if (prdctg.equals("category1"))
		category_name = "스튜디오";
	else if (prdctg.equals("category2"))
		category_name = "파티룸";
	else if (prdctg.equals("category3"))
		category_name = "회의실";
	else
		category_name = "";
%>
	<%
		while(rs.next()) {
			String no = rs.getString("prdno");
			String name =  rs.getString("prdname");	
			String  description =  rs.getString("prddescription");
			String  place = rs.getString("prdplace");
			String price =  rs.getString("prdprice");
%>
<div id="main">
	<div class="title">
	<h1>스튜디오</h1>
	</div>
	<div class="product-container">
    <div class="product-icon">
	<a href="viewDetailProduct.jsp?prdno=<%=no%>">
	  <div class="product-image">
	    <img src="images/<%=no%>.jpg" width="350" height="200" alt=""/> </a></div>
	  <div class="product-box">
		<div class="product-text1">
			<a href="viewDetailProduct.jsp?prdno=<%=no%>"><%=name%><a>
		  </div>
		  <div class="product-text2">
			 <%=place%>
		  </div>
			  <span class="product-text3"><%=price%> </span>
			  <span class="product-text4">원/시간</span>
		</div>2
</div>
 <%
		}  
%>
<%
} catch (Exception e) {
        	out.println(e);
}
%>
<footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="#">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.</footer>
</body>
</html>