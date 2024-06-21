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
  <script type="text/javascript">
        function validate()
        {
            var a=document.f1.i_type.value;
            if(a == "Please Select Food Type")
                {
                    alert('Please Choose Type of Food');
                    document.f1.i_type.focus();
                    return false;
                }
        }
    </script>
</head>
<body>
<%
    ArrayList li=new ArrayList();
    Statement odd=com.bawcom.db.DB.getConnect().createStatement();
    ResultSet rod=odd.executeQuery("select * from OrderHistory where confirmtime='Not Ready'");
    while(rod.next())
    {
       li.add(rod.getString(1)); 
    }

                    String i_n=null,i_pr=null,i_q=null,i_ty=null;
                    
                    String x=request.getQueryString();
                    x=x.replace("%20", " ");
                    if(x==null)
                    {
                        x="";
                    }
                    Statement s=com.bawcom.db.DB.getConnect().createStatement();
                    ResultSet r=s.executeQuery("select * from categories where i_name='"+x+"'");
                    if(r.next())
                    {
                        i_n=r.getString(2);  
                        i_pr=r.getString(3); 
                        i_q=r.getString(4);
                        i_ty=r.getString(1);
                    }
                    else
                    {
                        i_n=null;
                        i_pr=null;
                        i_q=null;
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
            <li class="active"><a href="AddItems.jsp">Add Items</a></li>
            <li><a href="ViewUsers.jsp">View Users</a></li>
            <li><a href="FoodItems.jsp">Food Items</a></li>
            <li><a href="OrderHistory.jsp">Order History</a></li>
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
      <div class="panel-heading">Add Items Here</div>
      <div class="panel-body">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Add Items</h2>
                    <hr class="light">
                        <div class="row">
                    <form action="Update" name="f1" method="post" onsubmit="return validate()">
                               <div class="form-group">
                                   <select class="form-control" name="i_type" id="select">
                                       <option>Please Select Food Type</option>
                                       <option><%=i_ty%></option>
                                       
                                   </select>
                                </div>
                                <div class="form-group">
                                  <input type="text" name="i_name" value="<%=i_n%>" placeholder="Enter Item Name" class="form-control" id="name" readonly>
                                </div>
                                <div class="form-group">
                                  <input type="text" name="i_price" value="<%=i_pr%>" placeholder="Enter Item Price" class="form-control" id="price" required>
                                </div>
                                <div class="form-group">
                                  <input type="text" name="i_quantity" value="<%=i_q%>" placeholder="Enter Item Quantity" class="form-control" id="quantity" required>
                                </div>
                               
                                <button type="submit" class="form-control btn btn-success">Submit</button>
                            </form> 
               </div>
                    <br><br><br><br>
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

