<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>로그인 처리/판별</title>
</head>

<body>

<%
 	 String DB_URL="jdbc:mysql://localhost:3306/team";   
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");            
    String pass = request.getParameter("pass");  

     
    String jsql = "select  *  from member where memid = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   
    {
        if (pass.equals(rs.getString("mempasswd")))  
    	
        {
             session.setAttribute("sid", id);
 	    

             response.sendRedirect("main1.jsp");

		 } else {   
%>
      <br><br><br>
	  <center>
      <font size=6><b><로그인 오류!></b></font><p><br><br>
      <font color=black size=2>
            비밀번호가 잘못 되었습니다.  다시 확인해 주세요!<p>
			로그인 페이지로 돌아가시려면 
			<a href="Login.jsp" ><font><여기></font></a>를 클릭하시고, <p>
			메인 페이지로 가시려면 
			<a href="main1.html" ><font><여기></font></a>를 클릭하세요!
		</font>              
		</center>
<%       
        }         
    } else {    
 %>
       <br><br><br>
	  <center>
      <font  size=6><b><로그인 오류!></b></font><p><br><br>
	  <font color=black size=2>
			아이디가 존재하지 않습니다.	 다시 확인해 주세요!<p>
			로그인 페이지로 돌아가시려면 
			<a href="Login.jsp" ><font><여기></font></a>를 클릭하시고, <p>
			메인 페이지로 가시려면 
			<a href="main1.html" ><font><여기></font></a>를 클릭하세요!
	   </font>
	   </center>
<%
   }  
%>

</body>
</html>

