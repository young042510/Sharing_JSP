<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
boolean isExist = false;

try {
    	String DB_URL="jdbc:mysql://localhost:3306/team";   
        String DB_password="root"; 
        String DB_PASSWORD="1234"; 
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_password, DB_PASSWORD); 
        
	    String password = request.getParameter("password");
	    
		String jsql = "select * from member where mempasswd = ?";   
        PreparedStatement  pstmt  = con.prepareStatement(jsql);
	    pstmt.setString(1, password);

	    ResultSet rs = pstmt.executeQuery();  	
        
        if(rs.next())              //   레코드(동일한 password)가 존재하면
              isExist = true;
        else                          //   레코드(동일한 password)가 존재하지 않으면  
             isExist = false;

    } catch (Exception e) {
        	out.println(e);
}
%>

<html>
<head>
<title>사용자 password 중복 검사</title>
</head>

<body bgcolor="#ffffff">
<br>
<table wpasswordth="228" border="0" cellspacing="1" cellpadding="3" height="50">
    <tr>
        <td height="25" align=center >
          password:  <%=request.getParameter("password")%>
        </td>
    </tr>
    
    <tr>
        <td height="25" align=center>
  <%  
		   if(isExist)  
                 out.println("이미 존재하는 비밀번호 입니다.");
	       else 
                 out.println("사용 가능한 비밀번호 입니다. ");
  %>
        </td>
    </tr>

    <tr>
        <td align=center>
            <a href="javascript:window.close()"><input type="button" value="완료"></a>
        </td>
    </tr>
</table>
</body>
</html>