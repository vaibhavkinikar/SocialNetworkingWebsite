<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
<head>
<body>
<title>Registration Insert Page</title>




  
       <% 
        try
                {
				
           int a1=(Integer)(session.getAttribute( "id" ));
		String a=request.getParameter("fname");
        String b=request.getParameter("sname");		
        String c=request.getParameter("userid");
	    String d=request.getParameter("remail");
	    String e=request.getParameter("pass");
	    String f=request.getParameter("gender");
	    String g=request.getParameter("date");
		String h=request.getParameter("month");
		String i=request.getParameter("year");
		String j=a+" "+b;		
	            session.setAttribute("fname",a);
				session.setAttribute("sname",b);
				session.setAttribute("userid",c);
	   			session.setAttribute("name",j);
	  	  
	 
       Connection con=databasecon.getconnection();
        Statement st=con.createStatement();
		
        String sql="insert into reg(id,fname,sname,name,userid,remail,pass,gender,date,month,year) values ('"+a1+"','"+a+"','"+b+"','"+j+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"')";
		
        int x=st.executeUpdate(sql);
		if(x!=0){
		response.sendRedirect("owner.jsp?message=Successfully Registered");
	
		}
				else{
		response.sendRedirect("owner.jsp?message=fail");
		
		}
        con.close();
        st.close();
        }
        catch(Exception e)
                {
        out.println(e);
		
        }
        %>
       
  
        
  
</center>
  
       
  
        
  
        </td>
      
     
      
    </tr>
    </body>
  </table>
  <!-- End ImageReady Slices -->





