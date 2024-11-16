<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>장바구니 내역 조회</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
</head>


<header>


   <div id="logo">
		<a href="main1.jsp"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
	<div class="up-menu">|<a href="main1.jsp">&nbsp;Home&nbsp;</a></div>
	<div class="up-menu">|<a href="Logout.jsp">&nbsp;로그아웃&nbsp;</a></div>
	<div class="up-menu">|<a href="mypage_main.jsp">&nbsp;MY PAGE&nbsp;</a></div>
		<div class="up-menu">|<a href="inCart.jsp">&nbsp;장바구니&nbsp;</a></div>
<div class="up-menu"><a href="InsertMember.jsp">&nbsp;회원가입&nbsp;</a></div>
	
  <!--메뉴-->
  <div id="menu">
		<ul>
			<li><a href="about.jsp">ABOUT</a></li>
		<li><a href="viewProduct.jsp?prdctg=category1">스튜디오</a></li>
			<li><a href="viewProduct.jsp?prdctg=category2">파티룸</a></li>
			<li><a href="viewProduct.jsp?prdctg=category3">회의실</a></li>
		
		</ul>
	</div>
</header>
 <br><br> <br><br> <br><br> <br><br>
<div id="main">

  <div class="login">
	<div class="login1">
		
	</div>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";    
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   


	
	String jsql = "select * from cart where ctNo = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next())    
	{                       
%>
		장바구니가 비었습니다.
<%
	}
	else
	{
%>
	<center>
<div class="login2">
	<table id="table" cellpadding="5" style="font-size:10pt">
<tr>       
   <td class="inform" ><p align="center"><font size="2"><strong>상품번호</strong></font></td>       
   <td class="inform" ><p align="center"><font size="2"><strong>상품명</strong></font></td>       
   <td class="inform" ><p align="center"><font size="2"><strong>상품단가(원)</strong></font></td>       
   <td class="inform" ><p align="center"><font size="2"><strong>인원수(명)</strong></font></td>     
   <td class="inform" ><p align="center"><font size="2"><strong>주문액(원)</strong></font></td>  
   <td class="inform" ><p align="center"><font size="2"><p><font size="2" color="red"><b>[상품삭제]</b></font></td>
 </tr> 		

<%
 


		String jsql2 = "select prdNo, ctQty from cart where ctNo = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ctNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String prdNo = rs2.getString("prdno");	
    		int ctQty = rs2.getInt("ctQty");	                

    		String jsql3 = "select prdname, prdprice from goods where prdno = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, prdNo);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	prdName =  rs3.getString("prdname");	 
			int prdPrice =  rs3.getInt("prdprice");                 
				
    		int amount = prdPrice * ctQty;   
			total = total + amount;                  
%>
 <tr>       
    <td   bgcolor="#eeeede" height="30" align="center"><font size="2"><%=prdNo%></font></td>     
	<td   bgcolor="#eeeede" height="30"align="center"><font size="2"><%=prdName%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=prdPrice%></font></td> 
	<td   bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=ctQty%></font></td>
    <td   bgcolor="#eeeede" height="30"align="right"><font size="2"><%=amount%> 원</font></td>  
    <td  bgcolor="#eeeede" height="30"align="center"><a href="deleteCart.jsp?prdNo=<%=prdNo%>"><font size="2" color=blue><b>삭제</b></a></font></td> 	
  </tr>   
<%
	     }  
 %>
  <tr>
	<td class="inform" colspan = 4 align=center><font size="2" color="red"><b>전체 주문총액</b></font></td>
	<td class="inform" height="30" align=right><font size="2" color="red"><b><%=total%> 원</b></font></td>
	<td class="inform"align=center><font size=2 color=green>(선택물품 총합)</font></td>
  </tr>
  </div>
      </div>
	  </div>
 </table>      

<br><br>
<a href="deleteAllCart.jsp" ><font size=2>장바구니 비우기</font></a> &nbsp&nbsp
<a href="order.jsp" ><font size=2>주문하기</font></a>

<%
		}	
   }  catch(Exception e)  {
        out.println(e);
} 
%>
<br><br><br><br><br><br>
</center> 
  <footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_index.jsp">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.
</footer>
</body>  

</html> 