<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>상품 정보 수정 결과</title></head>
<body><center>

<%
	 request.setCharacterEncoding("euc-kr");
	
	 String no = request.getParameter("no");
     String	name = request.getParameter("name");
     String place = request.getParameter("place");
     String	number = request.getParameter("number");
     String	price = request.getParameter("price");
	 String	rule = request.getParameter("rule");
	 String description = request.getParameter("description");
 	 String ctg = request.getParameter("ctg");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String jsql = "UPDATE GOODS SET prdname=?, prdprice=?, prdplace=?, ";
     jsql = jsql + "prdnumber=?,prdrule=?,prddescription=?, prdctg=? WHERE prdno=?";  
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
     pstmt.setString(1, name);
	 pstmt.setString(2, place);  
	 pstmt.setString(3, number);
	 pstmt.setString(4, price);
	  pstmt.setString(5, rule);
	 pstmt.setString(6, description);
	 pstmt.setString(7, ctg);
	 pstmt.setString(8, no); 

     pstmt.executeUpdate();  
	

	 String jsql2 =  "SELECT * FROM goods WHERE prdno=?";  	 
	 PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1, no);

	 ResultSet rs = pstmt2.executeQuery();
     rs.next();
%>

<font><b> 수정된 상품정보는 다음과 같습니다.</b></font><p>
<table border="2" cellpadding="10">	
		<tr><td>카테고리분류</td> <td><%=rs.getString("prdctg")%></td></tr>
		<tr><td>공간등록번호</td> <td><%=rs.getString("prdno")%></td></tr>
		<tr><td>공간명</td> <td><%=rs.getString("prdname")%></td></tr>
		<tr><td>위치</td><td><%=rs.getInt("prdplace")%> 원</td></tr>
		<tr><td>인원</td><td><%=rs.getInt("prdnumber")%> 개</td></tr>
		<tr><td>대여가격</td> <td><%=rs.getString("prdprice")%></td></tr>
		<tr><td>주의사항</td> <td  width=300><%=rs.getString("prdrule")%></td></tr>
		<tr><td>상품설명</td> <td  width=300><%=rs.getString("prddescription")%></td></tr>
</table><p>
<a href="selectAllGoods.jsp" align=center>전체 등록상품 조회</a>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>