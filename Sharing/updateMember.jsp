<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>회원 정보 수정 </title></head>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet"></head>
<body>

<body onLoad="login_focus()"> 
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

<%	 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root";  
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	 String key = request.getParameter("id");   
	 String jsql = "select * from member where memid = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

	 ResultSet rs = pstmt.executeQuery();
	 rs.next();
			
	 String id = rs.getString("memid");
   	 String passwd = rs.getString("mempasswd");
	 String name = rs.getString("memname");
	 Date birth = rs.getDate("membirth");
	 String solar = rs.getString("memsolar");
	 String phone = rs.getString("memphone");
	 String email = rs.getString("mememail");
%>

<center>
 <br><br>
<img src="images/logo.png" border=0>
			<br><br>
		<div id="main">

    <h3>[회원정보수정]</h3><br><br>
  <div class="login">
	<div class="login1">
		정보를 입력해 주세요
	</div>
	<form method=post action="updateMemberResult.jsp">
	<table border=1 cellpadding=5 align="center">
		<tr>
			<td width=100>ID</td>
			<td><input type=hidden name="id" value="<%=id%>"><%=id%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type=text name="passwd" value="<%=passwd%>"></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type=text name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>생일</td>
			<td>
<%
	    	String[ ]  birthArr = birth.toString().split("-");  
%>		
		    <input type=text name="birthYear" value="<%=birthArr[0]%>" size="4">년
		    <input type=text name="birthMonth" value="<%=birthArr[1]%>" size="2">월
		    <input type=text name="birthDay" value="<%=birthArr[2]%>" size="2">일
<%
	if (solar.equals("양력"))
	{
%>
				<input type=radio name=solar value="양력" checked>양력
				<input type=radio name=solar value="음력">음력
<%
	}
	else
	{
%>
				<input type=radio name=solar value="양력">양력
				<input type=radio name=solar value="음력" checked>음력
<%
	}
%>
			</td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td>
<%
	    	String[ ] hpArr  = phone.split("-");  
      
			String[ ]  hpSelected = new String[6];  
    	

			if(hpArr[0].equals("010"))
			{
				hpSelected[0] = "selected";
			}  
			else if(hpArr[0].equals("011"))
			{
				hpSelected[1] = "selected";
			}
			else if(hpArr[0].equals("016"))
			{
				hpSelected[2] = "selected";
			}
			else if(hpArr[0].equals("017"))
			{
				hpSelected[3] = "selected";
			}
			else if(hpArr[0].equals("018"))
			{
				hpSelected[4] = "selected";
			}
			else if(hpArr[0].equals("019"))
			{
				hpSelected[5] = "selected";
			}

%>
			<select name="hp1">      
				<option value="010" <%=hpSelected[0]%>>010
				<option value="011" <%=hpSelected[1]%>>011
				<option value="016" <%=hpSelected[2]%>>016
				<option value="017" <%=hpSelected[3]%>>017
				<option value="018" <%=hpSelected[4]%>>018
				<option value="019" <%=hpSelected[5]%>>019
			</select>		
		    <input type=text name="hp2" value="<%=hpArr[1]%>" size="4">-
		    <input type=text name="hp3" value="<%=hpArr[2]%>" size="4">
			</td>	
		</tr>
        <tr>
			<td>이메일</td>
			<td><input type=text name="email" value="<%=email%>"></td>
		</tr>
	</div>
	</table>
	<p><input type=submit value=수정완료>
	</form>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</center>
 <footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="#">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.
</footer>
</body>
</html>