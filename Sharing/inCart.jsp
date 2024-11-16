<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>장바구니 담기</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- 클릭하기전의 설정은 선없고 검정색 -->
     a:visited { text-decoration: none; color: black; }     <!-- 방문한뒤의 설정은 밑줄없고 검정 -->
     a:hover { text-decoration: underline; color:blue; } <!-- 마우스가 올라갈때 설정은 아랫줄있고 파랑 -->
 </style>

</head>
<body>

<%
	
	String myid = (String)session.getAttribute("sid");  

if (myid == null)    
{                              
%>
<center>
<br><br><br> 
<font style="font-size:10pt;font-family:맑은 고딕">
		상품 주문을 위해서는 로그인이 필요합니다! <br><br>	<a href="Login.jsp" ><input type="button" value="확인"></a>
</font>
</center>
<%
}
else    
{
 try
	 {
 	    String DB_URL="jdbc:mysql://localhost:3306/team";    
        String DB_ID="root"; 
        String DB_PASSWORD="1234";
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String ctNo = session.getId();  
 	                                                         

       

         
		
		String prdno = request.getParameter("prdno"); 
		int ctQty = Integer.parseInt(request.getParameter("qty")); 


		
		String jsql = "select * from cart where ctNo = ? and prdno = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ctNo);
		pstmt.setString(2, prdno);
		ResultSet rs = pstmt.executeQuery(); 

	   	if(rs.next())   
		{		             
			int sum = rs.getInt("ctQty") + ctQty;  

			String jsql2 = "update cart set ctQty=? where ctNo=? and prdno=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setString(3, prdno);

			pstmt2.executeUpdate();
		}
		else 
		{
			String jsql3 = "insert into cart (ctNo, prdno, ctQty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setString(2,prdno);
			pstmt3.setInt(3,ctQty);	

			pstmt3.executeUpdate();
		}  
	 } 	catch(Exception e)  {
             out.println(e);
    }  		

       
	    response.sendRedirect("showCart.jsp");   
}                                      
%>
</body>
</html>
