<%-- 
    Document   : actualizarUser
    Created on : 29/07/2021, 01:55:39 PM
    Author     : JUAN DAVID PACHON
--%>

<%@page import="ModeloVO.TurnoVO"%>
<%@page import="ModeloDAO.TurnoDAO"%>
<%@page import="ModeloVO.CargoVO"%>
<%@page import="ModeloDAO.CargoDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<%@include file="Sesiones.jsp" %>
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
         <title>Actualizar Usuario</title>
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
        <center><h1>Actualizar Usuario</h1></center>
        <%
        UsuarioVO usuVO = (UsuarioVO)request.getAttribute("Usuario");
        if (usuVO != null){
        
        %>
        <div class="container">
        <form method="post" action ="Usuario">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label  for=""> Usuario:</label><br>
                    <input type="text" class="form-control" value="<%=usuVO.getAliasUsuario()%>" name="textUsuario" placeholder="Ingrese aquí su alias de Usuario"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Nombre:</label><br>
                    <input type="text" class="form-control" value="<%=usuVO.getNombreUsuario()%>" name="textNombre" placeholder="Digite su nombre"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Apellido:</label><br>
                    <input type="text" class="form-control" value="<%=usuVO.getApellidoUsuario()%>" name="textApellido" placeholder="Digite su apellido"><br>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for=""> Fecha de Nacimiento:</label><br>
                    <input type="date" class="form-control" value="<%=usuVO.getFechaNacimiento()%>" name="textFecha"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Correo:</label><br>
                    <input type="mail" class="form-control" value="<%=usuVO.getCorreoUsuario()%>" name="textCorreo" placeholder="Digite su correo"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Clave:</label><br>
                    <input type="password" class="form-control" value="<%=usuVO.getClaveUsuario()%>" name="textClave" placeholder="Digite una clave segura"><br>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for=""> Tipo de  Documento:</label><br>
                    <select class="form-control" value="<%=usuVO.getTipoDocumento()%>" name="textTipoDoc" id="">
                        <option value="#">Seleccione...</option>
                        <option value="C.C">Cédula de ciudadanía</option>
                        <option value="C.E">Cédula de Extranjería</option>
                        <option value="T.I">Tarjeta de Identidad</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Número Documento:</label><br>
                    <input type="number" class="form-control" value="<%=usuVO.getNumeroDocumento()%>" name="textDocumento" placeholder="Digite su número de documento"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for=""> Dirección de Residencia:</label><br>
                    <input type="text" class="form-control" value="<%=usuVO.getDireccionUsuario()%>" name="textDireccion" placeholder="Digite su dirección"><br>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="">Teléfono:</label><br>
                    <input type="number" class="form-control" value="<%=usuVO.getTelefono()%>" name="textTelefono" placeholder="Digite su número de teléfono"><br>
                </div>
                <div class="form-group col-md-4">
                    <label for="">Cargo:</label>
                   <select name="textCargo" value="<%=usuVO.getIdCargoFK()%>" class="form-control" id="">
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
                   <select name="textTurno" value="<%=usuVO.getIdTurnoFK()%>" class="form-control" id="">
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
                   <div class="form-group col-md-4">
                    <label for=""> Estado:</label><br>
                    <select class="form-control" name="textEstado" value="<%=usuVO.getEstado()%>" id="">
                        <option value="#">Seleccione</option>
                        <option value="Activo">Activo</option>
                        <option value="Inactivo">Inactivo</option>
                      
                    </select>
                </div>
                   <input type="hidden" name="textId" value="<%=usuVO.getIdUsuario()%>">
                </div>
            </div>        
            <div class="form-row">
                <div class="form-group col-md-4"></div>
                <div class="form-group col-md-6"></div>
                <div class="form-group col-md-2">
                    <label for=""></label>
                <button class="btn btn-info btn-block col-md-2">Actualizar</button>
                <input type="hidden"  value="2" name="opcion">
            </div>
            </div>
        </form>    
        
        
</div>
        <% }%>
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


<a href="consultarUsuario.jsp">Volver</a>



        <div>
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
    </body>
</html>
