<%-- 
    Document   : consultarUsuario
    Created on : 29/07/2021, 08:18:44 PM
    Author     : JUAN DAVID PACHON
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
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
            <center><h1>Consultar Usuarios</h1>
                </center>
            <center>
        <form method="post" action="Usuario" >
            <table  class="tablaDeFormulario">
                <tr>
                    
                <th>
                    Cédula<br>
                    <input type="number" name="textDocumento"><br>
                  
                  
                </th>
                </tr>
            </table><br>
            <button class="btn btn-info btn-block col-md-2">Consultar</button>
            <input type="hidden"  value="4" name="opcion">
        </form>
             
        </center>
        
        <div>
            <% if(request.getAttribute("mensajeError")!=null){%>
            <div style="color:red;">${mensajeError}</div>
            <%}else{%>
            <div style="color: blue;">${mensajeÉxito}</div><%}%>
        </div><br><br>
                <div class="container" style="margin-top: 10px;padding: 5px">
                <table id="tablax" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <th>Id Usuario</th>
                    <th>Alias</th>
                    <th>Nombre</th>
                    <th>Apelllido</th>
                    <th>Fecha Nacimiento</th>
                    <th>Correo</th>
                    <th>Clave</th>
                    <th>Tipo De documento</th>
                    <th>Numero De documento</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Cargo</th>
                    <th>Turno</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                        <tr>
                            <%

                                UsuarioVO UsuVO = new UsuarioVO();
                UsuarioDAO UsuDAO = new UsuarioDAO(UsuVO); 
              
                ArrayList<UsuarioVO>listaUsuarios= UsuDAO.listar();
                for (int i=0; i<listaUsuarios.size(); i++){
                    UsuVO = listaUsuarios.get(i);
                
                
                            %>
                            <th><%=UsuVO.getIdUsuario()%></th>
                    <td><%=UsuVO.getAliasUsuario()%></td>
                    <td><%=UsuVO.getNombreUsuario()%></td>
                    <td><%=UsuVO.getApellidoUsuario()%></td>
                    <td><%=UsuVO.getFechaNacimiento()%></td>
                    <td><%=UsuVO.getCorreoUsuario()%></td>
                    <td><%=UsuVO.getClaveUsuario()%></td>
                    <td><%=UsuVO.getTipoDocumento()%></td>
                    <td><%=UsuVO.getNumeroDocumento()%></td>
                    <td><%=UsuVO.getDireccionUsuario()%></td>
                    <td><%=UsuVO.getTelefono()%></td>
                    <td><%=UsuVO.getNombreCargo()%></td>
                    <td><%=UsuVO.getIdTurnoFK()%></td>
                    <td><%=UsuVO.getEstado()%></td>
                            <td>
                                <form method="post" action="Usuario">
                                    <input type="hidden" name="textId" value="<%=UsuVO.getIdUsuario()%>">
                                    <button value="2" class="btn btn-warning btn-block" name="opcion" >Editar</button>

                                    <a class="btn btn-danger" href="/Sancion?opcion=4">Eliminar</a>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                    <% }%>
                </table>
            </div>
                <div class="form-row">
                <div class="form-group col-md-4"></div>
                <div class="form-group col-md-6"></div>
                <div class="form-group col-md-2">
                    <label for=""></label>
                <a href="registrarUser.jsp" class="btn btn-primary btn-block" >Registrar Usuario</a>
            </div>
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

            closeBtn.addEventListener("click", () => {
                sidebar.classList.toggle("open");
                menuBtnChange();//calling the function(optional)
            });

            searchBtn.addEventListener("click", () => { // Sidebar open when you click on the search iocn
                sidebar.classList.toggle("open");
                menuBtnChange(); //calling the function(optional)
            });

            // following are the code to change sidebar button(optional)
            function menuBtnChange() {
                if (sidebar.classList.contains("open")) {
                    closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
                } else {
                    closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");//replacing the iocns class
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
                    lengthMenu: [[10, 25, -1], [10, 25, "All"]],
                });
            });
        </script>
    </body>
</html>