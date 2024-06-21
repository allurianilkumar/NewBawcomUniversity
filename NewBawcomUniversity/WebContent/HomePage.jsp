<%-- 
    Document   : index
    Created on : Oct 3, 2016, 5:38:58 PM
    Author     : LENOVO
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
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
        <a class="navbar-brand" href="HomePage.jsp">Bawcom Union</a>
    </div>
                    <%
                    String x=request.getParameter("search");
                    if(x==null)
                    {
                        x="";
                    }
                    String student_id=(String)session.getAttribute("student_id");
                    Statement mt=com.bawcom.db.DB.getConnect().createStatement();
                    ResultSet r=mt.executeQuery("select * from orderdetails where std_id='"+student_id+"' and item_status='Que'");
                    ArrayList al=new ArrayList();
                    ArrayList al1=new ArrayList();
                    HashSet<String> hs=new HashSet<String>();
                    while(r.next())
                    {
                        al.add(r.getString(1));
                    }
                    Statement st=com.bawcom.db.DB.getConnect().createStatement();
                    ResultSet rs=st.executeQuery("select * from categories where i_name like '%"+x+"%'");
                    
                    %>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li class="active"><a href="HomePage.jsp">Student Home<span class="sr-only">(current)</span></a></li>
            <li><a href="PrintReceipt.jsp">Print Receipt</a></li>
            <li><a href="OrderTrack.jsp">Order Tracking</a></li>
      </ul>
        <form class="navbar-form navbar-left" action="SearchItems.jsp">
        <div class="form-group">
          <input type="text" class="form-control" name="search" placeholder="Search Items Here">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="ViewCart.jsp">View Cart [<%=al.size()%>]</a></li>
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
      <div class="panel-heading">Order Items Here</div>
      <div class="panel-body">
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
                
                <div style="width: 75%;float: left">
                    <table id="t01" style="width: 100%">
                                          <tr>
                                            <th>Item Image</th>
                                            <th>Item Type</th>
                                            <th>Item Name</th>
                                            <th>Item Prize</th>
                                            <th>Item Quantity</th>
                                            <th>Place Order</th>
                                          </tr>
                                          <tr>
                                              <%
                                              while(rs.next())
                                              {
                                                hs.add(rs.getString(1)); 
                                              %>
                                            <td><img src="file/<%=rs.getString(5)%>" class="img-rounded" alt="Cinque Terre" width="100" height="100"></td>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(3)%>$</td>
                                            <td><%=rs.getString(4)%></td>
                                            <td><a href="Order?<%=rs.getString(5)%>,<%=rs.getString(1)%>,<%=rs.getString(2)%>,<%=rs.getString(3)%>,1">Order Now</a></td>
                                          </tr>
                                            <%
                                            }
                                            %>
                     </table>
                </div>
                <div style="width: 5%;float: left">
                    &nbsp;&nbsp;
                </div>
                <div style="width: 20%;float: left">
                    <br><br>
                    <table id="t01"><tr>
                            <th><h2>Categories</h2></th></tr>
                                            <tr>
                 <%
                 Iterator<String> itr=hs.iterator();
                 while(itr.hasNext())
                   {
                     String xc=itr.next();
                     String xy=itr.next();
                 %>
                   <td>   <a href="Category.jsp?<%=xc%>"><h3><%=xc%></h3></a> </td></tr>
                   <tr>
                    <td>   <a href="Category.jsp?<%=xy%>"><h3><%=xy%></h3></a> </td>
                    </tr>
                    <%  
                   }
                 %>   
                    </table>
                </div>
            
      </div>
    </div>

  </div>
</div>
</div>
<!-- End Slider Section -->
</body>
</html>

