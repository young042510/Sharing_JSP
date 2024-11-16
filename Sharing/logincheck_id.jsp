<%@ page contentType="text/html;charset=UTF-8" %>
<html><head><title>로그인</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet"></head>
<script language="javascript"> 

function checkId_logincheck()		 
{  									
	var id = newMem.id.value;		

    if (id  == "")				
    {
		alert("ID를 입력해 주세요!"); 
		newMem.id.focus(); 
		return; 
    }

	window.open("checkId_logincheck.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}                                       

</script>



<body onLoad="login_focus()"> 
<header>
   <div id="logo">
		<a href="main.jsp"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
	<div class="up-menu">|<a href="main1.html">&nbsp;Home&nbsp;</a></div>
	<div class="up-menu">|<a href="Login.jsp">&nbsp;로그인&nbsp;</a></div>
	<div class="up-menu">|<a href="#">&nbsp;MY PAGE&nbsp;</a></div>
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
<center>
<br><br><br><br><br><br><br><br>


    <div class="login">
      <div class="login1">
      </div>
      <div class="login2">
<form name="newMem" method="post" action="LoginOk.jsp"  class="loginForm">  
 <table id="table" cellpadding=5 style=font-size:10pt;>

	     <tr>
		    <td colspan=3 align=center> <img src="images/logo.png" border=0>
			<br><br></td>
	     </tr>
         <tr>
			<td class="inform" width=100>ID</td>
			<td class="input" ><input type=text name="id">&nbsp <a href="javascript:checkId_logincheck()"><input type="button" value="아이디찾기"></a></td>		
		</tr>
		
		 </div>
		 
      </table><p>  <br> <a href="Login.jsp"><input type=button value="로그인하기"></a> <br><br><br>
  </form>
</center>
 <footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_index.jsp">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.
</footer>
</body>  
</html> 