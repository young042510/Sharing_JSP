<%@ page contentType="text/html;charset=UTF-8" %>
<html><head><title>로그인</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet"></head>
<script language="javascript"> 
function login_check()     
{
	if(document.login.id.value=="")
	{
    	alert("아이디를 입력해 주세요.");
    	document.login.id.focus();
    	return;	
    }

    if(document.login.pass.value=="")
	{
    	alert("비밀번호를 입력해 주세요.");
    	document.login.pass.focus();			
    	return;
    }
		
    document.login.submit();
}



function onEnterSubmit()                   
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13)  login.submit();
}
	

function login_focus()     
{											
   	document.login.id.focus();
   	return;
}
</script>



<body onLoad="login_focus()"> 
<header>
   <div id="logo">
		<a href="main1.jsp"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
	<div class="up-menu">|<a href="main1.jsp">&nbsp;Home&nbsp;</a></div>
	<div class="up-menu">|<a href="Login.jsp">&nbsp;로그인&nbsp;</a></div>
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
<center>
<br><br><br><br><br><br><br><br>


    <div class="login">
      <div class="login1">
      </div>
      <div class="login2">
<form name="login" method="post" action="LoginOk.jsp"  class="loginForm">  
 <table id="table" cellpadding=5 style=font-size:10pt;>

	     <tr>
		    <td colspan=3 align=center> <img src="images/logo.png" border=0>
			<br><br></td>
	     </tr>
         <tr>
            <td class="inform"><font size=2>아이디 :  </font></td>
			<td class="input"><input type="text" name="id" ></td>
			<td rowspan=2><a href="javascript:login_check()"><button>로그인</button></a></td>
         </tr>
         <tr>
            <td class="inform"><font size=2>패스워드 : </font></td>
            <td class="input"><input type="password" name="pass"onkeydown="onEnterSubmit()"></td>  
	     </tr>
		  <tr>
            <td colspan=3 align=center><br>
			<a href="InsertMember.jsp" >
			<input type="button" value="회원가입"></a>&nbsp;&nbsp
			<a href="logincheck_id.jsp">
			<input type="button" value="아이디 찾기"></a>&nbsp;&nbsp
			<a href="logincheck_pwd.jsp">
			<input type="button" value="비밀번호찾기"></a>
			 </td>
         </tr>
		 </div>
      </table><p>  <br><br><br>  <br><br><br>
  </form>
</center>
 <footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_index.jsp">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.
</footer>
</body>  
</html> 