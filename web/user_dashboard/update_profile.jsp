<%-- 
    Document   : update_profile
    Created on : Oct 7, 2022, 9:09:21 PM
    Author     : avish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Update Profile</h3>
                        <% 
                   String user_id=session.getAttribute("userID").toString();
                   int a=Integer.parseInt(user_id);
                   try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        String url="jdbc:mysql://localhost:3306/testair";
                        Connection con=DriverManager.getConnection(url, "root","");
                        
                        Statement st= con.createStatement();
                        
                        String uname=request.getParameter("username");
                        String Lname=request.getParameter("first_name");
                        String Fname=request.getParameter("last_name");
                        String Email=request.getParameter("email");
               
                        String sql1="UPDATE client SET FirstName='"+Fname+"' where user_id='"+a+"'";
                        st.executeUpdate(sql1);
                          
                        String sql2="UPDATE client SET FirstName='"+Lname+"' where user_id='"+a+"'";
                        st.executeUpdate(sql2);
                        
                        String sql3="UPDATE client SET FirstName='"+Email+"' where user_id='"+a+"'";
                         st.executeUpdate(sql3);
                        int VNo=Integer.parseInt(request.getParameter("num"));
                        String sql5="UPDATE client SET clvno='"+VNo+"' where user_id='"+a+"'";
                         st.executeUpdate(sql5);
                   
                    }
                      catch(Exception e)
                    {
                        System.out.println(e.getMessage());
                    }
                      %>
                      <form action="StaffDash.html">
                          <input type="submit" value="home"/>
                      </form>
    </body>
</html>
