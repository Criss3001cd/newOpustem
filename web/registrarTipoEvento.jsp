<%-- 
    Document   : registrarTipoEvento
    Created on : 6/09/2021, 12:36:09 AM
    Author     : juanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
     <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Menú</title> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> 

    </head> 
    <body>

        <div class="container col-md-12"> 
            <nav class="navbar navbar-dark bg-dark "> 
             
            <h1 class="text-light font-italic">Bienvenido: </h1> 
            <form method="post" action="#"> 
            <button type="submit" class="btn btn-success mb-2">Cerrar Sesión</button> 
        
            </form> 
        </nav> 
    </div> 

        <div class="container col-md-4"> 
            <nav class="navbar navbar-expand-lg navbar-light bg-light"> 
                <div class="collapse navbar-collapse"> 
                    <a class="navbar-brand" href="consultarPermiso.jsp">Permisos</a> 
                    <a class="navbar-brand" href="consultarUsuario.jsp">Usuario</a> 
                    <a class="navbar-brand" href="consultarEvento.jsp">Eventos</a> 
                    <a class="navbar-brand" href="consultarSancion.jsp">Sanciones</a> 
                </div> 
            </nav> 
    </div> 
    <center> 

        <h1>Registro de Tipo Evento</h1> 

    </center> 
        <div class="container"> 
            <form action="TipoEvento" method="post"> 
                <div class="form-row"> 
                    <div class="form-group col-md-4"> 
                        <label for="">Nombre Evento</label> 

                        <br> 
                        <input type="text" class="form-control" required="required" name="textNombreEvento"> 
                    </div> 
                </div> 
                <div class="form-row"> 
                    <div class="form-group col-md-12"> 
                        <label for="">Descripción:</label> 
                        <textarea name="textDescripcion" class="form-control" id="" cols="10" rows="5"></textarea> 

                    </div> 
                </div> 
                <div class="form-row"> 
                <div class="form-group col-md-4"></div> 
                <div class="form-group col-md-6"></div> 
                <div class="form-group col-md-2"> 
                    <label for=""></label> 
                <button class="btn btn-success btn-block">Registrar</button> 
                <input type="hidden"  value="1" name="opcion"> 
                <br>
                 <a type="button" href="consultarTipoEvento.jsp" class="btn btn-warning btn-block">Consultar</a>
                

            </div> 
                </div> 
            </form> 
        </div> 
                         
           <div> 
            <% if (request.getAttribute("mensajeError")!=null) {%> 
            <div style="color: red; margin-left: 30px">${mensajeError}</div> 
            <%} else {%> 
            <div style="color: blue;  margin-left: 30px">${mensajeÉxito}</div> 
            <% } %> 

        </div> 
    </body> 
</html> 