<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<html><head><title>공간 등록 처리 결과</title></head>
<body>

<% 
	request.setCharacterEncoding("euc-kr");  

	
    String ctg = request.getParameter("ctg");
	String no = request.getParameter("no");
	String name = request.getParameter("name");
    String place = request.getParameter("place");
	String number = request.getParameter("number");
	String price = request.getParameter("price");
	String rule = request.getParameter("rule");
	String description = request.getParameter("description");


try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
               

	
    String jsql = "INSERT INTO GOODS  (prdctg, prdno, prdname, prdplace, prdnumber, ";
	jsql = jsql + "prdprice, prdrule ,prddescription )  VALUES  (?, ?, ?, ?, ?, ?,?,?)"; 
      
    
	PreparedStatement pstmt = con.prepareStatement(jsql); 

	
    pstmt.setString(1, ctg); 
	pstmt.setString(2, no); 
    pstmt.setString(3, name);
	pstmt.setString(4, place);  
	pstmt.setString(5, number); 
	pstmt.setString(6, price);
	pstmt.setString(7, rule);
	pstmt.setString(8, description);
	pstmt.executeUpdate(); 
%>
<center>
<font><b>[등록된 상품 정보]</b></font><p>
<table border="2" cellpadding="10" >
		<tr><td width="100">카테고리분류</td><td width="300"><%=ctg%></td></tr>
		<tr><td width="100">공간번호</td><td width="300"><%=no%></td></tr>
		<tr><td width="100">공간명</td><td width="300"><%=name%></td></tr>
		<tr><td width="100">위치</td><td width="300"><%=place%></td></tr>
		<tr><td width="100">인원</td><td width="300"><%=number%>명</td></tr>
		<tr><td width="100">대여가격</td><td width="300"><%=price%>원</td></tr>
		<tr><td width="100">주의사항</td><td width="300"><%=rule%></td></tr>
		<tr><td width="100">상품설명</td><td width="300"><%=description%></td></tr>
</table><p>
<% 
  } catch(Exception e) { 
		out.println(e);
}
%>
<p>
<a href = "selectAllGoods.jsp">전체 등록공간조회</a><br><br>
</center>
</body>
</html>