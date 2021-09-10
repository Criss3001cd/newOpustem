<%-- 
    Document   : actualizarSancion
    Created on : 29/07/2021, 05:13:51 PM
    Author     : duban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModeloVO.SancionVO"%>
<%@page import="ModeloDAO.SancionDAO"%>
<%@page import="ModeloVO.TipoSancionVO"%>
<%@page import="ModeloDAO.TipoSancionDAO"%>
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
        </div>
                <center><h1>Actualizar Sanción</h1></center>
        <%
        SancionVO sanVO = (SancionVO)request.getAttribute("Sancion");
        if (sanVO != null){
        
        %>
        
        <div class="container">
            <form action="Sancion" method="POST">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="">Tipo Sanción</label>
                    <select name="textTipo" class="form-control" id="">
                        <option value="">Seleccione...</option>
                        <% 
                            
                         TipoSancionDAO TiSaDAO = new TipoSancionDAO();
                        for( TipoSancionVO TiSaVO: TiSaDAO.listar()){
                            
                    %>
                    <option value="<%=TiSaVO.getIdTipoSancion()%>" 
                            <%=TiSaVO.getIdTipoSancion().equals(sanVO.getIdTipoSancionFK()) ? "selected" : ""%>
                            ><%=TiSaVO.getNombreSancion()%></option>
                    <%
                    }
                    %>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="">Id Usuario:</label>
                    <input type="number" name="textIdUsuario" value="<%=sanVO.getIdUsuarioFK()%>" class="form-control">
                </div>
                <div class="form-group col-md-4">
                    <label for="">Id Evento:</label>
                    <input type="number" name="textIdEvento" value="<%=sanVO.getIdEventoFK()%>" class="form-control">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="">Fecha Sanción</label>
                    <input type="date" name="textFecha" value="<%=sanVO.getFechaSancion()%>" class="form-control">
                </div>
                <div class="form-group col-md-6">
                    <label for="">Hora Sanción:</label>
                    <input type="time" name="textHora" value="<%=sanVO.getHoraSancion()%>" class="form-control">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="">Descripcción:</label>
                    <textarea name="textDescripcion" class="form-control" value="<%=sanVO.getDescripcion()%>" id="" cols="10" rows="5"></textarea>
                </div>
                <input type="hidden" name="textId" value="<%=sanVO.getIdSancion()%>">
            </div>
            <div class="form-row">
                <div class="form-group col-md-4"></div>
                <div class="form-group col-md-6"></div>
                <div class="form-group col-md-2">
                    <label for=""></label>
                <button value="3" name="opcion" class="btn btn-info btn-block">Actualizar</button>
            </div>
            </div>
        </form>
        </div>
         <%}%>
        
       
        <a href="consultarSancion.jsp">Volver</a>
        
         <div>
            <% if (request.getAttribute("mensajeError")!=null) {%>
            <div style="color: red; margin-left: 30px">${mensajeError}</div>
            <%} else {%>
            <div style="color: blue;  margin-left: 30px">${mensajeÉxito}</div>
            <% } %>
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
