<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>주문하기</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
</head>
<header>


   <div id="logo">
		<a href="main1.jsp"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
	<div class="up-menu">|<a href="main1.html">&nbsp;Home&nbsp;</a></div>
	<div class="up-menu">|<a href="Logout.jsp">&nbsp;로그아웃&nbsp;</a></div>
	<div class="up-menu">|<a href="mypage_main.jsp">&nbsp;MY PAGE&nbsp;</a></div>
		<div class="up-menu">|<a href="inCart.jsp">&nbsp;장바구니&nbsp;</a></div>
	<div class="up-menu"><a href="updateMember.jsp">&nbsp;회원정보수정&nbsp;</a></div>
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

<script language="javascript" >
function check_val()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.form.memphone.value == "") 
	{
		alert("주문자 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.memphone.focus();
		return false;			
	}			

	if (document.form.receiver.value == "") 
	{
		alert("수령인 성명은 반드시 기입을 해야 합니다. ");
		document.form.receiver.focus();
		return false;			
	}

	if (document.form.rcvAddress.value == "") 
	{
		alert("수령인 주소는 반드시 기입을 해야 합니다. ");
		document.form.rcvAddress.focus();
		return false;			
	}

	if (document.form.rcvPhone.value == "") 
	{
		alert("수령인 전화번호는 반드시 기입을 해야 합니다. ");
		document.form.rcvPhone.focus();
		return false;			
	}
 
	if (document.form.cardNo.value == "" && document.form.bank.value == 0 ) 
	{
		alert("결제방법 중 하나는 선택해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

    	if (document.form.cardNo.value != "" && document.form.bank.value != 0 ) 
	{
		alert("결제방법 중 하나만 선택해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

	if (document.form.cardNo.value != "" && document.form.cardPass.value == "" ) 
	{
		alert("카드 비밀번호는 반드시 기입을 해야 합니다. ");
		document.form.cardNo.focus();
		return false;			
	}

   	document.form.submit();
}

</script>

<body>
<center>
<br><br>
<b>[상품 주문서]</b><p>

<%          //    (1) (17행~120행): 장바구니 내역을 그대로 보여주기  => showCart.jsp의 13행~116행과 
try {         //         완전히 동일한 코드임
 	 String DB_URL="jdbc:mysql://localhost:3306/team";    // 접속 DB는 project
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장


	// 장바구니에 물건을 담기 전후, mysql상에서 select * from cart;의 결과를 함께 확인/비교 해가면서
	// cart테이블에 남아있는 상품레코드정보와 장바구니번호(ctNo)를 함께 이해해 보도록 할 것!
	//  =>  홈페이지상에서 보여지는 장바구니 내역에 포함된 레코드들이, 실제로 cart테이블상에서는 
	//         무엇을 의미하고 있는지 곰곰히 생각해 볼 것! (중요!)
	String jsql = "select * from cart where ctNo = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next())    // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
	{                       //  따라서,  !rs.next()의 값은 true가 됨 
%>
		장바구니가 비었습니다.
<%
	}
	else
	{
%>

<table border=1  style="font-size:10pt;font-family:맑은 고딕">
<tr>       
   <td bgcolor="#eeeede"  width = 120 height="30" align="center" ><p align="center"><strong>상품번호</strong></font></td>       
   <td bgcolor="#eeeede"  width = 120 height="30" align="center"><p><strong>상품명</strong></font></td>       
   <td bgcolor="#eeeede"  width = 120 height="30" align="center"><p><strong>상품단가(원)</strong></font></td>       
   <td bgcolor="#eeeede"  width = 120 height="30" align="center"><p><strong>인원수(명)</strong></font></td>     
   <td bgcolor="#eeeede"  width = 120 height="30" align="center" ><p><strong>주문액(원)</strong></font></td>  
   <td bgcolor="#eeeede"  width = 120 height="30" align="center" ><p><font size="2" color="red"><b>[상품삭제]</b></font></td>
 </tr> 		

<%



		String jsql2 = "select prdNo, ctQty from cart where ctNo = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ctNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String prdNo = rs2.getString("prdNo");	//  cart테이블로부터 상품번호 추출
    		int ctQty = rs2.getInt("ctQty");	                //  cart테이블로부터 주문수량 추출 

    		String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, prdNo);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	prdName =  rs3.getString("prdName");	  //  goods 테이블로부터 상품명 추출
			int prdPrice =  rs3.getInt("prdPrice");                 //  goods 테이블로부터 상품단가 추출
				
    		int amount = prdPrice * ctQty;    //  주문액 계산
			total = total + amount;                  //  전체 주문총액 계산
%>
 <tr>       
    <td  bgcolor="#eeeede" height="30" align="center"><font size="2"><%=prdNo%></font></td>     
	<td  bgcolor="#eeeede" height="30"align="center"><font size="2"><%=prdName%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=prdPrice%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=ctQty%></font></td>
    <td  bgcolor="#eeeede" height="30"align="right"><font size="2"><%=amount%> 원</font></td>  
    <td  bgcolor="#eeeede" height="30"align="center"><a href="deleteCart.jsp?prdNo=<%=prdNo%>"><font size="2" color=blue><b>삭제</b></a></font></td> 	
  </tr>   
<%
	     }  // while문의 끝
 %>
  <tr>
	<td colspan = 4 align=center><font size="2" color="red"><b>전체 주문총액</b></font></td>
	<td  bgcolor="#eeeede" height="30" align=right><font size="2" color="red"><b><%=total%> 원</b></font></td>
	<td align=center><font size=2 color=green>(선택물품 총합)</font></td>
  </tr>
 </table>     

<%
	// (2)주문자 정보 출력 - 회원 테이블 정보 출력
	String myid = (String)session.getAttribute("sid");  // 로그인했었던 주문자 정보(즉, 아이디)를 받아옮

	String jsql4 = "select memName, memphone from member where memId = ?";
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1,myid);

	ResultSet rs4 = pstmt4.executeQuery();
	rs4.next();
	String  name = rs4.getString("memName");
	String  tel = rs4.getString("memphone");
%>
<form name="form" method="Post" action="orderOK.jsp">     <!--  폼의 이름이 form으로 지정됨 -->
<table border=1   style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td rowspan = 2 width="155" align="center" bgcolor="#eeeede">
			<strong>주문자 정보</strong></font>
		</td>
		<td   align="center" width=110 bgcolor="#eeeede">
			<strong>이 름
		</td>
		<td width=470>
		    <%=name%>
		</td>
	</tr>
	<tr>
		<td   align="center" width=110 bgcolor="#eeeede">
			<strong>전 화</strong></font></td>
		<td width=470><input type="text" name="memphone" size=40 value=<%=tel%>></td>
	</tr>
</table>


<table border=1   style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td rowspan = 3 width="155"align="center" bgcolor="#eeeede">
			<strong>수령인 정보</strong></font></td>
		<td   align="center" width=110 bgcolor="#eeeede">
			<strong>이 름</strong></font></td>
		<td width=470><input type="text" name="receiver" size=40></td>
	</tr>
	<tr>
		<td   align="center" width=110 bgcolor="#eeeede">
			<strong>전화번호</strong></font></td>
		<td width=470><input type="text" name="rcvAddress" size=40></td>
	</tr>
	<tr>
		<td   align="center" width=110 bgcolor="#eeeede">
			<strong>예약날짜</strong></font></td>
		<td width=470><input type="text" name="rcvPhone" size=40></td>
	</tr>
</table>


<table border=1   style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td rowspan = 2   align="center" width="155" bgcolor="#eeeede">
			<strong>결제 방법</strong></font></td>
		<td   align="center" width=110 bgcolor="#eeeede">
			<strong>신용카드 번호</td>
		<td width=120><input type="text" name="cardNo"></td>
		<td   align="center" width=112 bgcolor="#eeeede">
			<strong>비밀번호</strong></font></td>
		<td width=120><input type="password" name="cardPass"></td>
	</tr>
	<tr>
		<td   align="center" width=110 bgcolor="#eeeede">
			
			<strong>무통장 입금</strong></font></td>
		<td  colspan=3 width=474>
		<select name="bank">
			<option value="0" selected>다음 중 선택</option>
            <option value="우리은행">우리은행 ( 324-01-123400 / (주)쉐어링)</option>
            <option value="국민은행">국민은행 ( 011-02-300481 / (주)쉐어링)</option>
            <option value="외환은행">외환은행 ( 327-56-333002 / (주)쉐어링)</option>
            <option value="신한은행">신한은행 ( 987-25-202099 / (주)쉐어링)</option>
            <option value="하나은행">하나은행 ( 698-00-222176 / (주)쉐어링)</option>
		</select>
		<font size=1 color=blue>(카드 or 무통장입금 중 택일!)</font>
		</td></td></tr>
</table>


<table border=1  style="font-size:13pt;font-family:맑은 고딕">
	<tr>
		<td colspan = 2   align="center" width="275" bgcolor="#eeeede">
			<font  color="red">
			<strong>전체 주문 총액(원)</strong></font></td>
   <!-- 왜 hidden 처리를 해야만 하는지 orderOK.jsp를 분석하면서 곰곰히 생각해 볼 것!    -->
		<td width=470 align=right><input type="hidden" name="pay" value="<%=total%>" ><font  color="red"><%=total%></font>&nbsp(원)</td>   
	</tr>
</table>
<br>

<table>
	<tr>     <!-- onClick 이벤트가 사용되고 있고, input태그의 type 속성값이 "button"임에 유의할 것! -->
	             <!--  "js_package.js"에 정의된 자바스크립트 check_val() 함수를 확인 요망! -->
		<td><input type = button value = "주문확인"  OnClick="check_val()"></td> 
		<td><input type="reset" value="주문취소" name="reset" ></td>
	</tr>
</table>                 

</form>    
<%
	 }   //  if-else문의 끝
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