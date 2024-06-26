<%-- 
    Document   : index
    Created on : Oct 3, 2016, 5:38:58 PM
    Author     : LENOVO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bawcom Union</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
    Statement st=com.bawcom.db.DB.getConnect().createStatement();
    ResultSet rs=st.executeQuery("select * from student_register");
    ArrayList li=new ArrayList();
    Statement odd=com.bawcom.db.DB.getConnect().createStatement();
    ResultSet rod=odd.executeQuery("select * from orderhistory where confirmtime='Not Ready'");
    while(rod.next())
    {
       li.add(rod.getString(1)); 
    }   
%>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="AdminHome.jsp">Bawcom Union</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="AdminHome.jsp">Admin Home<span class="sr-only">(current)</span></a></li>
            <li><a href="AddItems.jsp">Add Items</a></li>
            <li class="active"><a href="ViewUsers.jsp">View Users</a></li>
            <li><a href="FoodItems.jsp">Food Items</a></li>
            <li><a href="OrderHistory.jsp">Order History</a></li>
            <li><a href="ContactDetails.jsp">Contact Details</a></li>
      </ul>
        <form class="navbar-form navbar-left" action="Search.jsp">
        <div class="form-group">
          <input type="text" class="form-control" name="search" placeholder="Search Items Here">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="StudentOrders.jsp">Student Orders [<%=li.size()%>]</a></li>
          <li><a href="index.jsp">Logout</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

    
<!-- Slider Section -->
<div class="mySlider">
    <div class="container">
        
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
       <div class="panel panel-success">
      <div class="panel-heading">View Users</div>
      <div class="panel-body">
          <table id="t01" style="width: 100%">
                                          <tr>
                                            <th>Student ID</th>
                                            <th>Student Email</th>
                                            <th>Student Address</th>
                                            <th>Unlock Student</th>
                                            <th>Lock Student</th>
                                            <th>Status</th>
                                          </tr>
                                          <tr>
                                              <%
                                              while(rs.next())
                                              {
                                              %>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(3)%></td>
                                            <td><%=rs.getString(5)%></td>
                                            <td><a href="Unlock?<%=rs.getString(1)%>">Unlock</a></td>
                                            <td><a href="Lock?<%=rs.getString(1)%>">Lock</a></td>
                                            <td><%=rs.getString(6)%></td>
                                          </tr>
                                          <%
                                          }
                                          %>
                                    </table>
<style>
table#t01 tr:nth-child(even) {
    background-color: #ffa500;
}
table#t01 tr:nth-child(odd) {
   background-color:#ffa500;
}
table#t01 th {
    background-color: black;
    color: white;
}
table#t01 tr {
    background-color: black;
    color: white;
}
table#t01 tr td a {
    color: white;
}
</style>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                                
                            </div>
            </div>
            
        </div> 
      </div>
    </div>

  </div>
</div>
</div>
<!-- End Slider Section -->
</body>
</html>

