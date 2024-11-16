<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>주문 완료 or  장바구니내용 삭제</title></head>
<body>
<center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //  세션번호(장바구니번호)를 가져옴
	String caseNo = request.getParameter("case");

	String jsql = "delete from cart where ctNo=?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);
	
    pstmt.executeUpdate();

	if(caseNo!= null)  //  (1) 주문완료로 인한 장바구니 비우기 수행하고 난 후의 주문완료 메시지 출력
	{                             //   orderOK.jsp의 107행 참조
%>
<br><br>
<img src="images/logo.png" width="250" height="100" alt=""/><br>
<b>[공간 대여 완료]</b></font><p>
	곧 만나요!<br>
	쉐어링을 이용해 주셔서 감사합니다!<br><br>
	<a href="main1.jsp"><input type=button value="HOME"></a>

<%
	}
	  else   //  (2) 주문과 상관없이 장바구니 비우기를 수행한 경우의 출력
	 {
%>
<br><br>
<img src="images/logo.png" width="250" height="100" alt=""/><br>
<b>[장바구니 내용 삭제]</b></font><p>
	장바구니의 모든 내용을 삭제하였습니다.<br><br>
		<a href="main1.jsp"><input type=button value="HOME"></a>
<%
	  }
   } catch (Exception e) {
       out.println(e);
}
%>
</center>
</body>
</html>