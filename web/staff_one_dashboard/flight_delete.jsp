<%-- 
    Document   : flight_delete
    Created on : Oct 5, 2022, 12:20:33 PM
    Author     : avish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
 
 
<%
        String id = request.getParameter("transport_id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_management_system","root","");
        pst = con.prepareStatement("delete from taransport where transport_id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  

        response.sendRedirect("flights.jsp");
        
        %>
        
        <script>
            
            alert("Record Deletee");
            
       </script>
    </body>
</html>
