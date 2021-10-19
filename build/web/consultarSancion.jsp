<%-- 
    Document   : consultarSancion
    Created on : 17/10/2021, 01:09:59 PM
    Author     : duban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModeloDAO.TipoSancionDAO"%>
<%@page import="ModeloVO.TipoSancionVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloVO.SancionVO"%>
<%@page import="ModeloDAO.SancionDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html lang="en">


<!-- index.html  21 Nov 2019 03:44:50 GMT -->
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Consultar Sanción</title>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="assets/css/app.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/components.css">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="assets/css/custom.css">
  <link rel='shortcut icon' type='image/x-icon' href='assets/img/tem.ico' />
</head>

<body>
  <div class="loader"></div>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar sticky">
        <div class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
									collapse-btn"> <i data-feather="align-justify"></i></a></li>
            <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">
                <i data-feather="maximize"></i>
              </a></li>
            
          </ul>
        </div>
        <ul class="navbar-nav navbar-right">
        
          <li class="dropdown"><a href="#" data-toggle="dropdown"
              class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="assets/img/user.jpg"
                class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
            <div class="dropdown-menu dropdown-menu-right pullDown">
              <div class="dropdown-title">Usuario: <%=usuario%></div>
              <a href="profile.html" class="dropdown-item has-icon"> <i class="far
										fa-user"></i> Perfil
              </a>  
              <div class="dropdown-divider"></div>
              <form method="post" action="Sesiones">
                  <a class="dropdown-item has-icon text-danger" href="Sesiones"> <i class="fas fa-sign-out-alt"></i>
                Cerrar Sesión
              </a>

                </form>
              
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="index.html"> <img alt="image" src="assets/img/opus.png" class="header-logo" /> <span
                class="logo-name">Opustem</span>
            </a>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">Módulos</li>
            <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="users"></i><span>Usuarios</span></a>
            <ul class="dropdown-menu">
              <li><a class="nav-link" href="consultarUsuario.jsp">Consultar Usuarios</a></li>
              <li><a class="nav-link" href="registrarUser.jsp">Registrar Usuario NUEVO</a></li>
            </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="book"></i></i><span>Permisos</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="consultarPermiso.jsp">Consultar Permisos</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="calendar"></i></i><span>Eventos</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="consultarEvento.jsp">Consultar Eventos</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="alert-triangle"></i><span>Sanciones</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="consultarSancion.jsp">Consultar Sanciones</a></li>
                <li><a class="nav-link" href="registrarSancion.jsp">Registrar Sanción</a></li>
              </ul>
            </li>
          </ul>
        </aside>
      </div>
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Sanciones</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped" id="table-1">
                        <thead>
                          <tr>
                            <th class="text-center">
                              Id Sanción
                            </th>
                            <th>Tipo de Sanción</th>
                            <th>Nombre del Usuario</th>
                            <th>Id del Evento</th>
                            <th>Fecha de Sanción</th>
                            <th>Descipción</th>
                            <th>Acciones</th>
                          </tr>
                        </thead>
                        <%
                                   
                     SancionVO SanVO = new SancionVO();
                     SancionDAO SanDAO = new SancionDAO();
                     ArrayList<SancionVO>listaSanciones= SanDAO.listar();
                     for (int i = 0; i<listaSanciones.size(); i++){
                     
                         SanVO = listaSanciones.get(i); 
                     
                %>
                        <tbody>
            <tr>
                <%
                    
                TipoSancionDAO TiSanDAO = new TipoSancionDAO();
                TipoSancionVO TiSaVO = new TipoSancionVO();
                 TiSaVO = TiSanDAO.consultarId(SanVO.getIdTipoSancionFK());
                 
                 
                 UsuarioVO usuVO = new UsuarioVO();
                 UsuarioDAO usuDAO = new UsuarioDAO();
                 usuVO = usuDAO.consultarDatos(SanVO.getIdUsuarioFK());
                %>
                <th><%=SanVO.getIdSancion()%></th>
                <td><%=TiSaVO.getNombreSancion()%></td>
               
                <td><%=usuVO.getAliasUsuario()%></td>
                <td><%=SanVO.getIdEventoFK()%></td>
                <td><%=SanVO.getFechaSancion()%></td>
                <td><%=SanVO.getDescripcion()%></td>
                <td>
                    <form method="post" action="Sancion">
                        <input type="hidden" name="textId" value="<%=SanVO.getIdSancion()%>">
                    <button value="2" class="btn btn-warning btn-block" name="opcion" >Editar</button>
                    
                    <a class="btn btn-danger" href="/Sancion?opcion=4">Eliminar</a>
                    </form>
                </td>
            </tr>
        </tbody>
                        <% }%>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <div class="settingSidebar">
          <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
          </a>
          <div class="settingSidebar-body ps-container ps-theme-default">
            <div class=" fade show active">
              <div class="setting-panel-header">Setting Panel
              </div>
              <div class="p-15 border-bottom">
                <h6 class="font-medium m-b-10">Select Layout</h6>
                <div class="selectgroup layout-color w-50">
                  <label class="selectgroup-item">
                    <input type="radio" name="value" value="1" class="selectgroup-input-radio select-layout" checked>
                    <span class="selectgroup-button">Light</span>
                  </label>
                  <label class="selectgroup-item">
                    <input type="radio" name="value" value="2" class="selectgroup-input-radio select-layout">
                    <span class="selectgroup-button">Dark</span>
                  </label>
                </div>
              </div>
              <div class="p-15 border-bottom">
                <h6 class="font-medium m-b-10">Sidebar Color</h6>
                <div class="selectgroup selectgroup-pills sidebar-color">
                  <label class="selectgroup-item">
                    <input type="radio" name="icon-input" value="1" class="selectgroup-input select-sidebar">
                    <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                      data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                  </label>
                  <label class="selectgroup-item">
                    <input type="radio" name="icon-input" value="2" class="selectgroup-input select-sidebar" checked>
                    <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                      data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                  </label>
                </div>
              </div>
              <div class="p-15 border-bottom">
                <h6 class="font-medium m-b-10">Color Theme</h6>
                <div class="theme-setting-options">
                  <ul class="choose-theme list-unstyled mb-0">
                    <li title="white" class="active">
                      <div class="white"></div>
                    </li>
                    <li title="cyan">
                      <div class="cyan"></div>
                    </li>
                    <li title="black">
                      <div class="black"></div>
                    </li>
                    <li title="purple">
                      <div class="purple"></div>
                    </li>
                    <li title="orange">
                      <div class="orange"></div>
                    </li>
                    <li title="green">
                      <div class="green"></div>
                    </li>
                    <li title="red">
                      <div class="red"></div>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="p-15 border-bottom">
                <div class="theme-setting-options">
                  <label class="m-b-0">
                    <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                      id="mini_sidebar_setting">
                    <span class="custom-switch-indicator"></span>
                    <span class="control-label p-l-10">Mini Sidebar</span>
                  </label>
                </div>
              </div>
              <div class="p-15 border-bottom">
                <div class="theme-setting-options">
                  <label class="m-b-0">
                    <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                      id="sticky_header_setting">
                    <span class="custom-switch-indicator"></span>
                    <span class="control-label p-l-10">Sticky Header</span>
                  </label>
                </div>
              </div>
              <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                  <i class="fas fa-undo"></i> Restore Default
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
          <a href="templateshub.net">Templateshub</a></a>
        </div>
        <div class="footer-right">
        </div>
      </footer>
    </div>
  </div>
  <!-- General JS Scripts -->
  <script src="assets/js/app.min.js"></script>
  <!-- JS Libraies -->
  <script src="assets/bundles/datatables/datatables.min.js"></script>
  <script src="assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
  <script src="assets/bundles/jquery-ui/jquery-ui.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="assets/js/page/datatables.js"></script>
  <!-- Template JS File -->
  <script src="assets/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="assets/js/custom.js"></script>
</body>


<!-- datatables.html  21 Nov 2019 03:55:25 GMT -->
</html>
