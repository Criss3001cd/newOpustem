<%-- 
    Document   : index
    Created on : 10/05/2021, 07:56:39 PM
    Author     : duban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <style>
            @import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
.login-block{
    background: #4883D4;  /* fallback for old browsers */
background: -webkit-linear-gradient(to bottom, #8CDAFF, #4883D4);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to bottom, #8CDAFF, #4883D4); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
float:left;
width:100%;
padding : 50px 0;
}
.banner-sec{background:url(https://static.pexels.com/photos/33972/pexels-photo.jpg)  no-repeat left bottom; background-size:cover; min-height:500px; border-radius: 0 10px 10px 0; padding:0;}
.container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);}
.carousel-inner{border-radius:0 10px 10px 0;}
.carousel-caption{text-align:left; left:5%;}
.login-sec{padding: 50px 30px; position:relative;}
.login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
.login-sec .copy-text i{color:#FEB58A;}
.login-sec .copy-text a{color:#E36262;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #4883D4;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#8CDAFF; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #4883D4; color:#fff; font-weight:600;}
.banner-text{width:70%; position:absolute; bottom:40px; padding-left:20px;}
.banner-text h2{color:#fff; font-weight:600;}
.banner-text h2:after{content:" "; width:100px; height:5px; background:#FFF; display:block; margin-top:20px; border-radius:3px;}
.banner-text p{color:#fff;}
            
        </style>   
    </head>
    <body>
        <section class="login-block">
    <div class="container">
	<div class="row">
		<div class="col-md-4 login-sec">
		    <h2 class="text-center">Login Now</h2>
		    <form class="login-form" action="Usuario" method="post">
  <div class="form-group">
    <label for="InputEmail1" class="text">Username</label>
    <input type="text" class="form-control" name="textUsuario" placeholder="Username">
    
  </div>
  <div class="form-group">
    <label for="InputPassword1" class="text">Password</label>
    <input type="password" class="form-control" name="textClave" placeholder="Password">
  </div>
  
  
    <div class="form-check">
    <label class="form-check-label">
      <input type="checkbox" class="form-check-input">
      <small>Remember Me</small>
    </label>
    <button class="btn btn-login float-right">Ingresar</button>
    <input type="hidden" value="3" name="opcion">
  </div>
      <div>
                <% if (request.getAttribute("mensajeError") != null) {%>
                <div style="color: red;">${mensajeError}</div>
                <%} else {%>
                <div style="color: blue;">${mensajeÉxito}</div>
                <% }%>
            </div>
  
</form>
<div class="copy-text">Created with <i class="fa fa-heart"></i> to Opustem</div>
		</div>
		<div class="col-md-8 banner-sec">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                 <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
            <div class="carousel-inner" role="listbox">
    <div class="carousel-item active">
      <img class="d-block img-fluid" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="First slide">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
            <h2>Opustem</h2>
            <p>Opustem es un gestor de Tiempos y Permisos de empleados, creado y pensado en empresas. Fácil e intuitivo de utilizar.</p>
        </div>	
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block img-fluid" src="https://www.billin.net/blog/wp-content/uploads/2020/09/Certificado-de-empresa-1140x760.jpg" alt="First slide">
      <div class="carousel-caption d-none d-md-block">	
    </div>
    </div>
    <div class="carousel-item">
      <img class="d-block img-fluid" src="https://cdn.pixabay.com/photo/2020/05/26/17/57/internet-5224095_960_720.jpg" alt="First slide">
      <div class="carousel-caption d-none d-md-block">	
    </div>
  </div>
            </div>	   
		    
		</div>
	</div>
</div>
</section>
        

    </body>
</html>
