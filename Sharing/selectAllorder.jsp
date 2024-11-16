<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>회원 주문내역 조회   </title></head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team"; 
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from orderinfo";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font><b>[전체 대여 내역 조회]</b></font><p>
<table border="2" cellpadding="10">
	<tr color=blue>
		<td>아이디</td><td>수령인 이름</td><td>수령인 전화번호</td><td>수령인 날짜</td>		
		<td>가격</td><td>결제내역</td><td><b>삭제</b></td>
	</tr>	

<%
		while(rs.next()){
			String id = rs.getString("memid");   
    		String ordRcvAddress=rs.getString("ordRcvAddress");
			String ordReceiver = rs.getString("ordReceiver");
			String ordRcvPhone = rs.getString("ordRcvPhone");
			String ordPay = rs.getString("ordPay");
    		String ordBank =  rs.getString("ordBank");	
			String ordCardNo = rs.getString("ordCardNo");
			
%>
   <tr>                     
 	  <td> <a href="selectDetailorder.jsp?id=<%=id%>"><%=id%></a></td>
      
	  <td><%=ordReceiver%></td>
  <td><%=ordRcvAddress%></td>
	  <td><%=ordRcvPhone%></td>
	  <td><%=ordPay%></td>	
 	  <td><%=ordBank %>(<%=ordCardNo%>)</td>	
  	  <td align=center><a href="deleteorder.jsp?id=<%=id%>">Yes</a></td>
  </tr>
<%
		}  // while문의 끝
%>
</table><p>
<br>
 <a href="main1.jsp"> 메인페이지</a>
 &nbsp&nbsp&nbsp

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>
