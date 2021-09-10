/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import ModeloDAO.TipoEventoDAO;
import ModeloVO.TipoEventoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juanc
 */
@WebServlet(name = "TipoEventoControlador", urlPatterns = {"/TipoEvento"})
public class TipoEventoControlador extends HttpServlet {

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
        String IdTipoEvento = request.getParameter("textIdTipoEvento"); 
        String NombreEvento = request.getParameter("textNombreEvento");  
        String Descripcion = request.getParameter("textDescripcion"); 
         
        int opcion = Integer.parseInt(request.getParameter("opcion")); 
         
        TipoEventoVO tieveVO = new TipoEventoVO(IdTipoEvento, NombreEvento, Descripcion); 
        TipoEventoDAO tieveDAO = new TipoEventoDAO(tieveVO); 
        
        switch(opcion){ 
         
            case 1: 
                if(tieveDAO.agregarRegistro()){ 
                    request.setAttribute("mensajeÉxito", "Tipo Evento registrado de forma exitosa"); 
                }else{ 
                    request.setAttribute("mensajeError", "El Tipo Evento no se pudo registrar"); 
                } 
                request.getRequestDispatcher("registrarTipoEvento.jsp").forward(request, response); 
                break; 
                 
                case 2: 
                tieveVO = tieveDAO.consultarIdTipoEvento(IdTipoEvento); 
                if (tieveVO !=null) { 
                    request.setAttribute("TipoEvento", tieveVO); 
                    request.getRequestDispatcher("actualizarTipoEvento.jsp").forward(request, response);   

                } 
                break; 
                 
                case 3: 
                 if (tieveDAO.actualizarRegistro()) { 
                    request.setAttribute("mensajeÉxito", "El evento se actualizó correctamente"); 

                } else { 
                    request.setAttribute("mensajeError", "El evento  NO se actualizó correctamente"); 

                } 
                request.setAttribute("TipoEvento", tieveVO); 
                request.getRequestDispatcher("actualizarTipoEvento.jsp").forward(request, response); 

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