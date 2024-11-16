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
	
     String jsql = "select * from orderinfo where memid = ?";       
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();
			String id = rs.getString("memid");   
    		String ordRcvAddress=rs.getString("ordRcvAddress");
			String ordReceiver = rs.getString("ordReceiver");
			String ordRcvPhone = rs.getString("ordRcvPhone");
			String ordPay = rs.getString("ordPay");
    		String ordBank =  rs.getString("ordBank");	
			String ordCardNo = rs.getString("ordCardNo");
%>

<font><b>회원 주문정보 상세보기</b></font><p>
<br><br>
<table border="2" cellpadding="10">
		<tr><td width=100>아이디</td><td width=200><%=id%></td></tr>
		<tr><td>수령인이름</td><td><%=ordRcvAddress%></td></tr>
		<tr><td>수령인전화번호</td><td><%=ordReceiver%></td></tr>
		<tr><td>수령인날짜</td><td><%=ordRcvPhone%></td></tr>
		<tr><td>가격</td><td><%=ordPay%></td></tr>
		<tr><td>결제내역</td><td><%=ordBank %>(<%=ordCardNo%>)</td></tr>
</table><p>

<a href="selectAllorder.jsp?id=<%=id%>">확인</a>&nbsp;&nbsp;

<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>