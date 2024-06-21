<%-- 
    Document   : index
    Created on : Oct 3, 2016, 5:38:58 PM
    Author     : LENOVO
--%>

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
                    Statement stmt=com.bawcom.db.DB.getConnect().createStatement();
                    ResultSet rst=stmt.executeQuery("select * from orderdetails where std_id='"+student_id+"' and item_status='Que'");
                    ArrayList al=new ArrayList();
                    while(r.next())
                    {
                        al.add(r.getString(1));
                    }
                    Statement st=com.bawcom.db.DB.getConnect().createStatement();
                    ResultSet rs=st.executeQuery("select * from categories where i_name like '%"+x+"%' and cat_type='Vegetarian'");
                    
                    %>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="HomePage.jsp">Student Home<span class="sr-only">(current)</span></a></li>
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
          <li class="active"><a href="ViewCart.jsp">View Cart [<%=al.size()%>]</a></li>
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
      <div class="panel-heading">View Ordered Items</div>
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
        <div style="float: left;width:75%">
            <table id="t01" style="width: 100%">
                                          <tr>
                                            <th>Item Image</th>
                                            <th>Item Type</th>
                                            <th>Item Name</th>
                                            <th>Item Prize</th>
                                            <th>Item Quantity</th>
                                            <th>Ordered Time</th>
                                            <th>Remove Item</th>
                                          </tr>
                                          <tr>
                                              <%
                                                  int gn=0,tot=0;
                                                  String nme=null;
                                              while(rst.next())
                                              {
                                              %>
                                            <td><img src="file/<%=rst.getString(4)%>" class="img-rounded" alt="Cinque Terre" width="100" height="100"></td>
                                            <td><%=rst.getString(5)%></td>
                                            <td><%=rst.getString(6)%></td>
                                            <td><%=rst.getString(7)%>$</td>
                                            <td><%=rst.getString(8)%></td>
                                            <td><%=rst.getString(9)%></td>
                                            <td><a href="Remove?<%=rst.getString(9)%>,<%=rst.getString(6)%>,<%=rst.getString(8)%>">Remove Item</a></td>
                                            <%
                                                gn=Integer.parseInt(rst.getString(7));
                                                tot=tot+gn;
                                                nme=rst.getString(6);
                                            %>
                                          </tr>
                                          
                                            <%
                                            }
                                            %>
                                    </table>
      </div>
                                    <div style="float: left;">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
            <div class="row" style="float: left">
            <div class="col-lg-12">
                <div class="responsive">
                    <br><br>
                    <a href="" data-toggle="modal" data-target="#myModal" class="page-scroll btn btn-success btn-xl sr-button">Total Amount: <b><%=tot%></b> $ <br><br> Pay Now</a>
                </div>
            </div>
        </div>
                <!-- Pay Bill Online -->
                    <div id="myModal" class="modal fade" role="dialog">
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"><b>Pay Online</b></h4>
                          </div>
                          <div class="modal-body">
                              <form action="Pay" method="post" name="pay" onsubmit="return validate()">
                                <div class="form-group">
                                    <input type="hidden" class="form-control" name="nme" value="<%=nme%>" >
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="amount" value="<%=tot%> $" readonly>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" name="name" placeholder="Name of Card">
                                        <option>Choose Card Type</option>
                                        <option>VISA</option>
                                        <option>Master Card</option>
                                        <option>Mastro Card</option>
                                        <option>American Express</option>
                                        <option>Discover</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="card" placeholder="Card Number">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="exp" placeholder="Enter Expiry Date MM/YY">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="cvv" placeholder="Enter CVV">
                                </div>
                                <button type="submit" class="form-control btn btn-success">Pay Now</button>
                              </form>
                                
                          </div>
                          <div class="modal-footer">
                          </div>
                        </div>
                      </div>
                    </div>
                <!-- End Pay Bill Online-->
    </div>

  </div>
</div>
</div>
<!-- End Slider Section -->
</body>
</html>

