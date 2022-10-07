<%-- 
    Document   : flights
    Created on : Oct 5, 2022, 10:45:02 AM
    Author     : avish
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/material-icons.min.css">
    
    <style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-text mx-3"><span><strong>Phoenix Airline</strong></span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link active" href="flights.jsp"><i class="material-icons">flight</i><span>Flights</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="tickets.jsp"><i class="fas fa-ticket-alt"></i><span>Tickets</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="users.jsp"><i class="fas fa-users"></i><span>Users</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <div>
                            <h4>Staff One</h4>
                        </div>
                        <ul class="navbar-nav flex-nowrap ms-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="me-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="d-none d-lg-inline me-2 text-gray-600 small">Valerie Luna</span><img class="border rounded-circle img-profile" src="assets/img/avatars/avatar1.jpeg"></a>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in"><a class="dropdown-item" href="#"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" href="#"><i class="fas fa-cogs fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Settings</a><a class="dropdown-item" href="#"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Activity log</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Flights</h3>
                    <div class="row d-xl-flex justify-content-xl-center mb-3">
                        <div class="col-lg-8" style="width: 894.984px;">
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-body">
                                            <form action="../addFlight" method="POST">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="from"><strong>From</strong></label>
                                                            <input class="form-control" type="text" placeholder="Country, city or airport" name="add_from"></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="to"><strong>To</strong></label>
                                                            <input class="form-control" type="text" placeholder="Country, city or airport" name="add_to"></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="depart"><strong>Depart</strong></label>
                                                            <input class="form-control" type="date" name="add_depart_date"></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="return"><strong>Return</strong></label>
                                                            <input class="form-control" type="date" name="add_return_date"></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="class"><strong>Class</strong></label>
                                                            <input class="form-control" type="text" id="username-1" placeholder="" name="add_calss"></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="price"><strong>Price</strong></label>
                                                            <input class="form-control" type="text" placeholder="$" name="add_price"></div>
                                                    </div>
                                                </div>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="submit">Add new flights</button></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                                      
<div style="overflow-x:auto;">
  <table>
    <tr>
      <th>From</th>
      <th>To</th>
      <th>Depart</th>
      <th></th>
      <th></th>
    </tr>
    <%
    try{
    String url = "jdbc:mysql://localhost:3306/flight_management_system";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(url,"root","");
    Statement st= con.createStatement();
    
    String sql = "SELECT * FROM taransport ORDER BY transport_id DESC";
    
    ResultSet rs = st.executeQuery(sql);
    while(rs.next()){
     String id = rs.getString("transport_id");
    %>
    <tr>
      <td><%=rs.getString("country_from")%></td>
      <td><%=rs.getString("country_to")%></td>
      <td><%=rs.getString("depart_date")%></td>
      <td class="d-xl-flex justify-content-xl-end">
      <a href="flight_delete.jsp?transport_id=<%=id%>">Delete</a>
      </td>
      <td class="d-xl-flex">
      <a href="flight_delete.jsp?transport_id=<%=id%>">Edit</a>
      </td>
    </tr>
    <% }
    }
        catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
%>
  </table>
</div>
</div>
</div>
    <footer class="bg-white sticky-footer">
        <div class="container my-auto">
           <div class="text-center my-auto copyright"><span>Copyright © Brand 2022</span></div>
        </div>
    </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
