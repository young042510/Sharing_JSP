<%@ page contentType="text/html;charset=UTF-8" %>
<html><head><title>로그인</title></head>

<script language="javascript">
function login_check() 
{
	if(document.login.id.value=="")
	{
    	alert("아이디를 입력해 주세요.");
    	document.login.id.focus();
    	return;	
    }

    if(document.login.password.value=="")
	{
    	alert("비밀번호를 입력해 주세요.");
    	document.login.password.focus();			
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
<center>
<br><br><br><br><br><br><br><br>
<form name="login" method="post" action="manager_LoginOk.jsp" target=_parent>  
     <table border=0 cellpadding=5 >
	     <tr>
		    <td colspan=3 align=center> <font size=6><b><관리자 로그인></b></font>
			<br><br><br></td>
	     </tr>
         <tr>
            <td><font size=2>관리자 ID :  </font></td>
			<td><input type="text" name="id"  style="width:120;height=20"></td>
			<td rowspan=2><a href="javascript:login_check()">
			<input type="button" value="로그인"></a></td>
         </tr>
         <tr>
            <td><font size=2>패스워드 : </font></td>
            <td><input type="password" name="password"  style="width:120;height=20"  onkeydown="onEnterSubmit()"></td>   
	     </tr>
      </table><p>       
		 
  </form>

 </center>                
</body>  
</html> 