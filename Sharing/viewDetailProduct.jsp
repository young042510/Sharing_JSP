<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html><head><title>공간 테이블 내용 조회</title></head>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
<link href="css/sale.css" rel="stylesheet" type="text/css">
<script language="javascript">
function directOrd()       
{
	var str=product.qty.value;
	var frm = document.product;
	frm.action = "directOrder.jsp";
	frm.submit();
}


function inCart()           
{
	var str=product.qty.value;
	var frm = document.product;
	frm.action = "inCart.jsp";
	frm.submit();
}


function enlarge()          
{
	var no = document.product.prdNo.value;
	window.open("./images/"+no+".jpg","win", "width=280, height=280, scrollbars=no, resizable=no");
}



function amountCheck()     
{
	obj=document.product.qty;
	if(isNaN(obj.value))          
	{
		obj.value="1";
		alert('숫자만 입력해주세요');
		return;
	}

   if(obj.value < 1)
	{
		obj.value="1";
	}
}


function amountPlus()      
{
	obj=document.product.qty;
	obj.value=parseInt(obj.value) + 1;
}


function amountMinus()       
{
	obj=document.product.qty;
	if(parseInt(obj.value)  > 1)
	{
		obj.value=parseInt(obj.value) - 1;
	}
	else
	{
		alert('더이상 줄일수가 없습니다');
		return;
	}
}

</script>


<body>
<header>
    <div id="logo">
		<a href="main1.jsp"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
	<div class="up-menu">|<a href="main1.jsp" target=_parent>&nbsp;Home&nbsp;</a></div>
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
<div id="main">
<%
 try{
 	 String DB_URL="jdbc:mysql://localhost:3306/team";    
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String pNO = request.getParameter("prdno");   

    String jsql = "select * from goods where prdno = ?";   
	PreparedStatement pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1,  pNO);

	ResultSet rs = pstmt.executeQuery();
    rs.next();

			String no = rs.getString("prdno");
			String name =  rs.getString("prdname");	
			String  description =  rs.getString("prddescription");
			String  place = rs.getString("prdplace");
			String price =  rs.getString("prdprice");
%>
	<center>
	<div id="main">
	<div id="imgae">    <img src="images/<%=no%>_Detail.jpg" width="600" height="450" alt=""/> </div>
	<div id="main-info">
		<div class="name"><%=name%></div>
		<div class="place"><%=place%></div>
			<form name= product  method="post">   
	<table border=0  cellpadding=10 >
		<tr>
		     <td rowspan=7 align=center width=100> <a href="javascript:enlarge()"></td>
		      <td class="tag" align=left width=100><font size=2><b>&nbsp;&nbsp;&nbsp;공간번호:</b></font></td>
			  <td colspan=2 align=left  width=100><input type=hidden name=prdno  value="<%=no%>"><font size=2><%=no%></font></td>		      
		</tr>
		<tr>
		      <td class="tag"  align=left  width=100><font size=2><b>&nbsp;&nbsp;&nbsp;공간명:</b></font></td>
		      <td colspan=2  align=left  width=100><font size=2><%=name%></font></td>
		</tr>
		<tr>
		      <td class="tag" align=left  width=100 ><font size=2><b>&nbsp;&nbsp;&nbsp;상세설명:</b></font></td>
			  <td colspan=2  align=left  width=300><font size=2><%=description%></font></td>
		</tr>
		<tr>
		      <td  class="tag" align=left  width=100><font size=2><b>&nbsp;&nbsp;&nbsp;위치:</b></font></td>
			  <td colspan=2  align=left  width=100><font size=2><%=place%></font></td>
		</tr>
		<tr>
		      <td class="tag" align=left  width=100><font size=2><b>&nbsp;&nbsp;&nbsp;가격:</b></font></td>
			  <td class="tag" colspan=2  align=left  width=100 ><font size=2><%=price%> 원</font></td>
		</tr>
		<tr>

			  <td class="tag" align=left  width=100 ><font size=2><b>&nbsp;&nbsp;&nbsp;인원수:</b></font></td>
			  <td align=left  width=60 ><input type=text name=qty size=7 value="1" style="width:40;height:20"  onblur="javascript:amountCheck();"></td>
			  <td align=left width=240 >명&nbsp;&nbsp;
             <input type=button value="▲" onClick="amountPlus();"  style="width:18;height:16;">
             <input type=button value="▼" onClick="amountMinus();"    style="width:18;height:16;">
              </td>
		</tr>
    </table>
	</form>
		<div class="star">
		<span class="star1">★</span>&nbsp;
		<span class="star2">5</span>
		</div>
	  <div class="tag"><%=description%></div>
	  <div class="price">
			<span class="price1"><%=price%></span>
			<span class="price2">원/시간</span>
		</div>
		<div class="reservation">
<input type=button value="장바구니 담기" onClick=javascript:inCart() alt="장바구니 담기">


		</div>
	</div>
</div>

<%
    } catch(Exception e) {
		out.println(e);
}
%>

<footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_index.jsp">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.</footer>
</center>
</body>
</html>