package Controlador;


import ModeloDAO.PermisoDAO;
import ModeloVO.PermisoVO;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author user
 */
@WebServlet(name = "PermisoControlador", urlPatterns = {"/Permiso"})
public class PermisoControlador extends HttpServlet {



    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String IdPermiso = request.getParameter("textId");
        String IdTipoPermisoFK = request.getParameter("textTipo");
        String FechaSolicitud = request.getParameter("textFecha");
        String FechaPermiso = request.getParameter("textFechaP");
        String Descripcion = request.getParameter("textDescripcion");
        String HoraSalida = request.getParameter("textHora");
        String Regreso = request.getParameter("textRegreso");
        String EstadoPermiso = request.getParameter("textEstado");

        int opcion = Integer.parseInt(request.getParameter("opcion"));
        /*
        String Telefono= request.getParameter("textTel");
        String = request.getParameter("textNombre");
        int opcion = Integer.parseInt(request.getParameter("opcion"));
         */
        //2. Â¿QuiÃ©n tiene los datos del sistema?
        PermisoVO perVO = new PermisoVO(IdPermiso, IdTipoPermisoFK, FechaSolicitud, FechaPermiso, 
                Descripcion, HoraSalida, Regreso, EstadoPermiso);
        //3. Â¿QuiÃ©n hace las operaciones?
        PermisoDAO perDAO = new PermisoDAO(perVO);

        switch (opcion) {
            case 1: // Agregar//
                if (perDAO.agregarRegistro()) {
                    request.setAttribute("mensajeÉxito", "Permiso Registrado de forma correcta");
                } else {
                    request.setAttribute("mensajeError", "el Permiso no pudo ser registrado");

                }
                request.getRequestDispatcher("registrarPermiso.jsp").forward(request, response);
                break;

            case 2: //Actualizar Registro
                
                
                perVO = perDAO.consultarId(IdPermiso);
                if (perVO !=null) {
                    request.setAttribute("Permiso", perVO);
                    request.getRequestDispatcher("actualizarPermiso.jsp").forward(request, response);  
                }
                break;
                
              
            case 3:
                 if (perDAO.actualizarRegistro()) {
                    request.setAttribute("mensajeÉxito", "El permiso se actualizo correctamente");
                } else {
                    request.setAttribute("mensajeError", "El permiso  NO se actualizo correctamente");

                }
                request.getRequestDispatcher("actualizarPermiso.jsp").forward(request, response);
                break;
            
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

