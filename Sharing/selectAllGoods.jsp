<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>상품 테이블 내용 조회</title></head>
<body>
<center>
<font><b>[전체 등록상품 조회]</b></font><p>
<table border="1" width=1000>
	<tr>
		<td align=center>공간사진</td>
		<td align=center>카테고리분류</td>
		<td align=center>공간등록번호</td>
		<td align=center>공간명</td>
		<td align=center>위치</td>
		<td align=center>인원</td>
		<td align=center>대여가격</td>
        <td align=center>주의사항</td>
		<td align=center>상세설명</td>
		<td align=center><b><font>[수정]</font></b></td><td align=center><b><font>[삭제]</font></b></td>
	</tr>	

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "SELECT * FROM goods";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();

	while(rs.next()){
			String ctg = rs.getString("prdctg");
			String no = rs.getString("prdno");
    		String name =  rs.getString("prdname");	
			String place =  rs.getString("prdplace");
			String number =  rs.getString("prdnumber");		      
			String price = rs.getString("prdprice");
			String rule = rs.getString("prdrule");
			String description =  rs.getString("prddescription");
%>
 <tr>      
	  <td align="center"><a href="selectDetailGoods.jsp?prdno=<%=no%>"><img src="images\<%=no%>.jpg" width="100" height="100" border=0></a></td>
	  <td align="center"><%=ctg%></td>	
	  <td align=center><a href="selectDetailGoods.jsp?prdno=<%=no%>"><%=no%></a></td>
	  <td align=center><a href="selectDetailGoods.jsp?prdno=<%=no%>"><%=name%></a></td> 
	  <td align="center"><%=place%></td>
      <td align="center"><%=number%>명</td>
	  <td align="center"><%=price%>원</td>
	  <td align="center"><%=rule%></td>
	  <td align="center" width=300><%=description%></td>
	  <td><a href="updateGoods.jsp?prdno=<%=no%>"><center>Yes</center></a></td>
	  <td><a href="deleteGoods.jsp?prdno=<%=no%>" ><center>Yes</center></a></td>
 </tr>
<%
	 }  // while문의 끝
%>
</table><p><br>
<a href="InsertGoods.jsp" align=center>신규 상품 추가 등록</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
 <a href="manager_index.jsp">관리자모드 메인페이지</a>
<br><br><br>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>