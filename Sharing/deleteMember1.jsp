<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<html><head><title>회원 정보 삭제</title></head>
<body><center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("id");
	
     String jsql = "select * from member where memid = ?";       
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

	 String id = rs.getString("memid");
	 String passwd =  rs.getString("mempasswd");	
	 String  name = rs.getString("memname");
	 Date birth = rs.getDate("membirth");
	 String solar =  rs.getString("memsolar");
	 String phone =  rs.getString("memphone");
	 String email =  rs.getString("mememail");
%>

<font><b>[회원 정보 삭제(탈퇴) 확인]</b></font><p>
<br><br>
<h4> 다음의 회원정보를 삭제하시겠습니까?</h4>
<table border="2" cellpadding="10">
		<tr><td width=100>ID</td><td width=200><%=id%></td></tr>
		<tr><td>비밀번호</td><td><%=passwd%></td></tr>
		<tr><td>성명</td><td><%=name%></td></tr>
		<tr><td>생년월일</td><td><%=birth%> (<%=solar%>)</td></tr>
		<tr><td>휴대폰번호</td><td><%=phone%></td></tr>
		<tr><td>이메일</td><td><%=email%></td></tr>
</table><p>

<a href="deleteMemberResult.jsp?id=<%=id%>">삭제</a>&nbsp;&nbsp;
<a href="main1.jsp">취소</a>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>