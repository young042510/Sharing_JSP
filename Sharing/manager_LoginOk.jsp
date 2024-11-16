<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
<title>로그인 결과</title>
</head>

 <body>
 <center>

<%
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");  
    String password = request.getParameter("password");  
    String jsql = "select * from manager where managerid = ? ";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   
    {
          if (password.equals(rs.getString("managerpasswd")))
      
          {
              session.setAttribute("sid", id);
 	      

              response.sendRedirect("manager_index.jsp");  	
		   }  else {  
%>
           <br><br><br>
	       <font><관리자 로그인 오류!></font><p><br><br>
           <font>
                비밀번호가 잘못 되었습니다.  다시 확인해 주세요!<p>
		        로그인 페이지로 돌아가시려면 
		 	    <a href="manager_Login.jsp">여기</a>를 클릭하시고, <p>
		 	    메인 페이지로 돌아가시려면
			    <a href="main1.html">여기</a>를 클릭하세요!
		   </font>              
<%       
          }        
    } else {   
 %>
       <br><br><br>
      <font><관리자 로그인 오류!></font><p><br><br>
	  <font>
			아이디가 존재하지 않습니다.	 다시 확인해 주세요!<p>
			로그인 페이지로 돌아가시려면 
			<a href="manager_Login.jsp">여기</a>를 클릭하시고, <p>
			메인 페이지로 돌아가시려면
			<a href="main1.html">여기</a>를 클릭하세요!
	   </font>

<%
   }  
%>
</center>
</body>
</html>