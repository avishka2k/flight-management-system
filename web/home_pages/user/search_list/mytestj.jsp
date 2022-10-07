<%-- 
    Document   : mytestj
    Created on : Oct 4, 2022, 1:27:27 AM
    Author     : avish
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
   try{
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/flight_management_system";
        Connection con=DriverManager.getConnection(url, "root","");
        
        Statement st= con.createStatement();
        
        String name = request.getParameter("n");
        
        String search_sql="select * from mytesttable where name='"+name+"'";
        ResultSet rs=st.executeQuery(search_sql);
        while(rs.next())
    {
%>
<p><%=rs.getString("loc")%></p>
<% }
    }
      catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
%>
    </body>
</html>
