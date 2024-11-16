<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>관리자 로그인 결과</title>
</head>

 <body>
 
 <center>

<%
	String id = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();  
   String curDate = date.toLocaleString();    

 %>
     <br><br><br>
     <p><img src="./images/logo.png"><br><br><br><br>
	  <font size=3>
      <table>
	  <tr>
 			<td>접속관리자 ID:</td>
	  	    <td><%=id%></td>
	  </tr>
      <tr>
 			<td>접속 시각: </td>
	  	    <td><%=curDate %></td>
	  </tr>
	  </table><p>	  
	  </font>
	  <br><br><br>

<a href="place.html"><img src="./images/goods.png"></a><br><br><br><br>
<a href="member.html"><img src="./images/member.png"></a><br><br><br><br>
<br>

<a href="Logout.jsp"><input type="button" value="관리자 로그아웃"></a>
<br><br><br><br><br>

</center>
</body>
</html>