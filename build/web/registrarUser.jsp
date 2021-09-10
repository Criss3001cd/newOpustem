<%-- 
    Document   : registrarUser
    Created on : 29/07/2021, 01:51:34 PM
    Author     : JUAN DAVID PACHON
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="ModeloVO.CargoVO"%>
<%@page import="ModeloVO.TurnoVO"%>
<%@page import="ModeloDAO.CargoDAO"%>
<%@page import="ModeloDAO.TurnoDAO"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <!--<title> Responsive Sidebar Menu  | CodingLab </title>-->
    <link rel="stylesheet" href="css/style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  <div class="sidebar">
    <div class="logo-details">
        <a href="menu.jsp">
      <i class='bx bxs-time-five icon' ></i>
        <div class="logo_name">Opustem</div>
        </a>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
      <li>
       <a href="consultarUsuario.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">Usuarios</span>
       </a>
       <span class="tooltip">Usuarios</span>
     </li>
     <li>
       <a href="consultarPermiso.jsp">
         <i class='bx bxs-spreadsheet' ></i>
         <span class="links_name">Permisos</span>
       </a>
       <span class="tooltip">Permisos</span>
     </li>
     <li>
       <a href="consultarEvento.jsp">
         <i class='bx bxs-calendar-event' ></i>
         <span class="links_name">Eventos</span>
       </a>
       <span class="tooltip">Eventos</span>
     </li>
     <li>
       <a href="consultarSancion.jsp">
         <i class='bx bxs-info-square'></i>
         <span class="links_name">Sanciones</span>
       </a>
       <span class="tooltip">Sanciones</span>
     </li>
     <li class="profile">
         <div class="profile-details">
           <img src="profile.jpg" alt="profileImg">
           <div class="name_job">
             <div class="name">Prem Shahi</div>
             <div class="job">Web designer</div>
           </div>
         </div>
         <i class='bx bx-log-out' id="log_out" ></i>
     </li>
    </ul>
  </div>
  <section class="home-section">
      <div class="container col-md-12">
          <nav class="navbar navbar-light" style="border-radius: 20px; background-color: #160E75;">

                <h1 class="text-light font-italic">Bienvenido: <%=usuario%></h1>
                <form method="post" action="Sesiones">
                    <button type="submit" class="btn btn-secondary mb-2">Cerrar Sesión</button>

                </form>
            </nav>
                <center><h1>Registro de Usuario</h1></center>
               <div class="container">
        <form method="post" action ="Usuario">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label  for=""> Usuario:</label><br>
                    <input type="text" class="form-control" name="textUsuario" placeholder="Ingrese aquí su alias de Usuario"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Nombre:</label><br>
                    <input type="text" class="form-control" name="textNombre" placeholder="Digite su nombre"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Apellido:</label><br>
                    <input type="text" class="form-control" name="textApellido" placeholder="Digite su apellido"><br>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for=""> Fecha de Nacimiento:</label><br>
                    <input type="date" class="form-control" name="textFecha"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Correo:</label><br>
                    <input type="mail" class="form-control" name="textCorreo" placeholder="Digite su correo"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Clave:</label><br>
                    <input type="password" class="form-control" name="textClave" placeholder="Digite una clave segura"><br>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for=""> Tipo de  Documento:</label><br>
                    <select class="form-control" name="textTipoDoc" id="">
                        <option value="#">Seleccione...</option>
                        <option value="C.C">Cédula de ciudadanía</option>
                        <option value="C.E">Cédula de Extranjería</option>
                        <option value="T.I">Tarjeta de Identidad</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Número Documento:</label><br>
                    <input type="number" class="form-control" name="textDocumento" placeholder="Digite su número de documento"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Dirección de Residencia:</label><br>
                    <input type="text" class="form-control" name="textDireccion" placeholder="Digite su dirección"><br>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="">Teléfono:</label><br>
                    <input type="number" class="form-control" name="textTelefono" placeholder="Digite su número de teléfono"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for="">Cargo:</label>
                   <select name="textCargo" class="form-control" id="">
                        <option value="">Seleccione Su Cargo...</option>
                        <% 
                            
                         CargoDAO CarDAO = new CargoDAO();
                        for( CargoVO carVO: CarDAO.listar()){
                            
                    %>
                    <option value="<%=carVO.getIdCargoFK()%>"><%=carVO.getNombreCargo()%></option>
                    <%
                    }
                    %>
                   </select><br>
                </div>
                <div class="form-group col-md-4">
                    <label for="">Turno:</label>
                   <select name="textTurno" class="form-control" id="">
                        <option value="">Seleccione Su Turno...</option>
                        <% 
                            
                         TurnoDAO TurDAO = new TurnoDAO();
                        for( TurnoVO turVO: TurDAO.listar()){
                            
                    %>
                    <option value="<%=turVO.getIdTurnoFK()%>"><%=turVO.getIdTurnoFK()%></option>
                    
                    <%
                    }
                    %>
                   </select><br>
                </div>
                   </div>  
                   <div class="form-row">
                        
                   
                    <div class="form-group col-md-4">
                    <label for=""> Estado:</label><br>
                    <select class="form-control" name="textEstado" id="">
                        <option value="#">Seleccione</option>
                        <option selected value="Activo">Activo</option>
                        <option value="Inactivo">Inactivo</option>
                      
                    </select>
                </div>
                   </div>
                  
            <div class="form-row">
                <div class="form-group col-md-4"></div>
                <div class="form-group col-md-6"></div>
                <div class="form-group col-md-2">
                    <label for=""></label>
                <button class="btn btn-info btn-block">Registrar</button>
                <input type="hidden"  value="1" name="opcion">
            </div>
            </div>
        </form>    
        
        
</div>







<div>
            
            <% if (request.getAttribute("mensajeError2")!= null){%>
            <div style="color: red;">
                ${mensajeError2}
                 
            </div>
            <%} %>
            
            <% if (request.getAttribute("mensajeError3")!= null){%>
            <div style="color: red;">
                ${mensajeError3}
                 
            </div>
            <%} %>
            
            <% if (request.getAttribute("mensajeError4")!= null){%>
            <div style="color: red;">
                ${mensajeError4}
                 
            </div>
            <%} %>
            
            
            
            <% if (request.getAttribute("mensajeError")!= null){%>
            <div style="color: red;">
                ${mensajeError}
                 
            </div>
            <%} else {%>
            <div style="color: blue">
                ${mensajeÉxito}
            </div>
                <% }%>
            
        </div>
  </section>
  <script>
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");

  closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

  searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
    sidebar.classList.toggle("open");
    menuBtnChange(); //calling the function(optional)
  });

  // following are the code to change sidebar button(optional)
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
   }
  }
  </script>
</body>
</html>
