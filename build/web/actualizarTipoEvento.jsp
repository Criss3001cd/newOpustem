<%-- 
    Document   : actualizarTipoEvento
    Created on : 6/09/2021, 12:48:09 AM
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
        <div class="container"> 
             
        <h1>Actualizar Tipo Evento</h1> 
        <% 
        TipoEventoVO tieveVO = (TipoEventoVO)request.getAttribute("TipoEvento"); 
        if (tieveVO != null){ 
         
        %> 
            <form action="TipoEvento" method="POST"> 
            <div class="form-row"> 
                <div class="form-group col-md-6"> 
                    <label for="">Nombre del Evento</label> 
                    <input type="numb" name="textNombreEvento" value="<%=tieveVO.getNombreEvento()%>" class="form-control"> 
                </div> 
                
            </div> 
            <div class="form-row"> 
                <div class="form-group col-md-12"> 
                    <label for="">Descripción:</label> 
                    <textarea name="textDescripcion" class="form-control" value="<%=tieveVO.getDescripcion()%>" id="" cols="10" rows="5"></textarea> 
                </div> 
                <input type="hidden" name="textIdTipoEvento" value="<%=tieveVO.getIdTipoEvento()%>"> 

            </div> 
            <div class="form-row"> 
                <div class="form-group col-md-4"></div> 
                <div class="form-group col-md-6"></div> 
                <div class="form-group col-md-2"> 
                    <label for=""></label> 
                <button value="3" name="opcion" class="btn btn-success btn-block">Actualizar</button> 
                <a class="btn btn-warning btn-block" type="button" href="consultarTipoEvento.jsp">Volver</a> 
       
            </div> 
            </div> 
        </form> 
        </div> 
         <%}%>
             
         <div> 
            <% if (request.getAttribute("mensajeError")!=null) {%> 
            <div style="color: red; margin-left: 30px">${mensajeError}</div> 
            <%} else {%> 
            <div style="color: blue;  margin-left: 30px">${mensajeÉxito}</div> 
            <% } %> 
        </div> 
        >
    </body> 
</html> 