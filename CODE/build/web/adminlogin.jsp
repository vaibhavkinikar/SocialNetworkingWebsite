<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<html>
<head>
<title>A System to Filter Unwanted Messages from OSN User Walls</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name=null;
session.setAttribute("userid",userid);
session.setAttribute("pass",pass);

try{
	 String username = request.getParameter("userid");
            String password = request.getParameter("pass");        
                    
               if((username.equalsIgnoreCase("admin"))&&(password.equals("admin"))){
            response.sendRedirect("adminuser.jsp");
            
	
	}
	else{
		out.println("Enter correct username, password");		
	}
	
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


