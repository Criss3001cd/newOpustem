<%-- 
    Document   : registrarEvento
    Created on : 6/09/2021, 12:37:25 AM
    Author     : juanc
--%>

<%@page import="ModeloVO.TipoEventoVO"%> 
<%@page import="ModeloDAO.TipoEventoDAO"%> 
<%@page import="ModeloVO.UsuarioVO"%>
<%@page import="ModeloDAO.UsuarioDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%> 


<!DOCTYPE html> 

<html> 
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="css/style.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
    <title>Paginacion</title>
</head>
<body>
    <div class="sidebar">
    <div class="logo-details">
        
      <i class='bx bxs-time-five icon' ></i>
      <a href="menu.jsp">
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
       <a href="consultar">
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

                <h1 class="text-light font-italic">Bienvenido:</h1>
                <form method="post" action="Sesiones">
                    <button type="submit" class="btn btn-secondary mb-2">Cerrar Sesión</button>

                </form>
            </nav>
        </div>
        <center><h1>Registrar Eventos</h1></center>
                    
        <div class="container"> 
            <form action="Evento" method="post"> 
                <div class="form-row"> 
                    <div class="form-group col-md-4"> 
                        <label for="">Usuario</label> 

                        <br> 
                        <input type="numb" class="form-control" required="required" name="textIdUsuarioFK"> 

                    </div> 
                    <div class="form-group col-md-4"> 
                        <label for="">Fecha</label> 

                        <br> 
                        <input type="date" class="form-control" required="required" name="textFechaEvento"> 
                    </div> 

                    <div class="form-group col-md-4"> 
                        <label for="">Hora</label> 
                        <br> 
                        <input type="time" class="form-control" required="required" name="textHoraEvento"> 
                    </div> 
                   
                    <div class="form-group col-md-4"> 
                        <label for="">Tipo de evento</label> 
                        
                        <select class="form-control" name="textIdTipoEventoFK" id=""> 
                            <option value="">Seleccione...</option> 

                            <%  
                            
                        TipoEventoDAO tieveDAO = new TipoEventoDAO(); 
                        for( TipoEventoVO tieveVO: tieveDAO.listar()){ 

                             
                    %> 
                    <option value="<%=tieveVO.getIdTipoEvento()%>"><%=tieveVO.getNombreEvento()%></option> 
                    <% 
                    } 
                    %> 

                        </select> 
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
                   
                   
                    <button  class="btn btn-primary btn-block">Registrar</button> 
                    
                <input type="hidden"  value="1" name="opcion"> 
               
                <br>
                 <a type="button" href="consultarEvento.jsp" class="btn btn-info btn-block">Consultar</a>
                

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
    </section>
    </body> 
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
</html> 
