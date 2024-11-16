<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<html><head><title>상품 테이블 내용 삭제</title></head>
<body><center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root"; 
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String key = request.getParameter("prdno");
	 String jsql = "select * from goods where prdno = ?";      
	 PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();
	 
     String no = rs.getString("prdno");
	 String name =  rs.getString("prdname");	
	 String place =  rs.getString("prdplace");
	 String number =  rs.getString("prdnumber");	
	 String price = rs.getString("prdprice");
	 String rule = rs.getString("prdrule");
	 String description =  rs.getString("prddescription");
	 String ctg =  rs.getString("prdctg");

%>

<font><b>[등록된 상품 정보 삭제]</b></font><p>
<h4> 다음과 같이 등록된 상품정보 내용을 삭제하시겠습니까?</h4>
<table border="2" cellpadding="10" >
		<tr>
				<td>카테고리분류</td>
				<td><%=ctg%></td>
				<td rowspan="7"><img src="images\<%=no%>.jpg" width="300" height="300"></td>
		</tr>
		<tr><td>공간등록번호</td><td><%=no%></td></tr>
		<tr><td>공간명</td><td><%=name%></td></tr>
		<tr><td>위치</td><td><%=place%></td></tr>
		<tr><td>인원</td><td><%=number%>명</td></tr>
		<tr><td>대여가격</td><td><%=price%>원</td></tr>
		<tr><td>주의사항</td><td><%=rule%></td></tr>
		<tr><td>상세설명</td><td width=300><%=description%></td></tr>
</table><p>
<a href="deleteGoodsResult.jsp?prdno=<%=no%>">삭제</a>&nbsp;&nbsp;&nbsp;<a href="selectAllGoods.jsp">취소</a>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>