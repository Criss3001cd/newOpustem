<%-- 
    Document   : consultarTipoPermiso
    Created on : 5/09/2021, 06:38:43 PM
    Author     : user
--%>

<%@page import="ModeloDAO.TipoPermisoDAO"%>
<%@page import="ModeloVO.TipoPermisoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%@page import="ModeloVO.UsuarioVO"%>
<%@page import="ModeloDAO.UsuarioDAO"%>


<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html lang="en">
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
                <center><h1>Consultar Tipos de Permisos</h1>
                <a href="registrarPermiso.jsp" class="btn btn-info btn-block col-md-2" >Registrar un Permiso</a></center>
    <div class="container" style="margin-top: 10px;padding: 5px">
    <table id="tablax" class="table table-striped table-bordered" style="width:100%">
        <thead>
                <th>Id Tipo Permiso</th>
                <th>Nombre Permiso</th>
                <th>Descripccion</th>
               
            </thead>
                <%
                                   
                    TipoPermisoVO TiPerVO = new TipoPermisoVO();
                     TipoPermisoDAO TiPerDAO = new TipoPermisoDAO();
                     ArrayList<TipoPermisoVO>listaPermisos= TiPerDAO.listar();
                     for (int i = 0; i<listaPermisos.size(); i++){
                     
                         TiPerVO = listaPermisos.get(i); 
                     
                %>
         <tbody>
             <tr>
                 

                <th><%=TiPerVO.getIdTipoPermiso()%></th>
                <td><%=TiPerVO.getNombrePermiso()%></td>              
           
                <td><%=TiPerVO.getDescripcion()%></td>
               
             
                <td>
                    <form method="post" action="Permiso">
                        <input type="hidden" name="textId" value="<%=TiPerVO.getIdTipoPermiso()%>">
                    <button value="5" class="btn btn-warning btn-block" name="opcion" >Editar</button>
                    
                    <a class="btn btn-danger" href="/Permiso?opcion=4">Eliminar</a>
                    </form>
                </td>
            </tr>
             </tbody>
            <% }%>
              
        </table>
</div>
            </section>

    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
    <!-- DATATABLES -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
    </script>
    <!-- BOOTSTRAP -->
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
    </script>
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
    <script>
        $(document).ready(function () {
            $('#tablax').DataTable({
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Agrupar de _MENU_ items",
                    info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu busqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
                scrollY: 400,
                lengthMenu: [ [10, 25, -1], [10, 25, "All"] ],
            });
        });
    </script>
<a href="menu.jsp">Volver</a>
    </body>
</html>
