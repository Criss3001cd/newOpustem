<%-- 
    Document   : Sesiones
    Created on : 27/06/2021, 08:12:25 PM
    Author     : duban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModeloVO.UsuarioVO"%>
<!DOCTYPE html>

<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
    response.setDateHeader("Expires", 0);

%>

<%    HttpSession buscarSesion = (HttpSession) request.getSession();
    String usuario = "";
    if (buscarSesion.getAttribute("datos") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } else {
        UsuarioVO usuVO = (UsuarioVO) buscarSesion.getAttribute("datos");
        usuario = usuVO.getAliasUsuario();

    }


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel='shortcut icon' type='image/x-icon' href='assets/img/tem.ico' />
    </head>
    <body>
        
    </body>
</html>