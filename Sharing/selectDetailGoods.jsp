<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>상품 상세 정보 조회</title></head>
<body><center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team"; 
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String key = request.getParameter("prdno");

	 String jsql = "SELECT * FROM goodS WHERE prdno = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	 
	 ResultSet rs = pstmt.executeQuery();
	 rs.next();
	 
	 String no = rs.getString("prdno");
	 String name =  rs.getString("prdname");	
	 String place = rs.getString("prdplace");
	 String number =  rs.getString("prdnumber");	
	 String price = rs.getString("prdprice");
	 String rule = rs.getString("prdrule");
	 String description =  rs.getString("prddescription");
 	 String ctg =  rs.getString("prdctg");
%>

<font><b>[상품 상세정보 조회]</b></font><p>
<table border="1">
    	 <tr>
		      <td align=center>카테고리분류</td><td align=center><%=ctg%></td>
		      <td rowspan="7"  align=center ><img src="images\<%=no%>.jpg" width="300" height="300"></td>
	    </tr>
		<tr><td align=center>공간등록번호</td><td align=center><%=no%></td></tr>
		<tr><td align=center>공간명</td><td align=center><%=name%></td></tr>
		<tr><td align=center>위치</td><td align=center><%=place%></td></tr>
		<tr><td align=center>인원</td><td align=center><%=number%></td></tr>
		<tr><td align=center>대여가격</td><td align=center><%=price%>원</td></tr>
		<tr><td align=center>주의사항</td><td align=center><%=rule%></td></tr>
		<tr><td align=center>상품설명</td><td align=center  width=300><%=description%></td></tr>
    </table><p>

<br><br>
<img src="./images/<%=no%>_Detail.jpg" width=700 height=700 border=0>
<br><br><br>

<a href="updateGoods.jsp?prdno=<%=no%>" align=center>수정</a>
&nbsp;&nbsp;&nbsp;<a href="deleteGoods.jsp?prdno=<%=no%>" align=center>삭제</a>
<br><br><br>

</center>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>

