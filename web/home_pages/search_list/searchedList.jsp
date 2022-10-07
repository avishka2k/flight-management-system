<%-- 
    Document   : searchedList
    Created on : Oct 4, 2022, 12:41:07 AM
    Author     : avish
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Search List</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alatsi&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top" id="mainNav" style="font-family: Allerta, sans-serif;margin: auto;background: var(--bs-gray-800);position: relative;">
        <div class="container">
            <div class="d-flex d-sm-flex d-lg-flex d-xxl-flex justify-content-between align-items-center align-items-sm-center align-items-lg-center align-items-xxl-center" style="width: 1000px;margin: auto;">
                <div><a class="navbar-brand" href="index.html">Phoenix Airline<br></a></div>
                <div><button data-bs-toggle="collapse" data-bs-target="#navbarResponsive" class="navbar-toggler" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation" style="color: var(--bs-white);"><i class="fa fa-bars"></i></button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item"><a class="nav-link" href="../home.html" style="color: var(--bs-white);">Flights</a></li>
                            <li class="nav-item"><a class="nav-link" href="#" style="color: var(--bs-white);">About us</a></li>
                            <li class="nav-item"><a class="nav-link" href="#" style="color: var(--bs-white);">Contact us</a></li>
                            <li class="nav-item"><a class="nav-link text-center d-md-flex justify-content-md-center" href="../../login_and_register/user_staff_login.html" style="background: #434aff;color: var(--bs-white);padding-right: 30px;padding-left: 30px;">LogIn</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div>
        <div style="padding: 300px;padding-top: 40px;padding-bottom: 40px;">
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/flight_management_system";
        Connection con=DriverManager.getConnection(url, "root","");
        
        Statement st= con.createStatement();
        
        String country_from = request.getParameter("country_from");
        String country_to = request.getParameter("country_to");
        String depart_date = request.getParameter("depart_date");
        String return_date = request.getParameter("return_date");
        String flight_class = request.getParameter("flight_class");
        
        
        String search_sql="SELECT * FROM taransport WHERE country_from='"+country_from+"' || country_to='"+country_to+"'";
        ResultSet rs=st.executeQuery(search_sql);
        while(rs.next())
    {
    String tid = rs.getString("transport_id");
%>
            <div class="card" style="margin-bottom: 22px;">
                <div class="card-body d-lg-flex d-xxl-flex justify-content-between align-items-lg-center align-items-xxl-center" style="padding: 13px;padding-right: 25px;">
                    <div class="d-lg-flex d-xxl-flex align-items-lg-center align-items-xxl-center">
                        <div><img style="width: 178px;height: 177px;"></div>
                        <div style="margin-left: 38px;">
                            <h4 style="margin-bottom: 29px;font-family: ABeeZee, sans-serif;"><%=rs.getString("country_to")%></h4>                         
                            <h6 class="text-muted mb-2" style="font-family: ABeeZee, sans-serif;font-size: 13px;">Class: <%=rs.getString("flight_class")%></h6>
                            <h6 class="text-muted mb-2" style="font-family: ABeeZee, sans-serif;font-size: 13px;">Depart <%=rs.getString("depart_date")%></h6>
                        </div>
                    </div>
                    <div style="padding-bottom: 40px;">
                        <div style="text-align: center;">
                            <div>
                                <p style="font-family: ABeeZee, sans-serif;font-weight: bold;font-size: 30px;"><%=rs.getString("price")%></p>
                            </div>
                            <div><a href="../../add_flights?transport_id=<%=tid%>" style="background: var(--bs-blue);padding: 11px;padding-right: 30px;padding-left: 30px;color: var(--bs-card-bg);font-family: 'Open Sans', sans-serif;">Select</a></div>
                        </div>
                    </div>
                </div>
            </div>
<% }
    }
      catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
%>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/clean-blog.js"></script>
</body>

</html>
