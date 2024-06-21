<%-- 
    Document   : index
    Created on : Oct 3, 2016, 5:38:58 PM
    Author     : LENOVO
--%>

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
String x=request.getParameter("search");
if(x==null)
                    {
                        x="";
                    }
    x=x.replace("%20", " ");
Statement srt=com.bawcom.db.DB.getConnect().createStatement();
    ResultSet srs=srt.executeQuery("select * from categories where i_name like '%"+x+"%' ");
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
        <a class="navbar-brand" href="index.jsp">Bawcom Union</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="index.jsp">Home<span class="sr-only">(current)</span></a></li>
          <li><a href="AboutUs.jsp">About Us</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Food Categories<span class="caret"></span></a>
          <ul class="dropdown-menu">
              <li><a href="VegDemo.jsp">Vegetarian</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="NonVegDemo.jsp">Non Vegetarian</a></li>
          </ul>
        </li>
      </ul>
        <form class="navbar-form navbar-left" action="SerchDemo.jsp">
        <div class="form-group">
          <input type="text" name="search" class="form-control" placeholder="Search Items Here">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="ContactUs.jsp">Contact Us</a></li>
        <li><a href="" data-toggle="modal" data-target="#myModal">Register</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="" data-toggle="modal" data-target="#myLogModal">Student Login</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="" data-toggle="modal" data-target="#myAdminLogModal">Admin Login</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- Model -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content"  style="background-image: url('img/burger1.jpg')">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color: white"><b>Register Now</b></h4>
      </div>
      <div class="modal-body">
          <form name="reg" action="Register" method="post" onsubmit="return validate()"> 
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-user"></span>
            </span>
            <input type="text" class="form-control" id="st_id" name="std_id" placeholder="Student ID" aria-describedby="basic-addon1" >
            <br>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-eye-open"></span>
            </span>
            <input type="password" class="form-control" id="st_id" name="std_pwd" placeholder="Student Password" aria-describedby="basic-addon1" >
            <br>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-eye-close"></span>
            </span>
            <input type="password" class="form-control" id="st_id" name="re_std_pwd" placeholder="Re Enter Student Password" aria-describedby="basic-addon1" >
            <br>
        </div>
          <br>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-envelope"></span>
            </span>
            <input type="email" class="form-control" id="st_email" name="email" placeholder="Student Email" aria-describedby="basic-addon1" >
            <br>
        </div>
          <br>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-earphone"></span>
            </span>
            <input type="text" class="form-control"  id="st_num" name="std_number" placeholder="Student Mobile Number" aria-describedby="basic-addon1" >
            <br>
        </div>
          <br>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-home"></span>
            </span>
            <textarea class="form-control" name="std_addrs"  id="st_add" placeholder="Student Address" aria-describedby="basic-addon1"></textarea>
            <br>
        </div>
          <br>
          <button type="submit" class="form-control btn btn-success" style="background-color: #ee4b28">Register Now</button>
          </form>
      </div>
      <div class="modal-footer">
          
      </div>
    </div>

  </div>
</div>
<!-- End Model-->
<!-- Login Model-->
<div id="myLogModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" style="background-image: url('img/pizza.jpg')">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color: white"><b>Login Here</b></h4>
      </div>
      <div class="modal-body">
          <form action="Login" name="login" method="post" onsubmit="return logFun()">
           <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-user"></span>
            </span>
            <input type="text" class="form-control"  id="std_id" name="std_id" placeholder="Student ID" aria-describedby="basic-addon1" >
            <br>
        </div>
          <br>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-lock"></span>
            </span>
            <input type="password" class="form-control" name="std_pwd"  id="st_pwd" placeholder="Student Password" aria-describedby="basic-addon1">
            <br>
        </div>
          <br>
          <button type="submit" class="form-control btn btn-success" style="background-color: #ee4b28">Login Now</button>   
          </form>
        
      </div>
      <div class="modal-footer">
        
      </div>
    </div>

  </div>
</div>
<!-- End Login Model -->

    <!-- Admin Login Modal content-->
    <div id="myAdminLogModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" style="background-image: url('img/pizza.jpg')">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color: white"><b>Admin Login Here</b></h4>
      </div>
      <div class="modal-body">
          <form action="Login" name="login" method="post" onsubmit="return logFun()">
           <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-user"></span>
            </span>
            <input type="text" class="form-control"  id="std_id" name="std_id" placeholder="Administrator Name" aria-describedby="basic-addon1" >
            <br>
        </div>
          <br>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <span class="glyphicon glyphicon-lock"></span>
            </span>
            <input type="password" class="form-control" name="std_pwd"  id="st_pwd" placeholder="Administrator Password" aria-describedby="basic-addon1">
            <br>
        </div>
          <br>
          <button type="submit" class="form-control btn btn-success" style="background-color: #ee4b28">Admin Login Now</button>   
          </form>
        
      </div>
      <div class="modal-footer">
        
      </div>
    </div>

  </div>
</div>
<!-- End Admin Login Model -->
<!-- Slider Section -->
<div class="mySlider">
    <div class="container">
        
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
       <div class="panel panel-success">
   <div class="panel-heading">Searched Items Are</div>
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
            <table id="t01" style="width: 100%">
                                          <tr>
                                            <th>Item Image</th>
                                            <th>Item Type</th>
                                            <th>Item Name</th>
                                            <th>Item Prize</th>
                                            <th>Item Quantity</th>
                                           
                                          </tr>
                                          <tr>
                                              <%
                                              while(srs.next())
                                              {
                                              %>
                                            <td><img src="file/<%=srs.getString(5)%>" class="img-rounded" alt="Cinque Terre" width="100" height="100"></td>
                                            <td><%=srs.getString(1)%></td>
                                            <td><%=srs.getString(2)%></td>
                                            <td><%=srs.getString(3)%>$</td>
                                            <td><%=srs.getString(4)%></td>
                                            
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
<!-- End Slider Section -->
</body>
</html>

