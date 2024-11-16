<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
<head><title>    회원가입       </title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
</head>

<script language="javascript">

function checkID()		 
{  									
	var id = newMem.id.value;		

    if (id  == "")				
    {
		alert("ID를 입력해 주세요!"); 
		newMem.id.focus(); 
		return; 
    }

	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}                                       





function checkValue()             
{                                           
	if(newMem.id.value == "")     
    {
		alert("ID를 입력해 주세요!");  
		newMem.id.focus();					
		return;                        
    }

    if(newMem.password.value == "") 
    {
		alert("비밀번호를 입력해 주세요!");
		newMem.password.focus();
		return;
    }

    if(newMem.name.value == "") 
    {
		alert("성명을 입력해 주세요!");
		newMem.name.focus();
		return;
    }


    if(newMem.birthYear.value == "") 
    {
		alert("태어난 연도를 입력해 주세요!");
		newMem.birthYear.focus();
		return;
    }

    if(newMem.birthMonth.value == "") 
    {
		alert("태어난 달을 입력해 주세요!");
		newMem.birthMonth.focus();
		return;
    }

    if(newMem.birthDay.value == "") 
    {
		alert("태어난 날짜를 입력해 주세요!");
		newMem.birthDay.focus();
		return;
    }
	
    if(newMem.address.value == "") 
    {
		alert("주소를 입력해 주세요!");
		newMem.address.focus();
		return;
    }


	if(newMem.hp1.value == "") 
    {
		alert("휴대폰 앞자리 국번을 입력해 주세요!");
		newMem.hp1.focus();
		return;
    }

    if(newMem.hp2.value == "") 
    {
		alert("휴대폰 중간자리 번호를 입력해 주세요!");
		newMem.hp2.focus();
		return;
    }

    if(newMem.hp3.value == "") 
    {
		alert("휴대폰 끝자리 번호를 입력해 주세요!");
		newMem.hp3.focus();
		return;
    }
	
    if(newMem.email1.value == "") 
    {
		alert("이메일을 아이디를 입력해 주세요!");
		newMem.email1.focus();
		return;
    }
	 if(newMem.email2.value == "") 
    {
		alert("이메일 주소를 입력해 주세요!");
		newMem.email2.focus();
		return;
    }

    newMem.submit();   
}





function idFocus()        
{										
	newMem.id.focus();
	return;
}


</script>


<body onLoad="idFocus()">
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
<center>
 <br><br>
<img src="images/logo.png" border=0>
			<br><br>
		<div id="main">

    <h3>[회원가입]</h3><br><br>
  <div class="login">
	<div class="login1">
		정보를 입력해 주세요
	</div>
                                                                              
<form name="newMem" method=post action=InsertMemberResult.jsp>
<div id="main">

  <div class="login2">
	<table id="table" cellpadding="5" style="font-size:10pt">

		<tr>
			<td class="inform">ID</td>
			<td class="input" ><input type=text name="id">&nbsp <a href="javascript:checkID()"><input type="button" value="중복아이디"></a></td>		
		</tr>
		<tr>
			<td class="inform">비밀번호</td>
			<td class="input"><input type=password name="password" size=21></td>
		</tr>
		<tr>
			<td class="inform">성명</td>
			<td class="input"> <input type=text name="name"></td>
		</tr>
		<tr>
			<td class="inform">생년월일 </td>
			<td class="input">
				<input type=text name=birthYear size=4>년
				<input type=text name=birthMonth size=2>월
				<input type=text name=birthDay size=2>일
				<input type=radio name=solar value="양력" checked>양력
				<input type=radio name=solar value="음력">음력
			</td>
		</tr>
		<tr>
			<td class="inform">주소 </td>
			<td class="input"><input type=text name=address></td>
		</tr>
		<tr>
			<td class="inform">휴대폰번호 </td>
			<td class="input">
				<select name=hp1>
						<option value="010" selected>010
						<option value="011">011
						<option value="016">016
						<option value="017">017
						<option value="018">018
						<option value="019">019
				</select> -
				<input type=text name=hp2 size=4> -
				<input type=text name=hp3 size=4>
			</td>
			</tr>
			<tr>
			<td class="inform">이메일</td>
			<td class="input">
			<input type=text name=email1 size=4>@
				<select name=email2>
						<option value="naver.com">naver.com
						<option value="daum.com">daum.com
						<option value="google.com">google.com
				</select> 
		 
				
			</td>
			</tr>
			</div>
	</table><p>        
	<br><br>
	<input type=button value="회원가입" onClick="checkValue()">  
	<input type=reset value="취    소" >
</form>
</center>
<footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_index.jsp">관리자 로그인</a><br>
Copyright © 2022 Sharing. All rights reserved.
</footer>
</body>
</html>