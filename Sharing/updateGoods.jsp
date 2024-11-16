<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>상품 정보 수정</title></head>
<body><center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team"; 
	 String DB_ID="root";  
	 String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

 	 String key = request.getParameter("prdno");

	 String jsql = "SELECT * FROM goods WHERE prdno = ?";       
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
	 String description =  rs.getString("prdDescription");
	 String ctg =  rs.getString("prdctg");
%>

<font><b>[상품 정보 수정]</b></font><p>
<form method="post" action="updateGoodsResult.jsp">
<table border="2" cellpadding="10">		
		<tr>
				<td>카테고리분류</td>
				<td><input type=text name="ctg" value="<%=ctg%>"></td>
				<td rowspan="7"><img src="images\<%=no%>.jpg" width="300" height="300"></td>
		</tr>
		<tr>
				<td>공간등록번호</td>
				<td><input type="hidden" name="no" value="<%=no%>" ><%=no%></td>
	    </tr>
		<tr>
				<td>공간명</td>
				<td><input type=text name="name" value="<%=name%>"></td>
		</tr>
		<tr>
				<td>위치</td>
				<td><input type=text name="place" value="<%=place%>"></td>
		</tr>
		<tr>
				<td>인원</td>
				<td><input type=text name="number" value="<%=number%>">명</td>
		</tr>
		<tr>
				<td>대여가격</td>
				<td><input type=text name="price" value="<%=price%>"></td>
		</tr>
		<tr>
			<td>주의사항:</td>
			<td><textarea name="rule" rows="5" cols="30"><%=rule%> </textarea></td>	
		</tr>
		<tr>
			<td>상세설명:</td>
			<td><textarea name="description" rows="5" cols="30"><%=description%> </textarea></td>	
		</tr>	
</table><p> 

<br>
<img src="./images/<%=no%>.jpg" width=700 height=700 border=0>
<br><br><br>

<input type="submit" value="수정완료">
</form>
<br><br><br>


<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>