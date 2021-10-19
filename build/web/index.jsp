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
        <link rel='shortcut icon' type='image/x-icon' href='assets/img/tem.ico' />
        <style>
            @import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
            .login-block{

                float:left;
                width:100%;
                padding : 25px 0;
            }
            .banner-sec{background:url(https://static.pexels.com/photos/33972/pexels-photo.jpg)  no-repeat left bottom; background-size:cover; min-height:500px; border-radius: 0 10px 10px 0; padding:0;}
            .container{background:#fff; border-radius: 10px; }
            .carousel-inner{border-radius:0 10px 10px 0;}
            .carousel-caption{text-align:left; left:5%;}
            .login-sec{padding: 50px 30px; position:relative;}
            .login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
            .login-sec .copy-text i{color:#FEB58A;}
            .login-sec .copy-text a{color:#E36262;}
            .login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #4883D4;}
            .login-sec h2:after{content:" "; width:100px; height:5px; background:#8CDAFF; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
            .btn-login{background: #6AC3CE; color:#fff; font-weight:600;}



        </style>   
    </head>
    <body  background="img/fondo.png">
        <section class="login-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 login-sec">
                        <img src="img/opustem.png">
                        <label></label>
                        <form class="login-form" action="Usuario" method="post">
                            <div class="form-group">
                                <label for="InputEmail1" class="text">Usuario:</label>
                                <input type="text" class="form-control" name="textUsuario" placeholder="Usuario">

                            </div>
                            <div class="form-group">
                                <label for="InputPassword1" class="text">Contraseña:</label>
                                <input type="password" class="form-control" name="textClave" placeholder="Contraseña">
                            </div>


                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input">
                                    <small>Recuérdame</small>
                                </label>
                            </div>
                            <div class="form-group"></div>
                            <div class="form-group">
                                <button class="btn btn-login col-md-12">Ingresar</button>
                                <input type="hidden" value="3" name="opcion">
                            </div>

                        </form>
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
                                    <img class="d-block img-fluid" src="img/fondo1.gif" alt="First slide">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div >
                                            <h2 class="text-dark">Opustem</h2>
                                            <p class="text-dark">Gestor de Tiempos y Permisos de empleados.</p>
                                        </div>	
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="img/fondo2.gif" alt="First slide">
                                    <div class="carousel-caption d-none d-md-block">	
                                        <h2 class="text-dark">Opustem</h2>
                                        <p class="text-dark">Creado y pensado para empresas.</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="img/fondo3.gif" alt="First slide">
                                    <div class="carousel-caption d-none d-md-block">	
                                        <h2 class="text-dark">Opustem</h2>
                                        <p class="text-dark">Fácil e intuitivo de utilizar.</p>
                                    </div>
                                </div>
                            </div>	   

                        </div>
                    </div>
                </div>
        </section>

        <div class="modal" id="modalError" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Datos incorrectos</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <center>
                        <img style="border-radius: 30px;" src="img/incorrecto.gif">
                        </center>
                        <div class="form-group"></div>
                        <p>Los datos para iniciar sesión son incorrectos, por favor vuelva a intentar.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            //$(function() {
            const error =<%=request.getParameter("mensajeError")%>;
            if (error) {
                $("#modalError").modal("show");
            }




//});

        </script>
    </body>
</html>
