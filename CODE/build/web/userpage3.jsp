﻿<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
int countfds=0,countfly=0;
int cf=0,cf1=0;
String fname = null,sname=null,userid=null,id=null;
try{

   
   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
 	int pid=(Integer)(session.getAttribute("pid"));
   //fname=(String)session.getAttribute("fname");
   //sname=(String)session.getAttribute("sname");
   userid=(String)session.getAttribute("userid");
  
   String s = "select id,fname,sname,userid from reg where userid='"+userid+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   id=rs.getString(1);
   fname=rs.getString(2);
   sname=rs.getString(3);
   userid=rs.getString(4);
   System.out.println(fname);
   System.out.println(sname);
  session.setAttribute("fname1",fname);
  session.setAttribute("sname1",sname);
  session.setAttribute("id",id);
   
   }
   else
   out.print("Please check your login credentials");
  
   
  %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>A System to Filter Unwanted Messages from OSN User Walls</title>

<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />

</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		
    <h1 align="center"><font size="+3">A System to Filter Unwanted Messages from OSN User Walls 
      </font></h1>
		
	</div>
	
</div>
 
 

<div class='cssmenu'>
<ul>
   <li class='active '><a href="userpage.jsp"><span>HomePage</span></a></li>
 
  
   
   <li><a href="index.html"><span>Logout</span></a></li>
  
</ul>
</div>
<div id="page">
<h2>Welcome!&nbsp; 
       <font color="#FFFFCC"><font size="5"> <%=fname%></font></font>
        
        <font color="#FFFFCC"><font size="5"><%=sname%></font></font></h2>
		<div><img src="viewimage.jsp?id=<%=id%>" alt="" width="120" height="99" /></div>
		<%
 
}
catch(Exception e)
{
System.out.println(e);
}
%>
	<div id="leftbar" class="sidebar">
		<ul>
			<li>
				
				<ul>
					<br><br>
         <li><a href="friends.jsp"><font color="#FFFFFF" size="3">Find Friends</font></a></li>
		<li><a href="viewrequest.jsp"><font color="#FFFFFF" size="3">ViewFriendRequest</font></a></li>
        
		<li><a href="upload.jsp"><font color="#FFFFFF" size="3">Share Photo</font></a></li>
	    <li><a href="holder.jsp"><font color="#FFFFFF" size="3">FriendsList</font></a></li>
				</ul>
			</li>
			
			
			
		</ul>
	</div>
			
	
	</div>

<br><br>

	<div id="content">
<div style="position:absolute; left:400px; top:240px;"><font color="#FFFFFF" size="5"><font color="red"> 
    ImageView</font></font></div>
		<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">

		<div style="position:absolute; left:360px; top:331px; width: 358px; height: 140px;">
		<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">

		
		<fieldset>
      
    <legend><font color="#FFFFFF"><strong><font size="4">Image</font></strong></font></legend>

		
		<table align="center" height="150">
			
			
			<tr>
			<tr><td><img src="view.jsp?id=<%=(Integer)(session.getAttribute("pid"))%>" alt="" width="250" height="250" /></td></tr>
			</tr>
			<tr></tr>
			<tr><td><font color="#FFFFFF" size="+1"><strong><%=session.getAttribute("user")%> Can view this photo</strong></font></td></tr>
			<tr></tr>
			<tr></tr>
		

		<%
		//no of friends canview
	int fid=0;
	
 	Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
	String status="Confirm";
	String sql="select * from request where id='"+id+"' and status='"+status+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");;
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
			while(rs2.next()){
				if(rs2.getString("relationship").equals("Friends")){
					countfds=countfds+1;
				}
				if(rs2.getString("relationship").equals("Family")){
					countfly=countfly+1;
				}%>
				
			
			<%}
			
	}
catch(Exception ex)
	{
		System.out.println(ex);
	}
	  finally
	{
		con2.close();
		st2.close();
	}
 //end friends view
  %>
			<tr><td><font color="#FFFFFF" size="+1"><strong><%=countfds%> Friends can view this photo</strong></font></td></tr>
			<tr></tr>
			<tr></tr>
			<tr><td><font color="#FFFFFF" size="+1"><strong><%=countfly%> Family can view this photo</strong></font></td></tr>
  		</table>
				</fieldset>
</div>
		
		</div><!--end fragment-2-->
			
		</div>

	</div>
	<!-- end content -->
	<!-- start rightbar -->
	
	<!-- end rightbar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->

</body>
</html>
