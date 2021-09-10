/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.SancionDAO;
import ModeloVO.SancionVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duban
 */
@WebServlet(name = "SancionControlador", urlPatterns = {"/Sancion"})
public class SancionControlador extends HttpServlet {

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
        
        String IdSancion = request.getParameter("textId");
        String IdTipoSancionFK = request.getParameter("textTipo");
        String IdUsuarioFK = request.getParameter("textIdUsuario");
        String IdEventoFK = request.getParameter("textIdEvento");
        String FechaSancion = request.getParameter("textFecha");
        String HoraSancion = request.getParameter("textHora");
        String Descripcion = request.getParameter("textDescripcion");
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        
        SancionVO sanVO = new SancionVO(IdSancion, IdTipoSancionFK, IdUsuarioFK, IdEventoFK, 
                                        FechaSancion, HoraSancion, Descripcion);
        
        SancionDAO sanDAO =new SancionDAO(sanVO);
        
        
        switch (opcion){
            case 1:
                if(sanDAO.agregarRegistro()){
                    request.setAttribute("mensajeÉxito", "Sanción registrada de forma exitosa");
                }else{
                    request.setAttribute("mensajeError", "La sanción no se pudo registrar");
                }
                request.getRequestDispatcher("registrarSancion.jsp").forward(request, response);
                break;
            case 2: //Actualizar Registro
                
                
                sanVO = sanDAO.consultarId(IdSancion);
                if (sanVO !=null) {
                    request.setAttribute("Sancion", sanVO);
                    request.getRequestDispatcher("actualizarSancion.jsp").forward(request, response);  
                }
                break;
                
              
            case 3:
                 if (sanDAO.actualizarRegistro()) {
                    request.setAttribute("mensajeÉxito", "La sanción se actualizó correctamente");
                } else {
                    request.setAttribute("mensajeError", "La sanción  NO se actualizó correctamente");

                }
                request.getRequestDispatcher("actualizarSancion.jsp").forward(request, response);
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
