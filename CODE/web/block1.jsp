<%-- 
    Document   : block
    Created on : Oct 2, 2013, 11:37:44 AM
    Author     : ibn
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String block = request.getParameter("text");



            /*  String   val1 = rs.getString("dise");
             String  t3 = " ";

             if (val1.indexOf(t3) >= 0) {
             }

             */
            //  session.setAttribute("id",block);

            System.out.println("value get is " + block);
            boolean bol = false;
            String getU = session.getAttribute("userid").toString();
            System.out.println("ID " + getU);

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");
            Statement st = con.createStatement();
            String Q = "select * from admin";// where word= '" + block + "'   ";
            ResultSet rs = st.executeQuery(Q);
            while (rs.next()) {
                String val1 = rs.getString("word");
                System.out.println("val1 is :" + val1);
                if (block.indexOf(val1) >= 0)
                    {
                     session.setAttribute("stUpdate", "block");
                    response.sendRedirect("msg1.jsp?" + block);
                    bol = false;
                    break;
                } else {
                    bol = true;
                }

            }
            //else {
            if (bol == true) {
                response.sendRedirect("fornonblock1.jsp?" + block);
            }


            /*   String Q = "select * from admin where word= '" + block + "'   ";

             ResultSet rs = st.executeQuery(Q);
             if (rs.next()) {
             if ((rs.getString("word").equals(block))) {
             //  response.sendRedirect("status.jsp?msg=Wrong");
             //out.println("Wrong Word..") ;
             response.sendRedirect("msg.jsp?" + block);

             }

             } else {
             response.sendRedirect("fornonBlock.jsp?" + block);
             }

          
             */












            /*    else{
             String name = null;
             //System.out.println("Word OK");
             Connection cons = databaseconnection.databasecon.getconnection();
             Statement sts = cons.createStatement();
             Statement sts1 = cons.createStatement();
             ResultSet rr = sts1.executeQuery("select * from reg where userid = '"+(String)session.getAttribute("userid")+"'");
             if(rr.next()){
             name = rr.getString("fname");
             }
             int ii = sts.executeUpdate("insert into update_ values('"+name+"','"+block+"')");
             if(ii!=0){
                       
             }
             else{
             out.println("Error");
             }
             }*/
        %>
    </body>
</html>
