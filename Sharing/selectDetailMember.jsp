<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>회원 상세 정보 조회   </title></head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String key = request.getParameter("id");  
	 String jsql = "select * from member where memid = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
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

<center>
<font><b>[회원 상세정보 조회]    </b></font><p>
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:맑은 고딕">
		<tr><td width=100>ID</td><td width=200><%=id%></td></tr>
		<tr><td>비밀번호</td><td><%=passwd%></td></tr>
		<tr><td>성명</td><td><%=name%></td></tr>
		<tr><td>생년월일</td><td><%=birth%> (<%=solar%>)</td></tr>
		<tr><td>전화번호</td><td><%=phone%></td></tr>
		<tr><td>이메일</td><td><%=email%></td></tr>
    </table><p>

<a href="updateMember.jsp?id=<%=id%>">수정</a>&nbsp;&nbsp;
<a href="deleteMember.jsp?id=<%=id%>">삭제</a>
</center>

<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>