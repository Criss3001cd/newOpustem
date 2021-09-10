<%-- 
    Document   : consultarTipoEvento
    Created on : 6/09/2021, 12:38:33 AM
    Author     : juanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModeloDAO.TipoEventoDAO"%> 
<%@page import="ModeloVO.TipoEventoVO"%> 
<%@page import="java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Menú</title> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">    
         <style>
        th,td {
            padding: 0.4rem !important;
        }
        body>div {
            box-shadow: 10px 10px 8px #888888;
            border: 2px solid black;
            border-radius: 10px;
        }
    </style>
    <title>Paginacion</title>
    </head> 
    <body> 
    <center> 
        <h1>Tipo de Eventos</h1> 
        <form method="post" action="TipoEvento"> 
            <table> 
                <tr> 
                    <th> 
                        IdTipoEvento 
                        <input type="text" name="textIdTipoEvento"> 
                    </th> 
                </tr> 
            </table><br><br> 
            <button>Consultar</button> 
            <input type="hidden" value="2" name="opcion"> 
        </form> 
    </center>   
        <div class="container" style="margin-top: 10px;padding: 5px">
        <table id="tablax" class="table table-striped table-bordered" style="width:100%">
        <thead>
                <th>Id Tipo Evento</th> 
                <th>Nombre Evento</th> 
                <th>Descripcion</th> 
                
    </thead>
                    <%                     
                     TipoEventoVO tieveVO = new TipoEventoVO(); 
                     TipoEventoDAO tieveDAO = new TipoEventoDAO(); 
                     ArrayList<TipoEventoVO>listaTipoEventos= tieveDAO.listar(); 
                     for (int i = 0; i<listaTipoEventos.size(); i++){                       
                         tieveVO = listaTipoEventos.get(i);                        
                        %> 
                 <tbody>
                    <tr> 
            
                <th><%=tieveVO.getIdTipoEvento()%></th> 
                <td><%=tieveVO.getNombreEvento()%></td>          
                <td><%=tieveVO.getDescripcion()%></td> 
                <td> 
                    <a href ="actualizarTipoEvento.jsp" class="btn btn-warning" value="2" name="opcion">Editar</a> 
                    <a class="btn btn-danger" value="3" name="opcion">Eliminar</a> 
                </td> 
            </tr> 
    </tbody>
            <% }%> 
        </table> 
        </div>
    </form> 
         <div class="form-group col-md-2"> 
        <a class="btn btn-warning btn-block" type="button" href="registrarTipoEvento.jsp">Registrar</a> 
         </div>
</div> 

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
                    lengthMenu: "Agrupar de MENU items",
                    info: "Mostrando del item START al END de un total de TOTAL items",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de MAX elementos en total)",
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
         
    </body> 
</html>

