<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>공간 테이블 내용 조회</title>

<link href="css/login.css" rel="stylesheet" type="text/css">
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
 <br><br>
		<div id="main">

   
  <div class="login">
	<div class="login1">
	</div>

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

	<font><b>[<%=category_name%>]</b></font><p><br>
    <hr>
	<table cellpadding=" 10" border=0>
	<tr>
		<td align=center width=100 height=30><font size=2><b>상품이미지</b></font></td>
		<td align=center width=150 height=30><font size=2><b>공간명</b></font></td>
		<td align=center width=350 height=30><font size=2><b>상세설명</b></font></td>
		<td align=center width=100 height=30><font size=2><b>위치</b></font></td>
		<td align=center width=80 height=30><font size=2><b>가격</b></font></td>
	</tr>
	<tr>
	<td colspan=5> <hr></td>
	</tr>
<%
		while(rs.next()) {
			String no = rs.getString("prdno");
			String name =  rs.getString("prdname");	
			String  description =  rs.getString("prddescription");
			String  place = rs.getString("prdplace");
			String price =  rs.getString("prdprice");
%>
   <tr>      
	  <td align="center"><a href="viewDetailProduct.jsp?prdno=<%=no%>">
	  <img src="images/<%=no%>.jpg" width="100" height="100" border=0></a></td>
	  <td align="center" ><a href="viewDetailProduct.jsp?prdno=<%=no%>"><%=name%></a></td>
      <td align="center"><a href="viewDetailProduct.jsp?prdno=<%=no%>"><%=description%></a></td>
	  <td align="center"><%=place%></td>
	  <td align="center"><%=price%> 원</td>
 </tr>
 <%
		}  
%>
    </table>
	<hr>
<%
    } catch (Exception e) {
        	out.println(e);
}
%>
</center>
<footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_index.jsp">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.
</footer>
</body>
</html>
