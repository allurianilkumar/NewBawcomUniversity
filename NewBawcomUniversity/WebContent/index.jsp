<%-- 
    Document   : index
    Created on : Oct 3, 2016, 5:38:58 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bawcom Union</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
  footer.footer {
    background: rgba(76, 109, 93, 0.31);
	}
  </style>
</head>
<body>

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
          <li class="active"><a href="index.jsp">Home<span class="sr-only">(current)</span></a></li>
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
          <input type="text" class="form-control" placeholder="Search Items Here">
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
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
          <img src="img/header.jpg" alt="Food" style="width: 1200px;height: 500px">
      </div>

      <div class="item">
          <img src="img/burger.jpg" alt="Burger" style="width: 1200px;height: 500px">
      </div>
    
      <div class="item">
          <img src="img/burger1.jpg" alt="Burger" style="width: 1200px;height: 500px">
      </div>

      <div class="item">
          <img src="img/pizza.jpg" alt="Pizza" style="width: 1200px;height: 500px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>
</body>
</html>
