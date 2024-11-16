<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>회원 테이블 내용 조회   </title></head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team"; 
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from member";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font><b>[전체 회원 조회]</b></font><p>
<table border="2" cellpadding="10">
	<tr color=blue>
		<td>ID</td><td>비밀번호</td><td>성명</td><td>주민번호</td><td>생년월일</td>	
		<td>전화</td><td><b>수정</b></td><td><b>삭제</b></td>
	</tr>	

<%
		while(rs.next()){
			String id = rs.getString("memid");   
    		String passwd =  rs.getString("mempasswd");	
			String name = rs.getString("memname");
			Date birth = rs.getDate("membirth");
    		String solar =  rs.getString("memSolar");	
			String phone = rs.getString("memphone");
			String email = rs.getString("mememail");
%>
   <tr>                     
 	  <td> <a href="selectDetailMember.jsp?id=<%=id%>"><%=id%></a></td>
      <td><%=passwd%></td>
	  <td><%=name%></td>
	  <td><%=birth%> (<%=solar%>)</td>	
 	  <td><%=phone%></td>
	  <td><%=email%></td>
	  <td align=center><a href="updateMember.jsp?id=<%=id%>">Yes</a></td>
  	  <td align=center><a href="deleteMember.jsp?id=<%=id%>">Yes</a></td>
  </tr>
<%
		}  // while문의 끝
%>
</table><p>
<br>
 <a href="manager_index.jsp">관리자모드 메인페이지</a>
 &nbsp&nbsp&nbsp

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>